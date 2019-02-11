//
//  StatementProvider.swift
//  TesteiOSv2
//
//  Created by anderson.jesus.silva on 11/02/2019.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class StatementProvider: NSObject {
    
    func executeStatemens(id:Int, completion:@escaping(_ statement:Statement?, _ error:String?) -> Void) -> Void {
        
        request(RouterAPI.statements(id: id))
            .responseObject { (response:DataResponse<Statement>) in
                switch response.result {
                case .success(let statement): completion(statement, nil); break;
                case .failure(let error): completion(nil, error.localizedDescription); break;
                }
        }
        
    }
    
}
