//
//  ViewController.swift
//  WeatherReport
//
//  Created by Hiroaki-Hirabayashi on 2022/01/04.
//

import UIKit
import CoreLocation

final class WeatherViewController: UIViewController {

// MARK: - Property

    @IBOutlet private weak var searchTextField: UITextField!
    @IBOutlet private weak var conditionImageView: UIImageView!
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var cityLabel: UILabel!
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        weatherManager.delegate = self
        searchTextField.delegate = self
    }

    @IBAction private func searchButtonPressed(_ sender: Any) {
        print(searchTextField.text!)
        searchTextField.endEditing(true)
    }
    
}

// MARK: - UITextFieldDelegate

extension WeatherViewController: UITextFieldDelegate {
    
    // エンターキーを押した時
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(searchTextField.text!)
        searchTextField.endEditing(true)
        return true
    }
    
    // 入力しないでエンターした時
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        // TextFieldが空ではなかったらtrue 空だったらfalse
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "都市名を入力してください"
            return false
        }
    }
    
    // エンター(入力が終わった時)、TextFieldを空にする
    func textFieldDidEndEditing(_ textField: UITextField) {
        // もしTextField.textの入力値があれば
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        
        searchTextField.text = ""
        
    }
}

//MARK: - WeatherManagerDelegate

extension WeatherViewController: WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            // 検索した都市名をラベルに反映する
            self.cityLabel.text = weather.cityName
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
//35.875230, 139.670674 さいたま
//35.702069、139.775327 サンフランシスコ
//MARK: - CLLocationManagerDelegate

extension WeatherViewController: CLLocationManagerDelegate {
    
    @IBAction private func locationPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
