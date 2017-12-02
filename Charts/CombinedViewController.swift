//
//  ViewController.swift
//  Charts
//
//  Created by Martin Mitrevski on 02.12.17.
//  Copyright © 2017 Mitrevski. All rights reserved.
//


import UIKit
import Charts

class CombinedViewController: UIViewController, ChartViewDelegate {
    
    @IBOutlet weak var chartView: BarChartView!
    let combinedService = MockCombinedService()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup(chartView: chartView)
        populateData(withEntries: combinedService.loadCombinedData())
    }
    
    func setup(chartView: BarChartView) {
        chartView.delegate = self
        chartView.leftAxis.axisMinimum = 0
        chartView.leftAxis.axisLineColor = .clear
        chartView.rightAxis.enabled = false
        chartView.xAxis.valueFormatter = YearValueFormatter()
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.axisLineColor = .clear
        chartView.fitBars = true
        chartView.drawValueAboveBarEnabled = false
        chartView.chartDescription?.text = ""
    }
    
    func populateData(withEntries entries: [CombinedEntry]) {
        var values = [BarChartDataEntry]()
        var x: Double = 0
        var colors = [UIColor]()
        var titles = [String]()
        for entry in entries {
            let dataEntry = BarChartDataEntry(x: x, yValues: entry.values)
            x += 1
            values.append(dataEntry)
            colors = entry.colors
            titles = entry.titles
        }
        
        let set = BarChartDataSet(values: values, label: "Combined data")
        set.drawIconsEnabled = false
        set.colors = colors
        set.stackLabels = titles
        set.valueColors = [.clear]
        
        let data = BarChartData(dataSet: set)
        data.barWidth = 0.75
        chartView.data = data
    }
}
