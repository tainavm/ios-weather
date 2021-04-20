//
//  ForecastProtocols.swift
//  Weather
//
//  Created Taina Viriato on 13/04/21.
// 

import Foundation
import RxSwift

//MARK: Wireframe -> Presenter
protocol ForecastWireframeProtocol: class {  
  func openForecastDetail(weatherData: List, city: City)
}

//MARK: Presenter -> Interactor / View
protocol ForecastPresenterProtocol: class {
  func openForecastDetail(weatherData: List, city: City)
  func getWeatherData(city: String)  
}

//MARK: Interactor -> Presenter
protocol ForecastInteractorProtocol: class {
  var presenter: ForecastPresenterProtocol?  { get set }
  func getWeatherData(city: String) -> Observable<APIResponse>
}

//MARK: View -> Presenter
protocol ForecastViewProtocol: class {
  var presenter: ForecastPresenterProtocol?  { get set }
  func setupWeather(weather: APIResponse)
  func showAlert()
  func showLoading()
  func hideLoading()
}
