//
//  ViewController.swift
//  AulaSwiftData
//
//  Created by Raphael Iniesta Reis on 10/06/24.
//

import Foundation
import SwiftData

class ViewController: ObservableObject {
    func addItem(_ item: String, context: ModelContext) {
        let item = DataManager(item: item)
        context.insert(item)
    }
    
    func deleteItem(_ item: DataManager, context: ModelContext) {
        context.delete(item)
    }
    
    func updateItem(_ item: DataManager, context: ModelContext) {
        item.item += " Atualizada"
        try? context.save()
    }
}
