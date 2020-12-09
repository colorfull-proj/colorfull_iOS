//
//  NetworkResult.swift
//  Colorful
//
//  Created by 박주연 on 2020/12/10.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}

