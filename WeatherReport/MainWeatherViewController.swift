//
//  ViewController.swift
//  WeatherReport
//
//  Created by Hiroaki-Hirabayashi on 2022/01/04.
//

import UIKit

final class MainWeatherViewController: UIViewController {
    
    @IBOutlet private weak var searchTextField: UITextField!
    @IBOutlet private weak var conditionImageView: UIImageView!
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var cityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
    }

    @IBAction func searchButtonPressed(_ sender: Any) {
        print(searchTextField.text!)
        searchTextField.endEditing(true)
    }
    
}

//MARK: - UITextFieldDelegate

extension MainWeatherViewController: UITextFieldDelegate {
    
    // エンターキーを押した時
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(searchTextField.text!)
        searchTextField.endEditing(true)
        return true
    }
    
    // 入力しないでエンターした時
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "都市名を入力してください"
            return false
        }
    }
    
    // エンター(入力が終わった時)、TextFieldを空にする
    func textFieldDidEndEditing(_ textField: UITextField) {
        
//        if let city = searchTextField.text {
//            weatherManager.fetchWeather(cityName: city)
//        }
        
        searchTextField.text = ""
        
    }
    
}
