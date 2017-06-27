//
//  ControllerIndentifiers.swift
//  starter-kit
//  gestta
//
//  Created by Marcus Costa on 19/06/17.
//  Copyright © 2017 redspark. All rights reserved.
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

