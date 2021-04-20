//
//  City.swift
//  Weather
//
//  Created by Taina Viriato on 17/04/21.
//

import Foundation
import ObjectMapper

class City: Mappable, Codable {
 
  var id: Int?
  var name: String?
  var coordinate: Coordinate?
  var country: String?
  var timezone: Int?
  var sunrise: Double?
  var sunset: Double?
  
  required init?(map: Map){
    
  }
  
  init(id: Int?, name: String?, coordinate: Coordinate?, country: String?, timezone: Int?, sunrise: Double?, sunset: Double?) {
    self.id = id
    self.name = name
    self.coordinate = coordinate
    self.country = country
    self.timezone = timezone
    self.sunrise = sunrise
    self.sunset = sunset
  }
   
  func mapping(map: Map) {
    id <- map["id"]
    name <- map["name"]
    coordinate <- map["coord"]
    country <- map["country"]
    timezone <- map["timezone"]
    sunrise <- map["sunrise"]
    sunset <- map["sunset"]
  }
}
