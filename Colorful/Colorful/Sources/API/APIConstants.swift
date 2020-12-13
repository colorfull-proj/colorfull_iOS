//
//  APIConstants.swift
//  Colorful
//
//  Created by 윤동민 on 2020/12/14.
//

import Foundation

protocol ParameterAble {
    func makeParameter() -> [String: String]
}

struct APIConstants {
    static let base = "http://ec2-13-124-127-8.ap-northeast-2.compute.amazonaws.com:3000"
    
    /* 로그인 */
    static let signin: String {
        return base + "/api/users/signin"
    }
}
