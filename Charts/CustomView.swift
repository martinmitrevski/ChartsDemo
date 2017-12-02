//
//  ViewController.swift
//  Charts
//
//  Created by Martin Mitrevski on 02.12.17.
//  Copyright © 2017 Mitrevski. All rights reserved.
//


import UIKit

class CustomView: UIView {
    @IBOutlet weak var scrollView: UIScrollView!
    
    private var nowIndicator: UIView = UIView()
    private var nowLabel: UILabel = UILabel()
    
    private var partSizeX: CGFloat = 50.0
    private var partSizeY: CGFloat = 10.0
    private var offsetY: CGFloat = 50.0
    private var offsetX: CGFloat = 15.0
    private var numberOfParts = 24
    
    private let labelHeight: CGFloat = 21
    private let labelWidth: CGFloat = 50
    
    func setup(withSectionsInfo sections: [String : Any]) {
        numberOfParts = sections[Constants.NumberOfParts] as! Int
        let sectionSize = sections[Constants.SectionSize] as! CGSize
        partSizeX = sectionSize.width
        partSizeY = sectionSize.height
        let headers = sections[Constants.Headers] as! [CGFloat : String]
        for (position, title) in headers {
            let timeLabel = label(forPosition: CGPoint(x: position, y: 0), title: title)
            scrollView.addSubview(timeLabel)
        }
        scrollView.contentSize = CGSize(width: CGFloat(numberOfParts) * partSizeX,
                                        height: self.frame.size.height)
    }
    
    func label(forPosition position: CGPoint, title: String) -> UILabel {
        let frame = CGRect(x: offsetX + position.x * partSizeX - (partSizeX / 2),
                           y: position.y,
                           width: partSizeX,
                           height: labelHeight)
        return label(withFrame: frame, title: title)
    }
    
    func label(withFrame frame: CGRect, title: String) -> UILabel {
        let label = UILabel(frame: frame)
        label.text = title
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }
    
    func updateNowIndicator() {
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute], from: date)
        let hour = components.hour!
        let minute = components.minute!
        let originX = CGFloat(hour) + CGFloat(minute) / 60.0
        let frame = CGRect(x: offsetX + originX * partSizeX,
                           y: offsetY,
                           width: 2,
                           height: self.frame.size.height - offsetY)
        nowIndicator.removeFromSuperview()
        nowLabel.removeFromSuperview()
        nowIndicator = UIView(frame: frame)
        nowIndicator.backgroundColor = .red
        nowLabel = label(forPosition: CGPoint(x: originX, y: 20),
                         title: Texts.Now)
        nowLabel.textColor = .red
        self.scrollView.addSubview(nowIndicator)
        self.scrollView.addSubview(nowLabel)
    }
    
    func drawSplitViews() {
        for i in 0..<numberOfParts {
            let originY: CGFloat = 0.0
            let width: CGFloat = 2.0
            let frame = CGRect(x: offsetX + CGFloat(i) * partSizeX,
                               y: offsetY + originY,
                               width: width,
                               height: self.frame.size.height - offsetY)
            let view = UIView(frame: frame)
            view.backgroundColor = .lightGray
            scrollView.addSubview(view)
        }
    }
    
    func draw(customEntries: [CustomEntry]) {
        drawSplitViews()
        for entry in customEntries {
            let frame = CGRect(x: offsetX + entry.originX * partSizeX,
                               y: entry.type.originY * partSizeY + offsetY,
                               width: entry.width * partSizeX,
                               height: entry.type.height * partSizeY)
            let view = UIView(frame: frame)
            view.backgroundColor = entry.type.color
            let offset: CGFloat = 5
            if entry.hasStart {
                let frame = CGRect(x: offset,
                                   y: timeOriginY(inView: view),
                                   width: labelWidth,
                                   height: labelHeight)
                let startLabel = label(withFrame: frame, title: entry.startTimeString)
                view.addSubview(startLabel)
            }
            if entry.hasEnd {
                let frame = CGRect(x: view.frame.size.width - labelWidth - offset,
                                   y: timeOriginY(inView: view),
                                   width: labelWidth,
                                   height: labelHeight)
                let endLabel = label(withFrame: frame, title: entry.endTimeString)
                view.addSubview(endLabel)
            }
            scrollView.addSubview(view)
        }
        updateNowIndicator()
    }
    
    func timeOriginY(inView view: UIView) -> CGFloat {
        let originY = (view.frame.height - labelHeight) / 2
        return originY
    }
    
    func clearPreviousViews() {
        for view in scrollView.subviews {
            view.removeFromSuperview()
        }
    }
}
