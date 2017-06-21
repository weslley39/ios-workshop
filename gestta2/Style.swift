//
//  Style.swift
//  gestta2
//
//  Created by Weslley Neri on 20/06/15.
//  Copyright © 2017 Weslley Neri. All rights reserved.
//

import Foundation
import UIKit
import RSWidgets

struct Style {
    static func setup() {
        let style = Style()
        style.setupNavigationBar()
        style.setupTextField()
    }
    
    fileprivate func setupNavigationBar() {
        let appearance = UINavigationBar.appearance()
        
        appearance.backgroundColor = UIColor.gtNavigationBar
        appearance.barTintColor = UIColor.gtNavigationBar
        appearance.tintColor = UIColor.gtText
        appearance.isTranslucent = false
        appearance.titleTextAttributes = [
            NSForegroundColorAttributeName : UIColor.gtText,
            NSFontAttributeName: UIFont.title
        ]
    }
    
    fileprivate func setupTextField() {
        let appearance = RSTextField.appearance()
        appearance.font = UIFont.text
        appearance.textColor = UIColor.gtText
//        appearance.hintColor = UIColor.gtTextHint
//        appearance.lineBottomWidth = 1
//        appearance.borderColor = UIColor.gtTextHint
    }
    
    static func apply(onFormLabels labels: [UILabel]) {
        labels.forEach{ (label) in
            label.textColor = UIColor.gtText
            label.font      = UIFont.text
        }
    }
        
        static func apply(onPrimaryButton button: RSButton) {
            button.backgroundColor = UIColor.gtButtons
            button.titleLabel?.font = UIFont.primaryButton
            button.cornerRadius = 6
            
            button.setTitleColor(UIColor.gtText, for: .normal)
            button.setTitleColor(UIColor.gtTextHint, for: .highlighted)
        }
}
