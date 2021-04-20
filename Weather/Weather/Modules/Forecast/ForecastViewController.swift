//
//  ForecastViewController.swift
//  Weather
//
//  Created Taina Viriato on 13/04/21
// 

import UIKit
import MMProgressHUD

class ForecastViewController: UIViewController, ForecastViewProtocol {
  
  //  MARK: Outlets
  
  @IBOutlet weak var lbLocation: UILabel!
  @IBOutlet weak var viewDate: UIView!
  @IBOutlet weak var viewTemp: UIView!
  @IBOutlet weak var lbDate: UILabel!
  @IBOutlet weak var lbCurrentTemp: UILabel!
  @IBOutlet weak var lbWeatherDescription: UILabel!
  @IBOutlet weak var ivIcon: UIImageView!
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet var views: [UIView]!
  @IBOutlet weak var loadingView: UIView!
  
  //  MARK: Properties
  
  var presenter: ForecastPresenterProtocol?
  var weatherData: APIResponse!
  var weatherList: [List]?
  
  //  MARK: Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    if #available(iOS 13.0, *) {
      overrideUserInterfaceStyle = .light
    }
    presenter?.getWeatherData(city: "Paris")
    setupView()
  }
  
  //  MARK: View Protocols
  
  func setupWeather(weather: APIResponse) {
    weatherData = weather
    if let list = weather.list?.first {
      if let weather = list.weather?.first {
        lbWeatherDescription.text = weather.main
        if let icon = weather.icon {
          ivIcon.loadIcon(icon: icon)
        }
      }
      
      if let temp = list.main?.temperature {
        lbCurrentTemp.text = String(temp) + "º"
      }
      
      let date = list.dt_txt
      lbDate.text = date?.getDateFromTimestamp()
      
      weatherList = weather.list?.filter {
        let date = $0.dt_txt!
        return date.getHourFromTimestamp() == "12:00:00" 
      }
    }
    tableView.reloadData()
  }
  
  func showAlert() {
    let alert = UIAlertController(title: "Attention", message: "Unable to retrive data", preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
    self.present(alert, animated: true, completion: nil)
  }
  
  func showLoading() {
    loadingView.isHidden = false
    MMProgressHUD.setPresentationStyle(MMProgressHUDPresentationStyle.fade)
    MMProgressHUD.show(withTitle: "", status: "")
  }
  
  func hideLoading() {
    loadingView.isHidden = true
    MMProgressHUD.dismiss()
  }
  
  //  MARK: Private Methods 
  
  private func setupView() {
    for view in views {
      view.addCornerRadius(radius: 12.0)
      view.addShadow(offset: CGSize.init(width: 0, height: 3), color: UIColor.gray, radius: 2.0, opacity: 0.2)
    }
    
    let tap = UITapGestureRecognizer(target: self, action: #selector(openTodayDetail))
    viewTemp.addGestureRecognizer(tap)
    setupTableView()
  }
  
  private func setupTableView() {
    tableView.layer.cornerRadius = 12;
    tableView.layer.masksToBounds = true
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UINib(nibName: "ForecastDayTableViewCell", bundle: nil), forCellReuseIdentifier: "ForecastDayTableViewCell")
  }
  
  //  MARK: Functions
  
  @objc func openTodayDetail(recognizer: UITapGestureRecognizer) {
    if let list = weatherData.list?.first,
       let city = weatherData.city {
      presenter?.openForecastDetail(weatherData: list, city: city)
    }
  }
}

//  MARK: Extensions

extension ForecastViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return Constants.numberOfDays
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ForecastDayTableViewCell") as! ForecastDayTableViewCell
    if let weatherList = weatherList {
      let listData = weatherList[indexPath.row]
      cell.setInformation(response: listData)
      cell.selectionStyle = .none
    }
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let list = weatherList,
       let city = weatherData.city {
      presenter?.openForecastDetail(weatherData: list[indexPath.row], city: city)
    }
  }
}
