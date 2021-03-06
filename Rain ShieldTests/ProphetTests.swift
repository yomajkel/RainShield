//
//  ProphetTests.swift
//  Rain Shield
//
//  Created by Kreft, Michal on 29.07.15.
//  Copyright © 2015 kreftmichal. All rights reserved.
//

import XCTest
@testable import Rain_Shield

class ProphetTests: XCTestCase {

    func test_shouldReportTodayRainy_givenRainyItemsForToday() {
        let prophet = Prophet(forecast: forecastWithItemForToday(weatherCodeRaw: 501))
        XCTAssert(prophet.isTodayRainy())
    }
    
    func test_shouldReportTodayNotRainy_givenNotRainyItemsForToday() {
        let prophet = Prophet(forecast: forecastWithItemForToday(weatherCodeRaw: 400))
        XCTAssertFalse(prophet.isTodayRainy())
    }
}

private extension ProphetTests {
    
    func forecastWithItemForToday(weatherCodeRaw weatherCodeRaw: Int? = nil) -> WeatherForecast {
        let forecastItem = ForecastItem(timestamp: Int(NSDate().timeIntervalSince1970), weatherCodeRaw: weatherCodeRaw, icon: nil)
        return WeatherForecast(city: nil, items: [forecastItem])
    }
    
}
