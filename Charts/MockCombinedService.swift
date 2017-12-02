//
//  ViewController.swift
//  Charts
//
//  Created by Martin Mitrevski on 02.12.17.
//  Copyright © 2017 Mitrevski. All rights reserved.
//


import UIKit

class MockCombinedService: NSObject, CombinedService {
    func loadCombinedData() -> [CombinedEntry] {
        let buttonColor = UIColor.green
        let button = CombinedType(title: "Type1", color: buttonColor, priority: 0)
        let antleredColor = UIColor.gray
        let antlered = CombinedType(title: "Type2", color: antleredColor, priority: 1)
        let doeColor = UIColor.darkGray
        let doe = CombinedType(title: "Type3", color: doeColor, priority: 2)
        
        // 2012
        let firstButton = CombinedPart(type: button, value: 310)
        let firstAntlered = CombinedPart(type: antlered, value: 80)
        let firstDoe = CombinedPart(type: doe, value: 240)
        let firstYear = CombinedEntry(year: "2012", parts: [firstButton, firstAntlered, firstDoe])
        
        // 2013
        let secondButton = CombinedPart(type: button, value: 280)
        let secondAntlered = CombinedPart(type: antlered, value: 60)
        let secondDoe = CombinedPart(type: doe, value: 200)
        let secondYear = CombinedEntry(year: "2013", parts: [secondButton, secondAntlered, secondDoe])
        
        // 2014
        let thirdButton = CombinedPart(type: button, value: 310)
        let thirdAntlered = CombinedPart(type: antlered, value: 170)
        let thirdDoe = CombinedPart(type: doe, value: 160)
        let thirdYear = CombinedEntry(year: "2014", parts: [thirdButton, thirdAntlered, thirdDoe])
        
        // 2015
        let fourthButton = CombinedPart(type: button, value: 290)
        let fourthAntlered = CombinedPart(type: antlered, value: 20)
        let fourthDoe = CombinedPart(type: doe, value: 200)
        let fourthYear = CombinedEntry(year: "2015", parts: [fourthButton, fourthAntlered, fourthDoe])
        
        // 2016
        let fifthButton = CombinedPart(type: button, value: 330)
        let fifthAntlered = CombinedPart(type: antlered, value: 60)
        let fifthDoe = CombinedPart(type: doe, value: 40)
        let fifthYear = CombinedEntry(year: "2016", parts: [fifthButton, fifthAntlered, fifthDoe])
        
        return [firstYear, secondYear, thirdYear, fourthYear, fifthYear]
    }
    
    
}
