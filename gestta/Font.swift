//
//  Font.swift
//  gestta
//
//  Created by Marcus Costa on 19/06/17.
//  Copyright © 2017 redspark. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    
    enum Style: String {
        case regular
        case italic
        case medium
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
