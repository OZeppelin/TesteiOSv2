//
//  StatementInteractor.swift
//  TesteiOSv2
//
//  Created by anderson.jesus.silva on 12/02/2019.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import Foundation

protocol StatementInteractorInput: class {
    func getStatement(id:Int)
}

protocol StatementPresenterOutput: class {
    func fetchStatement(statement:[StatementList])
    func failure(error:String)
}


class StatementInteractor: NSObject, StatementInteractorInput {
    
    private(set) var presenter : StatementPresenter
    private(set) var wireframe : StatementWireframe
    
    weak var presenterOutput: StatementPresenterOutput?
    
    init(presenter:StatementPresenter, wireframe:StatementWireframe) {
        self.presenter = presenter
        self.wireframe = wireframe
    }
    
    private lazy var provider : StatementProvider = {
        return StatementProvider.init()
    }()
    
    //MARK: StatementInteractorInput
    func getStatement(id:Int) {
        self.provider.executeStatemens(id: id) { (statement, error) in
            
            guard error == nil else {
                self.presenterOutput?.failure(error: error!)
                return
            }
            
            if let obj = statement, let list = obj.statementList {
                self.presenterOutput?.fetchStatement(statement: list)
            }
        }
    }
    
}
