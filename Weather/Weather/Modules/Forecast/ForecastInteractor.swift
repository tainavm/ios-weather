//
//  ForecastInteractor.swift
//  Weather
//
//  Created Taina Viriato on 13/04/21. 
//   

import UIKit
import RxSwift

class ForecastInteractor: ForecastInteractorProtocol {
  
  // MARK: Properties
  
  weak var presenter: ForecastPresenterProtocol?
  
  //  MARK: Functions
  
  func getWeatherData(city: String) -> Observable<APIResponse> {
    return APIServices().getWeather(city: city) 
  }
}
