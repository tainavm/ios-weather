//
//  Clouds.swift
//  Weather
//
//  Created by Taina Viriato on 17/04/21.
//

import Foundation
import ObjectMapper

class Clouds: Mappable, Codable {
  
  var all: Int?
  
  init(all: Int?) {
    self.all = all
  }
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    all <- map["all"]
  }
}
