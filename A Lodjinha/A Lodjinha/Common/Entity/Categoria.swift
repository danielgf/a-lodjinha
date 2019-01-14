//
//  Categoria.swift
//
//  Created by Daniel Griso Filho on 1/13/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Categoria: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let id = "id"
    static let urlImagem = "urlImagem"
    static let descricao = "descricao"
  }

  // MARK: Properties
  public var id: Int?
  public var urlImagem: String?
  public var descricao: String?

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
    id = json[SerializationKeys.id].int
    urlImagem = json[SerializationKeys.urlImagem].string
    descricao = json[SerializationKeys.descricao].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = urlImagem { dictionary[SerializationKeys.urlImagem] = value }
    if let value = descricao { dictionary[SerializationKeys.descricao] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.urlImagem = aDecoder.decodeObject(forKey: SerializationKeys.urlImagem) as? String
    self.descricao = aDecoder.decodeObject(forKey: SerializationKeys.descricao) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(urlImagem, forKey: SerializationKeys.urlImagem)
    aCoder.encode(descricao, forKey: SerializationKeys.descricao)
  }

}
