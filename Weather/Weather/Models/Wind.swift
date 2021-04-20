//
//  Wind.swift
//  Weather
//
//  Created by Taina Viriato on 17/04/21.
//

import Foundation
import ObjectMapper

class Wind: Mappable, Codable {
  
  var speed: Double?
  var degree: Int?
  
  init(speed: Double?, degree: Int?) {
    self.speed = speed
    self.degree = degree
  }
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    speed <- map["speed"]
    degree <- map["deg"]
  }
}
