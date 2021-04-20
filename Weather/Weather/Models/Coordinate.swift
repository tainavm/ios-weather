//
//  Coordinate.swift
//  Weather
//
//  Created by Taina Viriato on 17/04/21.
//

import Foundation
import ObjectMapper

class Coordinate: Mappable, Codable {
  
  var latitude: Float?
  var longitude: Float?

  required init?(map: Map){
    
  }
  
  init(lat: Float?, lon: Float?) {
    self.latitude = lat
    self.longitude = lon
  }
  
  func mapping(map: Map) {
    latitude <- map["lat"]
    longitude <- map["lon"]
  }
}
