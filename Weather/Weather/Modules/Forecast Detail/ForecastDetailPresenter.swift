//
//  ForecastDetailPresenter.swift
//  Weather
//
//  Created Taina Viriato on 16/04/21.
// 

import UIKit

class ForecastDetailPresenter: ForecastDetailPresenterProtocol {
  
  //  MARK: Properties
  
  weak private var view: ForecastDetailViewProtocol?
  var interactor: ForecastDetailInteractorProtocol?
  private let router: ForecastDetailWireframeProtocol
    
  //  MARK: Lifecycle
  
  init(interface: ForecastDetailViewProtocol, interactor: ForecastDetailInteractorProtocol?, router: ForecastDetailWireframeProtocol) {
    self.view = interface
    self.interactor = interactor
    self.router = router
  }
}
