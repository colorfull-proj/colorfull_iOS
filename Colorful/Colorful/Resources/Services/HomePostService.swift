//
//  HomePostService.swift
//  Colorful
//
//  Created by 박주연 on 2020/12/10.
//

import Foundation
import Alamofire

class HomePostService{
    
//    static let shared = HomePostService()
//    
//    func HomePost(completion: @escaping (NetworkResult<Any>) -> Void) {
//        let header: HTTPHeaders = ["Content-Type": "application/json"]
//        
//        let HomePostURL = APIConstants.homePost
//        
//        Alamofire.request(HomePostURL).responseJSON{
//            response in
//            
//            switch response.result {
//                
//            case .success:
//                if response.result.value != nil {
//                    
//                    if let status = response.response?.statusCode {
//                        switch status {
//                        case 200:
//                            guard let data = response.data else { return }
//                            
//                            do {
//                                let decoder = JSONDecoder()
//                                let object = try decoder.decode(HomePostData.self, from: data)
//                                
//                                if object.success == true {
//                                    print("통신 성공!!!")
//                                    completion(.success(object.data))
//                                } else {
//                                    print("통신 안 됨")
//                                }
//                                
//                            } catch (let err){
//                                print(err.localizedDescription)
//                                //                                completion(.failure(err))
//                            }
//                        case 400:
//                            completion(.pathErr)
//                        case 500:
//                            completion(.serverErr)
//                        default:
//                            break
//                        }// switch
//                    }// if let
//                }
//                break
//                
//            // 통신 실패
//            case .failure(let err):
//                print(err.localizedDescription)
//                completion(.networkFail)
//                print("통신failure")
//                // .networkFail이라는 반환 값이 넘어감
//                break
//                
//            }
//        }
//        
//    }
}

