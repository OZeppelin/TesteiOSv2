//
//  LoginWireframe.swift
//  TesteiOSv2
//
//  Created by anderson.jesus.silva on 11/02/2019.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import Foundation

class LoginWireframe {
    
    var interactor:LoginInteractor?
    
    static func configurate(viewcontroller:LoginViewController) {
        
        let presenter = LoginPresenter()
        let wireframe = LoginWireframe()
        let interactor = LoginInteractor(presenter: presenter, wireframe: wireframe)
        
        viewcontroller.interactor = interactor
        interactor.presenterOutput = presenter
        presenter.output = viewcontroller
        
    }
    
}
