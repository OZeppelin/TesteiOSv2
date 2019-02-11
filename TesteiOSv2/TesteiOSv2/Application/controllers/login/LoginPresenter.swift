//
//  LoginPresenter.swift
//  TesteiOSv2
//
//  Created by anderson.jesus.silva on 11/02/2019.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import Foundation

protocol LoginPresenterProtocol: class {
    func failPassword(error:String)
    func failRequest(error:String)
    func failResult(error:ErrorClass)
    func success(userAccount:UserAccount)
}

class LoginPresenter: NSObject, LoginPresenterOutput {
    
    weak var output:LoginPresenterProtocol?
    
    //MARK: LoginPresenterOutput
    func failPassword(error:String) {
        self.output?.failPassword(error: error)
    }
    
    func failRequest(error:String) {
        self.output?.failRequest(error: error)
    }
    
    func failResult(error:ErrorClass) {
        self.output?.failResult(error: error)
    }
    
    func success(userAccount:UserAccount) {
        self.output?.success(userAccount: userAccount)
    }
    
}
