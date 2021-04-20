//
//  ForecastDetailViewController.swift
//  Weather
//
//  Created Taina Viriato on 16/04/21.
// 

import UIKit

class ForecastDetailViewController: UIViewController, ForecastDetailViewProtocol {
  
  //  MARK: Outlets
  
  @IBOutlet weak var lbWeekDay: UILabel!
  @IBOutlet weak var ivIcon: UIImageView!
  @IBOutlet weak var lbWeatherDescription: UILabel!
  @IBOutlet weak var lbMinTempValue: UILabel!
  @IBOutlet weak var lbCurrentTempValue: UILabel!
  @IBOutlet weak var lbMaxTempValue: UILabel!
  @IBOutlet weak var lbVisibilityValue: UILabel!
  @IBOutlet weak var lbWindValue: UILabel!
  @IBOutlet weak var lbCloudsValue: UILabel!
  @IBOutlet weak var lbSunriseValue: UILabel!
  @IBOutlet weak var lbSunsetValue: UILabel!
  @IBOutlet weak var lbHumidityValue: UILabel!
  @IBOutlet weak var detailView: UIView!
  
  //  MARK: Properties
  
  var presenter: ForecastDetailPresenterProtocol?
  var weatherData: List!
  var city: City!
  
  //  MARK: Lifecycle 
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
  }
  
  //  MARK: Private Methods
  
  private func setupView() {
    detailView.addCornerRadius(radius: 12.0)
    detailView.addShadow(offset: CGSize.init(width: 0, height: 3), color: UIColor.gray, radius: 2.0, opacity: 0.2)
    
    if let date = weatherData.dt_txt {
      let dateFormated = date.getDateFromTimestamp()
      let dateShort = dateFormated.split{$0 == ","}.map(String.init)
      lbWeekDay.text = dateShort[0]
    }
    
    if let temp = weatherData.main?.temperature {
      lbCurrentTempValue.text = String(temp) + "º"
    }
    
    if let temp = weatherData.main?.tempMin {
      let tempInt = temp.rounded(.down)
      let tempString = String(tempInt)
      let tempShort = tempString.split{$0 == "."}.map(String.init)
      lbMinTempValue.text = tempShort[0] + "º"
    }
    
    if let temp = weatherData.main?.tempMax {
      let tempInt = temp.rounded(.up)
      let tempString = String(tempInt)
      
      let tempShort = tempString.split{$0 == "."}.map(String.init)
      lbMaxTempValue.text = tempShort[0] + "º"
    }
    
    if let humidity = weatherData.main?.humidity {
      lbHumidityValue.text = String(humidity) + "%"
    }
    
    if let visibility = weatherData.visibility {
      let formated = visibility / 1000
      lbVisibilityValue.text = String(formated) + "km"
    }
    
    if let weather = weatherData.weather?.first {
      if let description =  weather.description {
        lbWeatherDescription.text = description.capitalize()
        
        if let icon =  weather.icon {
          ivIcon.loadIcon(icon: icon)
        }
      }
      
      if let clouds = weatherData.clouds?.all {
        lbCloudsValue.text = String(clouds) + "%"
      }
      
      if let wind = weatherData.wind?.speed {
        lbWindValue.text = String(wind) + "m/s"
      }
    }
    
    if let sunrise = city.sunrise {
      let sunriseFormatted = sunrise.convertTimestamp()
      lbSunriseValue.text = sunriseFormatted
    }
    
    if let sunset = city.sunset {
      let sunsetFormatted = sunset.convertTimestamp()
      lbSunsetValue.text = String(sunsetFormatted)
    }
  } 
}
