//
//  ViewController.swift
//  Charts
//
//  Created by Martin Mitrevski on 02.12.17.
//  Copyright © 2017 Mitrevski. All rights reserved.
//


import Foundation

protocol CombinedService {
    func loadCombinedData() -> [CombinedEntry]
}
