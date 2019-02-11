//
//  LoginViewController.swift
//  TesteiOSv2
//
//  Created by anderson.jesus.silva on 11/02/2019.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var interactor:LoginInteractorInput!
    
    @IBOutlet weak var txtEmail: RoundTextField!
    @IBOutlet weak var txtPassword: RoundTextField!
    @IBOutlet weak var btnLogin: ButtonStyle!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        LoginWireframe.configurate(viewcontroller: self)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func doLogin(_ sender: Any) {
    }
    
}

extension LoginViewController: LoginPresenterProtocol {
    func failPassword(error:String) { }
    func failRequest(error:String) { }
    func failResult(error:ErrorClass) { }
    func success(userAccount:UserAccount) { }
}
