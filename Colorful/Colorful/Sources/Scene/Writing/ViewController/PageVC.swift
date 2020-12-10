//
//  PageVC.swift
//  Colorful
//
//  Created by 박주연 on 2020/12/10.
//

import UIKit

class PageVC: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    

    var pageDelegate: PageIndexDelegate?
    var pendingPage: Int?
    let identifiers: NSArray = ["AllVC", "AgeVC", "GenderVC"]

    lazy var VCArray: [UIViewController] = {
        return [self.VCInstance(name: "AllVC"),
                self.VCInstance(name: "AgeVC"),
                self.VCInstance(name: "GenderVC")]
    }()

    required init?(coder aDecoder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)

    }

    private func VCInstance(name: String) -> UIViewController {
        return UIStoryboard(name: "Writing", bundle: nil).instantiateViewController(identifier: name)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for view in self.view.subviews{
            if view is UIScrollView{
                view.frame = UIScreen.main.bounds
            }else if view is UIPageControl{
                view.backgroundColor = UIColor.clear
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        self.delegate = self

        if let firstVC = VCArray.first{
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
     
        guard let viewControllerIndex = VCArray.firstIndex(of: viewController) else { return nil }

               let previousIndex = viewControllerIndex - 1
               //        print(previousIndex)

               if previousIndex < 0 {
                   return VCArray.last
               } else {
                   return VCArray[previousIndex]
               }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = VCArray.firstIndex(of: viewController) else { return nil }
             let nextIndex = viewControllerIndex + 1

             if nextIndex >= VCArray.count {
                 return VCArray.first
             } else {
                 return VCArray[nextIndex]
             }
        
    }
    
    public func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return VCArray.count
    }
    
    public func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first, let firstViewControllerIndex = VCArray.index(of: firstViewController) else{
            return 0
        }
        
        return 0
    }
}
