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
    let appSession = AppSession.sharedInstance
    
    @IBOutlet weak var txtEmail: RoundTextField!
    @IBOutlet weak var txtPassword: RoundTextField!
    @IBOutlet weak var btnLogin: ButtonStyle!
    
    override func viewDidAppear(_ animated: Bool) {
        self.txtEmail.text = self.appSession.email
        self.txtPassword.text = self.appSession.password
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        hideKeyboardWhenTappedAround()
        LoginWireframe.configurate(viewcontroller: self)
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "segueStatement" {
            let vc:StatementViewController = segue.destination as! StatementViewController
            if let user = sender as? UserAccount {
                vc.userAccount = user
            }
        }
    }
 

    @IBAction func doLogin(_ sender: Any) {
        self.showLoading()
        self.interactor.login(email: self.txtEmail.text, password: self.txtPassword.text)
    }
    
}

extension LoginViewController: LoginPresenterProtocol {
    func failPassword(error:String) {
        self.hideLoading()
        self.alert(title: "TesteiOSv2", msg: error, btn: "OK")
    }
    
    func failRequest(error:String) {
        self.hideLoading()
        self.alert(title: "Error Request", msg: error, btn: "OK")
    }
    
    func failResult(error:ErrorClass) {
        self.hideLoading()
        if let msg = error.message {
            self.alert(title: "Error Result", msg: msg, btn: "OK")
        }
    }
    
    func success(userAccount:UserAccount) {
        self.hideLoading()
        self.performSegue(withIdentifier: "segueStatement", sender: userAccount)
    }
}
