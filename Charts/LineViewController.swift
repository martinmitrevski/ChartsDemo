//
//  ViewController.swift
//  Charts
//
//  Created by Martin Mitrevski on 02.12.17.
//  Copyright © 2017 Mitrevski. All rights reserved.
//


import UIKit
import Charts

class LineViewController: UIViewController, ChartViewDelegate {
    
    @IBOutlet weak var chartView: LineChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup(chartView: chartView)
        populateData(withCount: 9)
    }
    
    func setup(chartView: LineChartView) {
        chartView.delegate = self
        chartView.dragEnabled = true
        chartView.setScaleEnabled(true)
        chartView.drawGridBackgroundEnabled = false
        chartView.xAxis.enabled = false
        chartView.leftAxis.axisLineColor = .clear
        chartView.leftAxis.axisMinimum = 50
        chartView.leftAxis.axisMaximum = 90
        chartView.rightAxis.enabled = false
        chartView.legend.enabled = false
        chartView.chartDescription?.text = ""
    }
    
    func populateData(withCount count: Int) {
        var values = [ChartDataEntry]()
        for i in 0..<count {
            let value = arc4random_uniform(40) + 50
            let entry = ChartDataEntry(x: Double(i), y: Double(value))
            values.append(entry)
        }
        
        let set = LineChartDataSet(values: values, label: "Precipitation")
        set.mode = .cubicBezier
        set.cubicIntensity = 0.2
        set.drawCirclesEnabled = false
        set.lineWidth = 1.8
        set.circleRadius = 4.0
        set.setCircleColor(.green)
        set.setColor(.green)
        set.fillColor = .green
        set.fillAlpha = 1.0
        set.drawHorizontalHighlightIndicatorEnabled = false
        
        let data = LineChartData(dataSet: set)
        data.setDrawValues(false)
        chartView.data = data
    }

}
