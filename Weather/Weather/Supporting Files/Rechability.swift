//
//  Rechability.swift
//  Weather
//
//  Created by Taina Viriato on 17/04/21.
//

import Foundation
import SystemConfiguration

public class Reachability: NSObject {
  
  func isConnectedToNetwork(completion: @escaping (Result<Bool, Error>) -> Void) {
    let url = NSURL(string: "http://google.com/")
    let request = NSMutableURLRequest(url: url! as URL)
    request.httpMethod = "HEAD"
    request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData
    request.timeoutInterval = 10.0
    let session = URLSession.shared
    
    session.dataTask(with: request as URLRequest, completionHandler: {(data, response, error) in
      if let error = error {
        DispatchQueue.main.async {
          completion(.failure(error))
        }
        return
      }
      
      if let httpResponse = response as? HTTPURLResponse {
        print("httpResponse.statusCode \(httpResponse.statusCode)")
        if httpResponse.statusCode == 200 {
          DispatchQueue.main.async {
            completion(.success(true))
          }
        }
      }
    }).resume()
  }
}
