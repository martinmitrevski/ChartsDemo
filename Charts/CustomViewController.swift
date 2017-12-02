//
//  ViewController.swift
//  Charts
//
//  Created by Martin Mitrevski on 02.12.17.
//  Copyright © 2017 Mitrevski. All rights reserved.
//


import UIKit

class CustomViewController: UIViewController {
    
    let service = MockCustomService()
    @IBOutlet weak var customView: CustomView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Custom"
        customView.setup(withSectionsInfo: self.sectionsInfo())
        customView.draw(customEntries: service.loadCustomData(forDate: Date()))
    }
    
    private func sectionsInfo() -> [String : Any] {
        let headers: [CGFloat: String] = [0.0 : Texts.Midnight, 6.0 : Texts.SixAm,
                                          12.0 : Texts.TwelvePm, 18.0 : Texts.SixPm,
                                          23.0 : Texts.Midnight]
        return [Constants.NumberOfParts : 24, Constants.SectionSize : CGSize(width: 50, height: 10),
                Constants.Headers : headers]
    }
    
}
