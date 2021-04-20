//
//  ForecastDayTableViewCell.swift
//  Weather
//
//  Created by Taina Viriato on 16/04/21.
//

import UIKit

class ForecastDayTableViewCell: UITableViewCell {
  
  //  MARK: Outlets
  
  @IBOutlet weak var lbWeekDay: UILabel!
  @IBOutlet weak var lbMonth: UILabel!
  @IBOutlet weak var lbTempMax: UILabel!
  @IBOutlet weak var lbTempMin: UILabel!
  @IBOutlet weak var ivIcon: UIImageView!
  
  //  MARK: Livecycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  func setInformation(response: List) { 
    if let date = response.dt_txt {
      let dateFormated = date.getDateFromTimestamp()
      let dateShort = dateFormated.split{$0 == ","}.map(String.init)
      lbWeekDay.text = dateShort[0]
      lbMonth.text = dateShort[1]
    }
     
    if let temp = response.main?.tempMin {
      let tempInt = temp.rounded(.down)
      let tempString = String(tempInt)
      let tempShort = tempString.split{$0 == "."}.map(String.init)
      lbTempMin.text = tempShort[0] + "º"
    }
    
    if let temp = response.main?.tempMax {
      let tempInt = temp.rounded(.up)
      let tempString = String(tempInt)
      let tempShort = tempString.split{$0 == "."}.map(String.init)
      lbTempMax.text = tempShort[0] + "º"
    }
    
    if let weather = response.weather {
      if let icon =  weather[0].icon {
        ivIcon.loadIcon(icon: icon)
      }
    }
  }
}
