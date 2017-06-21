//
//  ControllerIndentifiers.swift
//  starter-kit
//  gestta2
//
//  Created by Weslley Neri on 20/06/15.
//  Copyright © 2017 Weslley Neri. All rights reserved.
//

import Foundation
import UIKit
import RSStarterKit

enum ControllerIdentifier: String, RSCustomIdentifier {
    
    case viewController = "ViewController"
    
}

extension ControllerIdentifier {
    
    func getViewController(on storyboard: UIStoryboard) -> UIViewController {
        return storyboard.instantiateViewControllerWithIdentifier(self)
    }
    
}

