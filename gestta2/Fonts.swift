//
//  Fonts.swift
//  gestta2
//
//  Created by Weslley Neri on 20/06/15.
//  Copyright © 2017 Weslley Neri. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    
    enum Style: String, CustomStringConvertible {
        case regular = "Regular"
        case italic  = "Italic"
        case medium  = "Medium"
        
        var description: String {
            return self.rawValue
        }
    }
    
    static func roboto(withStyle style: Style, size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-\(style)", size: size)!
    }
    
    static var text: UIFont {
        return roboto(withStyle: .regular, size: 16)
    }
    
    static var primaryButton: UIFont {
        return roboto(withStyle: .medium, size: 14)
    }
    
    static var forgotButton: UIFont {
        return roboto(withStyle: .regular, size: 15)
    }
    
    static var forgotInfo: UIFont {
        return roboto(withStyle: .italic, size: 15)
    }
    
    static var tab: UIFont {
        return roboto(withStyle: .medium, size: 14)
    }
    
    static var title: UIFont {
        return roboto(withStyle: .medium, size: 18)
    }
    
    static var cellTitle: UIFont {
        return roboto(withStyle: .regular, size: 16)
    }
    
    static var cellInfo: UIFont {
        return roboto(withStyle: .regular, size: 14)
    }
    
    static var cellDate: UIFont {
        return roboto(withStyle: .regular, size: 12)
    }
}
