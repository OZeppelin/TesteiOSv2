//
//  StatementViewController.swift
//  TesteiOSv2
//
//  Created by anderson.jesus.silva on 11/02/2019.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import UIKit

class StatementViewController: UIViewController {

    var userAccount:UserAccount!
    var interactor:StatementInteractorInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        StatementWireframe.configurate(viewcontroller: self)
        if let id = userAccount.userId {
            self.interactor.getStatement(id: id)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension StatementViewController: StatementPresenterProtocol {
    func failureView(error:String) {
        self.alert(title: "TesteiOSv2", msg: error, btn: "OK")
    }
    
    func listStatement(statement:[StatementList]) {
        
    }
}
