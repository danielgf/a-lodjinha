//
//  GenericResponse.swift
//
//  Created by Daniel Griso Filho on 1/13/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class GenericResponse: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let data = "data"
    static let result = "result"
    static let offSet = "offset"
    static let total = "total"
  }

  // MARK: Properties
  public var payload: [Payload]?
    public var result: String?
    public var offSet: Int?
    public var total: Int?

  // MARK: SwiftyJSON Initializers
  /// Initiates the instance based on the object.
  ///
  /// - parameter object: The object of either Dictionary or Array kind that was passed.
  /// - returns: An initialized instance of the class.
  public convenience init(object: Any) {
    self.init(json: JSON(object))
  }

  /// Initiates the instance based on the JSON that was passed.
  ///
  /// - parameter json: JSON object from SwiftyJSON.
  public required init(json: JSON) {
    if let items = json[SerializationKeys.data].array { payload = items.map { Payload(json: $0) } }
    result = json[SerializationKeys.result].string
    offSet = json[SerializationKeys.offSet].int
    total = json[SerializationKeys.total].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = payload { dictionary[SerializationKeys.data] = value.map { $0.dictionaryRepresentation() } }
    if let value = result { dictionary[SerializationKeys.result] = value }
    if let value = offSet { dictionary[SerializationKeys.offSet] = value }
    if let value = total { dictionary[SerializationKeys.total] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.payload = aDecoder.decodeObject(forKey: SerializationKeys.data) as? [Payload]
    self.result = aDecoder.decodeObject(forKey: SerializationKeys.result) as? String
    self.offSet = aDecoder.decodeObject(forKey: SerializationKeys.offSet) as? Int
    self.total = aDecoder.decodeObject(forKey: SerializationKeys.total) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(payload, forKey: SerializationKeys.data)
    aCoder.encode(result, forKey: SerializationKeys.result)
    aCoder.encode(offSet,forKey: SerializationKeys.offSet)
    aCoder.encode(total,forKey: SerializationKeys.total)
  }

}
