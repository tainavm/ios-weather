//
//  ForecastPresenter.swift
//  Weather
//
//  Created Taina Viriato on 13/04/21. 
// 

import UIKit

class ForecastPresenter: ForecastPresenterProtocol {
  
  //  MARK: Properties
  
  weak private var view: ForecastViewProtocol?
  var interactor: ForecastInteractorProtocol?
  private let router: ForecastWireframeProtocol
  
  //  MARK: Lifecycle
  
  init(interface: ForecastViewProtocol, interactor: ForecastInteractorProtocol?, router: ForecastWireframeProtocol) {
    self.view = interface
    self.interactor = interactor
    self.router = router
  }
  
  //  MARK: View Protocols
  
  func getWeatherData(city: String) {
    view?.showLoading()
    Reachability().isConnectedToNetwork { results in
      switch results {
        case .failure(let error):
          self.view?.showAlert()
          if let weatherData = LocalManager().getWeather() {
            self.view?.setupWeather(weather: weatherData)
          } 
        case .success( _):
          self.getWeather(city: city)
      }
      self.view?.hideLoading()
    }
  }
  
  private func getWeather(city: String) {
    _ = self.interactor?.getWeatherData(city: city)
      .subscribe(onNext: { (weather) in
        self.view?.setupWeather(weather: weather)
        self.view?.hideLoading()
      }, onError: { (error) in
        self.view?.showAlert()
        self.view?.hideLoading()
      }, onCompleted: {
      })
  }
  
  func openForecastDetail(weatherData: List, city: City) {
    router.openForecastDetail(weatherData: weatherData, city: city)
  }
}
