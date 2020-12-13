//
//  SigninService.swift
//  Colorful
//
//  Created by 윤동민 on 2020/12/14.
//

import Foundation
import Alamofire

protocol ParameterAble {
    func makeParameters() -> Parameters
}

struct SigninParameter: ParameterAble {
    let id: String
    let password: String
    
    func makeParameters() -> Parameters {
        return [
            "id": id,
            "password": password
        ]
    }
}

struct SigninBody: Codable {
    let user: User
}

struct User: Codable {
    let uid: String
    let id: String
    let password: String
    let type: String
    let name: String
    let gender: String
    let age: String
    let description: String
    let createdAt: Int
    let updatedAt: Int
    let lastLoginedAt: Int
}

struct SigninService {
    static let shared = SigninService()
    
    private init() { }
    
    func requestSignin(_ parameters: SigninParameter) {
        let headers: HTTPHeaders = [
            "Content-Type": "Application/json"
        ]
        
        let signin = "http://ec2-13-124-127-8.ap-northeast-2.compute.amazonaws.com:3000" + "/api/users/signin"
        
        AF.request(signin, method: .post, parameters: parameters.makeParameters(), encoding: JSONEncoding.default,
                   headers: headers)
            .validate(statusCode: 200...500)
            .responseDecodable(of: ResponseData<SigninBody>.self) { response in
                switch response.result {
                case .success(let data):
                    print(data)
                case .failure(let err):
                    print(err.localizedDescription)
                    
                }
            }
            
    }
}
