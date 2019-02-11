//
//  RouterAPI.swift
//  TesteiOSv2
//
//  Created by anderson.jesus.silva on 11/02/2019.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import Alamofire

enum RouterAPI : URLRequestConvertible {
    
    static let url:String = "https://bank-app-test.herokuapp.com/api/"
    
    //USERS
    case login(param:Parameters)
    case statements(id:String)
    
    var header : HTTPHeaders {
        return ["Content-Type":"application/x-www-form-urlencoded"]
    }
    
    var method : HTTPMethod {
        switch self {
            //USERS
            case .login: return .post
            case .statements: return .get
        }
    }
    
    var path : String {
        switch self {
            
        //USERS
        case .login:
            return "login/"
        case .statements:
            return "statements/"
        
        }
    }
    
    var subPath : String {
        switch self {
            
        //USERS
        case .login:
            return path
        case .statements(let id):
            return path + id
        
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try RouterAPI.url.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(subPath))
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = header
        
        switch self {
        case .login(let param) :
            urlRequest = try URLEncoding.default.encode(urlRequest, with: param)
            break
        default :
            urlRequest = try URLEncoding.default.encode(urlRequest, with: nil)
            break
        }
        
        print("URL_REQUEST => ", urlRequest)
        
        return urlRequest
    }
    
}

