//
//  Extensions.swift
//  Weather
//
//  Created by Taina Viriato on 16/04/21.
//

import UIKit

extension UIView {
  func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
    layer.masksToBounds = false
    layer.shadowOffset = offset
    layer.shadowColor = color.cgColor
    layer.shadowRadius = radius
    layer.shadowOpacity = opacity
    
    let backgroundCGColor = backgroundColor?.cgColor
    backgroundColor = nil
    layer.backgroundColor =  backgroundCGColor
    
    layer.masksToBounds = false
    layer.shouldRasterize = true
    layer.rasterizationScale = UIScreen.main.scale
  }
  
  func addShadow(tableView: UITableView, offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
    tableView.layer.masksToBounds = false
    tableView.layer.shadowOffset = offset
    tableView.layer.shadowColor = color.cgColor
    tableView.layer.shadowRadius = radius
    tableView.layer.shadowOpacity = opacity
    
    let backgroundCGColor = backgroundColor?.cgColor
    backgroundColor = nil
    tableView.layer.backgroundColor =  backgroundCGColor
    
    tableView.layer.masksToBounds = false
    tableView.layer.shouldRasterize = true
    tableView.layer.rasterizationScale = UIScreen.main.scale
  }
  
  func addCornerRadius(radius: CGFloat) {
    layer.cornerRadius = radius
    layer.masksToBounds = true
  }
  
  func addBorder(borderWidth: CGFloat, borderColor: CGColor) {
    layer.borderWidth = borderWidth
    layer.borderColor = borderColor
  }
}

extension Date {
  func toDateString() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE, MMM d"
    let str = dateFormatter.string(from: self)
    
    return str
  }
  
  func toHourString() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm:ss"
    let str = dateFormatter.string(from: self)
    
    return str
  }
}

extension String {
  func getDateFromTimestamp() -> String {
    if let date = self.toDate() {
      return date.toDateString()
    }
    return " - "
  }
  
  func toDate(withFormat format: String = "yyyy-MM-dd HH:mm:ss")-> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    let date = dateFormatter.date(from: self)
    
    return date
  }
  
  func getHourFromTimestamp() -> String {
    if let date = self.toDate() {
      return date.toHourString()
    }
    return " - "
  }
  
  func toHourDate(withFormat format: String = "HH:mm:ss")-> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    let date = dateFormatter.date(from: self)
    
    return date
  }
  
  func capitalize() -> String {
    return prefix(1).uppercased() + self.lowercased().dropFirst()
  }
  
  mutating func capitalize() {
    self = self.capitalize()
  }
}

extension Double {
  func convertTimestamp() -> String {
    let date = Date(timeIntervalSince1970: self)
    let dateFormatter = DateFormatter()
    dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0200")
    dateFormatter.locale = NSLocale.current
    dateFormatter.dateFormat = "h:mm a"
    let strDate = dateFormatter.string(from: date)
    
    return strDate
  }
  
}

extension UIImageView {
  func loadIcon(icon: String) {
    let iconUrl = "http://openweathermap.org/img/wn/\(icon)@2x.png"
    let url = URL(string: iconUrl)
    if let data = try? Data(contentsOf: url!) {
      self.image = UIImage(data: data)
    } else {
      self.image = UIImage(named: "warning.png")
    }
  }
}
