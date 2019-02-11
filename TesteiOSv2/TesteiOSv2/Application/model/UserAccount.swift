//
//  UserAccount.swift
//
//  Created by anderson.jesus.silva on 11/02/2019
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class UserAccount: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let agency = "agency"
    static let userId = "userId"
    static let name = "name"
    static let balance = "balance"
    static let bankAccount = "bankAccount"
  }

  // MARK: Properties
  public var agency: String?
  public var userId: Int?
  public var name: String?
  public var balance: Float?
  public var bankAccount: String?

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
    agency <- map[SerializationKeys.agency]
    userId <- map[SerializationKeys.userId]
    name <- map[SerializationKeys.name]
    balance <- map[SerializationKeys.balance]
    bankAccount <- map[SerializationKeys.bankAccount]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = agency { dictionary[SerializationKeys.agency] = value }
    if let value = userId { dictionary[SerializationKeys.userId] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = balance { dictionary[SerializationKeys.balance] = value }
    if let value = bankAccount { dictionary[SerializationKeys.bankAccount] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.agency = aDecoder.decodeObject(forKey: SerializationKeys.agency) as? String
    self.userId = aDecoder.decodeObject(forKey: SerializationKeys.userId) as? Int
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.balance = aDecoder.decodeObject(forKey: SerializationKeys.balance) as? Float
    self.bankAccount = aDecoder.decodeObject(forKey: SerializationKeys.bankAccount) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(agency, forKey: SerializationKeys.agency)
    aCoder.encode(userId, forKey: SerializationKeys.userId)
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(balance, forKey: SerializationKeys.balance)
    aCoder.encode(bankAccount, forKey: SerializationKeys.bankAccount)
  }

}
