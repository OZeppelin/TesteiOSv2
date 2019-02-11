//
//  StatementList.swift
//
//  Created by anderson.jesus.silva on 11/02/2019
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class StatementList: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let desc = "desc"
    static let value = "value"
    static let title = "title"
    static let date = "date"
  }

  // MARK: Properties
  public var desc: String?
  public var value: Float?
  public var title: String?
  public var date: String?

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
    desc <- map[SerializationKeys.desc]
    value <- map[SerializationKeys.value]
    title <- map[SerializationKeys.title]
    date <- map[SerializationKeys.date]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = desc { dictionary[SerializationKeys.desc] = value }
    if let value = value { dictionary[SerializationKeys.value] = value }
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = date { dictionary[SerializationKeys.date] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.desc = aDecoder.decodeObject(forKey: SerializationKeys.desc) as? String
    self.value = aDecoder.decodeObject(forKey: SerializationKeys.value) as? Float
    self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
    self.date = aDecoder.decodeObject(forKey: SerializationKeys.date) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(desc, forKey: SerializationKeys.desc)
    aCoder.encode(value, forKey: SerializationKeys.value)
    aCoder.encode(title, forKey: SerializationKeys.title)
    aCoder.encode(date, forKey: SerializationKeys.date)
  }

}
