//
//  TableViewIdentifiers.swift
//  starter-kit
//  gestta
//
//  Created by Marcus Costa on 19/06/17.
//  Copyright © 2017 redspark. All rights reserved.
//

import Foundation
import RSStarterKit

enum TableViewCellIdentifier: String, RSCustomIdentifier {
    case defaultCell = "DefaultCell"
    
    // Task cell
    case taskCell = "TaskCell"
}

enum TableViewHeaderIdentifiers: String, RSCustomIdentifier {
    case defaultHeader = "DefaultHeader"
}

enum TableViewFooterIdentifiers: String, RSCustomIdentifier {
    case defaultFooter = "DefaultFooter"
}
