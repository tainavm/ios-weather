//
//  List.swift
//  Weather
//
//  Created by Taina Viriato on 17/04/21.
//

import Foundation
import ObjectMapper

class List: Mappable, Codable {
  
  var dt: Int?
  var main: Main?
  var weather: [Weather]?
  var clouds: Clouds?
  var wind: Wind?
  var visibility: Int?
  var pop: Double?
  var rain: Rain?
  var sys: Sys?
  var dt_txt: String?
  
  required init?(map: Map){
    
  }
  
  init(dt: Int?, main: Main?, weather: [Weather]?, clouds: Clouds?, wind: Wind?, visibility: Int?, pop: Double?, rain: Rain?, sys: Sys?, dt_txt: String?) {
    self.dt = dt
    self.main = main
    self.weather = weather
    self.clouds = clouds
    self.wind = wind
    self.visibility = visibility
    self.pop = pop
    self.rain = rain
    self.sys = sys
    self.dt_txt = dt_txt
  }
  
  func mapping(map: Map) {
    dt <- map["dt"]
    main <- map["main"]
    weather <- map["weather"]
    clouds <- map["clouds"]
    wind <- map["wind"]
    visibility <- map["visibility"]
    pop <- map["pop"]
    rain <- map["rain"]
    sys <- map["sys"]
    dt_txt <- map["dt_txt"]
  }
}
