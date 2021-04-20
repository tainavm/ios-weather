//
//  ForecastDetailRouter.swift
//  Weather
//
//  Created Taina Viriato on 16/04/21.
// 

import UIKit

class ForecastDetailRouter: ForecastDetailWireframeProtocol {
  
  // MARK: Properties
  
  weak var viewController: UIViewController?
  
  // MARK: Lifecycle
  
  static func createModule(weatherData: List, city: City) -> UIViewController {
    let view = ForecastDetailViewController(nibName: "ForecastDetailViewController", bundle: nil)
    let interactor = ForecastDetailInteractor()
    let router = ForecastDetailRouter()
    let presenter = ForecastDetailPresenter(interface: view, interactor: interactor, router: router)
    
    view.city = city
    view.weatherData = weatherData
    view.presenter = presenter
    interactor.presenter = presenter
    router.viewController = view
    
    return view
  } 
}
