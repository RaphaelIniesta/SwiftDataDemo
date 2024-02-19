//
//  DataManager.swift
//  AulaSwiftData
//
//  Created by Raphael Iniesta Reis on 19/02/24.
//

import Foundation
import SwiftData

@Model
class DataManager: Identifiable {
    var item: String
    
    init(item: String) {
        self.item = item
    }
}
