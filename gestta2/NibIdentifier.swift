//
//  NibIdentifier.swift
//  starter-kit
//  gestta2
//
//  Created by Weslley Neri on 20/06/15.
//  Copyright © 2017 Weslley Neri. All rights reserved.
//

import Foundation
import UIKit
import RSStarterKit

enum NibIdentifier: String, RSCustomIdentifier {
    
    case defaultNib = "DefaultNib"

}

extension NibIdentifier {
    
    func getNib(bundle: Bundle? = nil) -> UINib {
        return UINib(identifier: self, bundle: bundle)
    }
    
}


