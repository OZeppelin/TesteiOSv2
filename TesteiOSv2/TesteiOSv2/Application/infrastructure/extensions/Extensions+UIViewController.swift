//
//  Extensions+UIViewController.swift
//  TesteiOSv2
//
//  Created by anderson.jesus.silva on 11/02/2019.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func alert(title:String, msg:String, btn:String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: btn, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func dismiss(animeted:Bool = true) {
        self.dismiss(animated: animeted, completion: nil)
    }
    
}
