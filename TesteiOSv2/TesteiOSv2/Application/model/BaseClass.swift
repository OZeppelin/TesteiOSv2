//
//  BaseClass.swift
//  TesteiOSv2
//
//  Created by anderson.jesus.silva on 11/02/2019.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import Foundation
import ObjectMapper

public final class BaseClass: Mappable, NSCoding {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let userAccount = "userAccount"
        static let error = "error"
    }
    
    // MARK: Properties
    public var userAccount: UserAccount?
    public var error: ErrorClass?
    
    // MARK: ObjectMapper Initializers
    /// Map a JSON object to this class using ObjectMapper.
    ///
    /// - parameter map: A mapping from ObjectMapper.
    public required init?(map: Map){
        
    }
    
    /// Map a JSON object to this class using ObjectMapper.
    ///
    /// - parameter map: A mapping from ObjectMapper.
    public func mapping(map: Map) {
        userAccount <- map[SerializationKeys.userAccount]
        error <- map[SerializationKeys.error]
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = userAccount { dictionary[SerializationKeys.userAccount] = value }
        if let value = error { dictionary[SerializationKeys.error] = value }
        return dictionary
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.userAccount = aDecoder.decodeObject(forKey: SerializationKeys.userAccount) as? UserAccount
        self.error = aDecoder.decodeObject(forKey: SerializationKeys.error) as? ErrorClass
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(userAccount, forKey: SerializationKeys.userAccount)
        aCoder.encode(error, forKey: SerializationKeys.error)
    }
    
}

