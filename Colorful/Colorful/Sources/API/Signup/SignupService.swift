//
//  SignupService.swift
//  Colorful
//
//  Created by 윤동민 on 2020/12/14.
//

import Foundation
import Alamofire

struct SignupParameter: ParameterAble {
    let id: String
    let password: String
    let name: String
    
    func makeParameters() -> Parameters {
        return [
            "id": id,
            "password": password,
            "name": name,
            "type": "normal",
            "gender": "M",
            "age": 15,
            "description": "저는 준엽입니다."
        ]
    }
}

struct SignupBody: Codable {
    let uid: String
}

struct SignupService {
    static let shared = SignupService()
    
    private init() { }
    
    func requestSignup(_ parameters: SignupParameter, complection: @escaping (NetworkResult<Any>) -> Void) {
        
        let signup = "http://ec2-13-124-127-8.ap-northeast-2.compute.amazonaws.com:3000" + "/api/users/signup"
        
        let headers: HTTPHeaders = [
            "Content-Type": "Application/json"
        ]
        
        AF.request(signup, method: .post, parameters: parameters.makeParameters(), encoding: JSONEncoding.default, headers: headers)
            .validate(statusCode: 200...500)
            .responseDecodable(of: ResponseData<SignupBody>.self) { response in
                switch response.result {
                case .success(let uid):
                    if uid.status == 200 {
                        UserDefaults.standard.setValue(uid.data!.uid, forKey: UserdefaultKey.token)
                        complection(.success(true))
                    } else {
                        complection(.requestErr("err"))
                    }
                case .failure(let err):
                    print(err.localizedDescription)
                    complection(.networkFail)
                }
            }
    }
}
