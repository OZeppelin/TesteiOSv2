//
//  TesteiOSv2Tests.swift
//  TesteiOSv2Tests
//
//  Created by anderson.jesus.silva on 11/02/2019.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import XCTest

@testable import TesteiOSv2

class TesteiOSv2Tests: XCTestCase {
    
    var providerLogin:LoginProvider!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.providerLogin = LoginProvider()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testeCheckEmailSucces() {
        let check = "anderson.jesus.silva@accenture.com".isEmail
        XCTAssertEqual(check, true)
    }
    
    func testeCheckEmailFailed() {
        let check = "anderson.jesus.silva".isEmail
        XCTAssertEqual(check, false)
    }
    
    func testCheckCPFSuccess() {
        let cpf = "99099396066"
        let check = cpf.isValidCPF
        XCTAssertEqual(check, true)
    }
    
    func testCheckCPFFailed() {
        let cpf = "99099396067"
        let check = cpf.isValidCPF
        XCTAssertEqual(check, false)
    }
    
    func testRequestLoginSuccess() {
        
        var user : UserAccount?
        
        let teste = expectation(description: "aaa")
        
        self.providerLogin.executeLogin(login: "andersonajfs@gmail.com", password: "Test@1") { (baseClass, error) in
            guard error == nil else {
                print("error")
                return
            }
            
            print("Sucesso!!!!")
            
            if let base = baseClass {
                if let userAccount = base.userAccount {
                    user = userAccount
                    
                    guard user != nil else {
                        return
                    }
                    if let obj = user {
                        if let name = obj.name {
                            XCTAssertEqual(name, "Jose da Silva Teste")
                            teste.fulfill()
                        }
                    }
                }
            }
        }
        waitForExpectations(timeout: 40.0)
    }
    
    func testLoginFailed() {
        
        let teste = expectation(description: "Test Login Failed")
        
        self.providerLogin.executeLogin(login: "", password: "T@1") { (baseClass, error) in
            guard error == nil else {
                print("error")
                return
            }
            
            print("Sucesso!!!!")
            if let base = baseClass {
                if let error = base.error {
                    XCTAssertEqual(error.code, 53)
                    teste.fulfill()
                }
            }
        }
        
        waitForExpectations(timeout: 40.0)
        
    }
    
    
}
