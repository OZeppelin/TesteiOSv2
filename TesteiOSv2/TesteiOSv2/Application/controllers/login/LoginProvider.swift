//
//  LoginProvider.swift
//  TesteiOSv2
//
//  Created by anderson.jesus.silva on 11/02/2019.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class LoginProvider: NSObject {
    
    func executeLogin(login:String, password:String,completion:@escaping(_ baseClass:BaseClass?, _ error:Error?) -> Void) -> Void {
        
        let param:Parameters = ["user":login,
                                "password":password]
        
        request(RouterAPI.login(param: param))
            .responseObject { (response:DataResponse<BaseClass>) in
                switch response.result {
                    case .success(let baseClass): completion(baseClass, nil); break;
                    case .failure(let error): completion(nil, error); break;
                }
        }
        
    }
    
}
