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
    var total = 0
    var objStatement:[StatementList]?
    
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbAccount: UILabel!
    @IBOutlet weak var lbBalance: UILabel!
    @IBOutlet weak var btnExit: UIButton!
    
    @IBOutlet weak var tbView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupFields()
        StatementWireframe.configurate(viewcontroller: self)
        
        if let id = userAccount.userId {
            self.interactor.getStatement(id: id)
        }
    }
    
    @IBAction func logout(_ sender: Any) {
        self.dismiss()
    }
    
    private func setupFields() {
        if let name = userAccount.name {
            self.lbName.text = name
        }
        
        if let agency = userAccount.agency, let account = userAccount.bankAccount {
            self.lbAccount.text = "\(account) / \(agency)"
        }
        
        if let balance = userAccount.balance {
            self.lbBalance.text = balance.formatCurrency()
        }
    }
    
    private func loadXib(statement:[StatementList]) {
        
        self.total = statement.count
        self.objStatement = statement
        
        self.tbView.delegate = self
        self.tbView.dataSource = self
        
        let nib = UINib(nibName: "StatementTableViewCell", bundle: nil)
        self.tbView.register(nib, forCellReuseIdentifier: "cellStatement")
        self.tbView.tableFooterView = UIView()
        self.view.addSubview(self.tbView)
        self.tbView.reloadData()
        
        
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

extension StatementViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.total
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tbView.dequeueReusableCell(withIdentifier: "cellStatement", for: indexPath) as! StatementTableViewCell
        if let list = self.objStatement {
            cell.setup(statement: list[indexPath.row])
        }
        return cell
    }
    
}

extension StatementViewController: StatementPresenterProtocol {
    func failureView(error:String) {
        self.alert(title: "TesteiOSv2", msg: error, btn: "OK")
    }
    
    func listStatement(statement:[StatementList]) {
        self.loadXib(statement: statement)
    }
}
