//
//  CarouselLayout.swift
//  Colorful
//
//  Created by 윤동민 on 2020/12/11.
//

import UIKit

class CarouselLayout: UICollectionViewFlowLayout {
    var sideItemScale: CGFloat = 0.5
    var sideItemAlpha: CGFloat = 0.5
    var spacing: CGFloat = 10
    
    var isSetting: Bool = false
    
    override func prepare() {
        super.prepare()
        guard !isSetting else { return }
        setLayout()
        isSetting = true
    }
    
    private func setLayout() {
        self.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        guard let collectionView = self.collectionView else { return }
        let itemWidth = collectionView.bounds.width-50*2
        self.itemSize = CGSize(width: itemWidth, height: itemWidth*1.5)
        
        let scaledItemOffset = (itemWidth - itemWidth*self.sideItemScale) / 2
        self.minimumLineSpacing = spacing - scaledItemOffset
        
        self.scrollDirection = .horizontal
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let attributes = super.layoutAttributesForElements(in: rect) else { return nil }
        return attributes.map({ transform(attributes: $0) })
    }
    
    private func transform(attributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        guard let collectionView = self.collectionView else { return attributes }
        
        let collectionViewCenter = collectionView.frame.size.width / 2
        let contentOffset = collectionView.contentOffset.x
        let center = attributes.center.x - contentOffset
        
        let maxDistance = self.itemSize.width + self.minimumLineSpacing
        
        let distance = min(abs(collectionViewCenter - center), maxDistance)
        
        let ratio = (maxDistance - distance)/maxDistance
        
        let alpha = ratio * (1 - self.sideItemAlpha) + self.sideItemAlpha
        let scale = ratio * (1 - self.sideItemScale) + self.sideItemScale
        
        attributes.alpha = alpha
        
        let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
        let dist = attributes.frame.midX - visibleRect.midX
        var transform = CATransform3DScale(CATransform3DIdentity, scale, scale, 1)
        transform = CATransform3DTranslate(transform, 0, 0, -abs(dist/1000))
        attributes.transform3D = transform
        
        return attributes
    }
}
