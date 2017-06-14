//
//  MyTextField.swift
//  gestta
//
//  Created by Weslley Neri on 13/06/15.
//  Copyright © 2017 Weslley Neri. All rights reserved.
//

import UIKit

@IBDesignable
class MyTextField: UITextField {
    
    @IBInspectable var cornerRadius: Int = 0 {
        didSet {
            layer.cornerRadius = CGFloat(cornerRadius)
        }
    }
    
    @IBInspectable var borderWidth: Int = 0 {
        didSet {
            layer.borderWidth = CGFloat(borderWidth)
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    */
    override func draw(_ rect: CGRect) {
        super.drawText(in: rect)
        
        borderStyle = .none
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        context.saveGState();
        
        borderColor.setStroke()
        context.setLineWidth(CGFloat(borderWidth))
        context.move(to: CGPoint(x: 0, y: frame.size.height - CGFloat(borderWidth)))
        context.addLine(to: CGPoint(x: frame.size.width, y: frame.size.height - CGFloat(borderWidth)))
        
        context.strokePath()
        
        context.restoreGState()
    }

}
