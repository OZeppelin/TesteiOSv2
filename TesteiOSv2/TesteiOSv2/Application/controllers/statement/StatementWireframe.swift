//
//  StatementWireframe.swift
//  TesteiOSv2
//
//  Created by anderson.jesus.silva on 12/02/2019.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import Foundation

class StatementWireframe {
    
    var interactor:StatementInteractor?
    
    static func configurate(viewcontroller:StatementViewController) {
        
        let presenter  = StatementPresenter()
        let wireframe  = StatementWireframe()
        let interactor = StatementInteractor(presenter: presenter, wireframe: wireframe)
        
        viewcontroller.interactor  = interactor
        interactor.presenterOutput = presenter
        presenter.output           = viewcontroller
        
    }
    
}
