//
//  LoginInteractor.swift
//  TesteiOSv2
//
//  Created by anderson.jesus.silva on 11/02/2019.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import Foundation

protocol LoginInteractorInput: class {
    func login(email:String?,password:String?)
}

protocol LoginPresenterOutput: class {
    func failPassword(error:String)
    func failRequest(error:String)
    func failResult(error:ErrorClass)
    func success(userAccount:UserAccount)
}

class LoginInteractor: NSObject, LoginInteractorInput {
    
    private(set) var presenter : LoginPresenter
    private(set) var wireframe  : LoginWireframe
    
    weak var presenterOutput:LoginPresenterOutput?
    
    init(presenter:LoginPresenter, wireframe:LoginWireframe) {
        self.presenter = presenter
        self.wireframe = wireframe
    }
    
    private lazy var provider : LoginProvider = {
        return LoginProvider.init()
    }()
    
    //MARK: LoginInteractorInput    
    func login(email: String?, password: String?) {
        
        guard let email = email, !email.isEmpty else {
            self.presenterOutput?.failPassword(error: "Campo User obrigatório!")
            return
        }
        
        guard let password = password else {
            self.presenterOutput?.failPassword(error: "Campo Password obrigatório!")
            return
        }
        
        
        if !password.isValidPassword {
            self.presenterOutput?.failPassword(error: "O campo senha deve ter pelo menos uma letra maiuscula, um caracter especial e um caracter alfanumérico.")
            return
        }
        
        if !email.isEmail {
            if !email.isValidCPF {
                self.presenterOutput?.failPassword(error: "Campo User inválido!")
                return
            }
        }
        
        self.provider.executeLogin(login: email, password: password) { (baseClass, error) in
            guard error == nil else {
                self.presenterOutput?.failRequest(error: error!)
                return
            }
            
            if let base = baseClass {
                if let errorBase = base.error {
                    self.presenterOutput?.failResult(error: errorBase)
                }
                
                if let userAccount = base.userAccount {
                    self.presenterOutput?.success(userAccount: userAccount)
                }
            }
            
        }
    }
    
}
