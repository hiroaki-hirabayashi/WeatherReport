//
//  WeatherData.swift
//  WeatherReport
//
//  Created by Hiroaki-Hirabayashi on 2022/01/09.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let description: String
    let id: Int
}
