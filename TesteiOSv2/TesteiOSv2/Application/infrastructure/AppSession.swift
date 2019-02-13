//
//  AppSession.swift
//  TesteiOSv2
//
//  Created by anderson.jesus.silva on 12/02/2019.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import Foundation
import KeychainSwift

class AppSession {
    
    private let keychain = KeychainSwift()
    
    static let sharedInstance : AppSession = {
        let instance = AppSession()
        return instance
    }()
    
    func createSession(email:String, psw:String) {
        keychain.set(email, forKey: "keyEmail")
        keychain.set(psw, forKey: "keyPws")
    }
    
    var email : String {
        if let email = keychain.get("keyEmail") { return email }
        return ""
    }
    
    var password : String {
        if let password = keychain.get("keyPws") { return password }
        return ""
    }
}
