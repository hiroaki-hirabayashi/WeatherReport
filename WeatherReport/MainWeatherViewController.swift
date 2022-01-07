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
        // Do any additional setup after loading the view.
    }


}

