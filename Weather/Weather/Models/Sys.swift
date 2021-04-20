//
//  Sys.swift
//  Weather
//
//  Created by Taina Viriato on 17/04/21.
//

import Foundation
import ObjectMapper

class Sys: Mappable, Codable {
  
  var pod: String?
  
  init(pod: String?) {
    self.pod = pod
  }
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    pod <- map["pod"]
  }
}
