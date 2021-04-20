//
//  APIResponse.swift
//  Weather
//
//  Created by Taina Viriato on 17/04/21.
//

import Foundation
import ObjectMapper

class APIResponse: Mappable, Codable {
  
  var cod: String?
  var message: Int?
  var cnt: Int?
  var list: [List]?
  var city: City? 
  
  init(cod: String?, message: Int?, cnt: Int?, list: [List]?, city: City?) {
    self.cod = cod
    self.message = message
    self.cnt = cnt
    self.list = list
    self.city = city
  }
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    cod <- map["cod"]
    message <- map["message"]
    cnt <- map["cnt"]
    list <- map["list"]
    city <- map["city"]
  }
}
