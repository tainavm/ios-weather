//
//  LocalManager.swift
//  Weather
//
//  Created by Taina Viriato on 17/04/21.
//

import Foundation

class LocalManager {
  
  private let weatherDataKey = "Weather.response"
   
  var weatherResponse: APIResponse?
  
  func getWeather() -> APIResponse? {
    if let weatherData = UserDefaults.standard.data(forKey: weatherDataKey) {
      let decoder = JSONDecoder()
      do {
        self.weatherResponse = try decoder.decode(APIResponse.self, from: weatherData)
      } catch {
        print(ObjectSavableError.unableToDecode)
      }
    }
    guard let weatherResponse = self.weatherResponse else { return nil }
    return weatherResponse
  }
  
  func saveWeather(weather: APIResponse) {
    let encoder = JSONEncoder()
    do {
      let data = try encoder.encode(weather)
      UserDefaults.standard.set(data, forKey: weatherDataKey)
      UserDefaults.standard.synchronize()
    } catch {
      print(ObjectSavableError.unableToEncode)
    }
    self.weatherResponse = weather
  }
}

enum ObjectSavableError: String, LocalizedError {
  case unableToEncode = "Unable to encode object into data"
  case noValue = "No data object found for the given key"
  case unableToDecode = "Unable to decode object into given type"
  
  var errorDescription: String? {
    rawValue
  }
}
