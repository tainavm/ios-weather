//
//  APIServices.swift
//  Weather
//
//  Created by Taina Viriato on 13/04/21.
//

import Foundation
import Alamofire
import ObjectMapper
import RxSwift

class APIServices: NSObject {
  
  func getWeather(city: String) -> Observable<APIResponse> {
    
    let url = Constants.baseUrl + "?q=\(city)&units=metric&appid=\(Constants.API_KEY)"
    
    return Observable.create { (observer) -> Disposable in
      _ = Alamofire.request(url).responseJSON { response in
        switch response.result {
          case .success(_):
            guard let json = response.value as? [String : Any] else { return }
            guard let weatherResponse = Mapper<APIResponse>().map(JSON: json) else { return }
            LocalManager().saveWeather(weather: weatherResponse)
            observer.onNext(weatherResponse)
            observer.onCompleted()
          case .failure(let error):
            observer.onError(error)
        }
      }
      return Disposables.create {
      }
    }
  }
}
