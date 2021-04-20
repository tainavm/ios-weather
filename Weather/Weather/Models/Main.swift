//
//  Main.swift
//  Weather
//
//  Created by Taina Viriato on 17/04/21.
//

import Foundation
import ObjectMapper

class Main: Mappable, Codable {
  
  var temperature: Int?
  var feelsLike: Double?
  var tempMin: Double?
  var tempMax: Double?
  var pressure: Int?
  var seaLevel: Int?
  var grndLevel: Int?
  var humidity: Int?
  var tempKf: Double?
  
  init(temperature: Int?, feelsLike: Double?, tempMin: Double?, tempMax: Double?, pressure: Int?, seaLevel: Int?, grndLevel: Int?, humidity: Int?, tempKf: Double?) {
    self.temperature = temperature
    self.feelsLike = feelsLike
    self.tempMin = tempMin
    self.tempMax = tempMax
    self.pressure = pressure
    self.seaLevel = seaLevel
    self.grndLevel = grndLevel
    self.humidity = humidity
    self.tempKf = tempKf
  }
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    temperature <- map["temp"]
    feelsLike <- map["feels_like"]
    tempMin <- map["temp_min"]
    tempMax <- map["temp_max"]
    pressure <- map["pressure"]
    seaLevel <- map["sea_level"]
    grndLevel <- map["grnd_level"]
    humidity <- map["humidity"]
    tempKf <- map["temp_kf"]
  } 
}
