//
//  Statement.swift
//
//  Created by anderson.jesus.silva on 11/02/2019
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class Statement: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let statementList = "statementList"
    static let error = "error"
  }

  // MARK: Properties
  public var statementList: [StatementList]?
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
    statementList <- map[SerializationKeys.statementList]
    error <- map[SerializationKeys.error]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = statementList { dictionary[SerializationKeys.statementList] = value.map { $0.dictionaryRepresentation() } }
    if let value = error { dictionary[SerializationKeys.error] = value.dictionaryRepresentation() }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.statementList = aDecoder.decodeObject(forKey: SerializationKeys.statementList) as? [StatementList]
    self.error = aDecoder.decodeObject(forKey: SerializationKeys.error) as? Error
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(statementList, forKey: SerializationKeys.statementList)
    aCoder.encode(error, forKey: SerializationKeys.error)
  }

}
