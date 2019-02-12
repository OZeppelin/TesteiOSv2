//
//  AppSession.swift
//  TesteiOSv2
//
//  Created by anderson.jesus.silva on 12/02/2019.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import Foundation

class AppSession {
    
    static let sharedInstance : AppSession = {
        let instance = AppSession()
        return instance
    }()
    
    func createSession(email:String, psw:String) {
        UserDefaults.standard.set(email, forKey: "keyEmail")
        UserDefaults.standard.set(psw, forKey: "keyPws")
        UserDefaults.standard.synchronize()
    }
    
    var email : String {
        if let email = UserDefaults.standard.object(forKey: "keyEmail") as? String { return email }
        return ""
    }
    
    var password : String {
        if let password = UserDefaults.standard.object(forKey: "keyPws") as? String { return password }
        return ""
    }
    
    func dropSession() {
        UserDefaults.standard.removeObject(forKey: "keyEmail")
        UserDefaults.standard.removeObject(forKey: "keyPws")
        UserDefaults.standard.synchronize()
    }
}
