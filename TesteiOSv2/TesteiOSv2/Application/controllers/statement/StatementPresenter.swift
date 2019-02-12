//
//  StatementPresenter.swift
//  TesteiOSv2
//
//  Created by anderson.jesus.silva on 12/02/2019.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import Foundation

protocol StatementPresenterProtocol: class {
    func failureView(error:String)
    func listStatement(statement:[StatementList])
}

class StatementPresenter: NSObject, StatementPresenterOutput {
    
    weak var output:StatementPresenterProtocol?
    
    //MARK: StatementPresenterOutput
    func fetchStatement(statement:[StatementList]) {
        if statement.count > 0 {
            self.output?.listStatement(statement: statement)
        }
    }
    
    func failure(error:String) {
        self.output?.failureView(error: error)
    }
    
}
