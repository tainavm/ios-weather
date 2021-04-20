//
//  ForecastDetailProtocols.swift
//  Weather
//
//  Created Taina Viriato on 16/04/21.
// 

import Foundation

//MARK: Wireframe -> Presenter
protocol ForecastDetailWireframeProtocol: class {
  
}

//MARK: Presenter -> Interactor / View
protocol ForecastDetailPresenterProtocol: class {
  
}

//MARK: Interactor -> Presenter
protocol ForecastDetailInteractorProtocol: class {
  var presenter: ForecastDetailPresenterProtocol?  { get set }
}

//MARK: View -> Presenter
protocol ForecastDetailViewProtocol: class {
  var presenter: ForecastDetailPresenterProtocol?  { get set }
}
