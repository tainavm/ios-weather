//
//  ForecastRouter.swift
//  Weather
//
//  Created Taina Viriato on 13/04/21.
// 

import UIKit

class ForecastRouter: ForecastWireframeProtocol {
  
  // MARK: Properties
  
  weak var viewController: UIViewController?
   
  // MARK: Lifecycle
  
  static func createModule() -> UIViewController {
    let view = ForecastViewController(nibName: "ForecastViewController", bundle: nil)
    let interactor = ForecastInteractor()
    let router = ForecastRouter()
    let presenter = ForecastPresenter(interface: view, interactor: interactor, router: router)
    
    view.presenter = presenter
    interactor.presenter = presenter
    router.viewController = view
    
    return view
  }
   
  // MARK: Methods
  func openForecastDetail(weatherData: List, city: City) {
    let detail = ForecastDetailRouter.createModule(weatherData: weatherData, city: city)
    self.viewController!.present(detail, animated: true, completion: nil)
  }
}
