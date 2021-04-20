//
//  Weather.swift
//  Weather
//
//  Created by Taina Viriato on 17/04/21.
//

import Foundation
import ObjectMapper

class Weather: Mappable, Codable {
  
  var id: Int?
  var main: String?
  var description: String?
  var icon: String?

  required init?(map: Map){
    
  }
  
  init(id: Int?, main: String?, description: String?, icon: String?) {
    self.id = id
    self.main = main
    self.description = description
    self.icon = icon
  }
  
  func mapping(map: Map) {
    id <- map["id"]
    main <- map["main"]
    description <- map["description"]
    icon <- map["icon"]
  }
}
