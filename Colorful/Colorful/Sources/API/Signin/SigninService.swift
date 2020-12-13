//
//  SigninService.swift
//  Colorful
//
//  Created by 윤동민 on 2020/12/14.
//

import Foundation
import Alamofire

struct SigninParameter: ParameterAble {
    let id: String
    let password: String
    
    func makeParameter() -> Parameters {
        return [
            "id": id,
            "password": password
        ]
    }
}

struct SigninService {
    static let shared = SigninService()
    
    private init() { }
    
    func requestSignin(_ parameters: SigninParameter) {
        let headers: HTTPHeaders = [
            "Content-Type": "Application/json"
        ]
        
        
        
            
    }
}
