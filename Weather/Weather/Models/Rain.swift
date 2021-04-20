//
//  Rain.swift
//  Weather
//
//  Created by Taina Viriato on 17/04/21.
//

import Foundation
import ObjectMapper

class Rain: Mappable, Codable {
  
  var hour3: Double?
  
  init(hour3: Double?) {
    self.hour3 = hour3
  }
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    hour3 <- map["3h"]
  }
}
