//
//  Data.swift
//
//  Created by Daniel Griso Filho on 1/13/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Payload: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let urlImagem = "urlImagem"
    static let id = "id"
    static let descricao = "descricao"
    static let precoDe = "precoDe"
    static let categoria = "categoria"
    static let nome = "nome"
    static let precoPor = "precoPor"
    static let linkUrl = "linkUrl"
  }

  // MARK: Properties
  public var urlImagem: String?
  public var id: Int?
  public var descricao: String?
  public var precoDe: Int?
  public var categoria: Categoria?
  public var nome: String?
  public var precoPor: Float?
  public var linkUrl: String?

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
    urlImagem = json[SerializationKeys.urlImagem].string
    id = json[SerializationKeys.id].int
    descricao = json[SerializationKeys.descricao].string
    precoDe = json[SerializationKeys.precoDe].int
    categoria = Categoria(json: json[SerializationKeys.categoria])
    nome = json[SerializationKeys.nome].string
    precoPor = json[SerializationKeys.precoPor].float
    linkUrl = json[SerializationKeys.linkUrl].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = urlImagem { dictionary[SerializationKeys.urlImagem] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = descricao { dictionary[SerializationKeys.descricao] = value }
    if let value = precoDe { dictionary[SerializationKeys.precoDe] = value }
    if let value = categoria { dictionary[SerializationKeys.categoria] = value.dictionaryRepresentation() }
    if let value = nome { dictionary[SerializationKeys.nome] = value }
    if let value = precoPor { dictionary[SerializationKeys.precoPor] = value }
    if let value = linkUrl { dictionary[SerializationKeys.linkUrl] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.urlImagem = aDecoder.decodeObject(forKey: SerializationKeys.urlImagem) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.descricao = aDecoder.decodeObject(forKey: SerializationKeys.descricao) as? String
    self.precoDe = aDecoder.decodeObject(forKey: SerializationKeys.precoDe) as? Int
    self.categoria = aDecoder.decodeObject(forKey: SerializationKeys.categoria) as? Categoria
    self.nome = aDecoder.decodeObject(forKey: SerializationKeys.nome) as? String
    self.precoPor = aDecoder.decodeObject(forKey: SerializationKeys.precoPor) as? Float
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(urlImagem, forKey: SerializationKeys.urlImagem)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(descricao, forKey: SerializationKeys.descricao)
    aCoder.encode(precoDe, forKey: SerializationKeys.precoDe)
    aCoder.encode(categoria, forKey: SerializationKeys.categoria)
    aCoder.encode(nome, forKey: SerializationKeys.nome)
    aCoder.encode(precoPor, forKey: SerializationKeys.precoPor)
  }

}
