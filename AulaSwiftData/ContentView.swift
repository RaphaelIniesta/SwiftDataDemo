//
//  ContentView.swift
//  AulaSwiftData
//
//  Created by Raphael Iniesta Reis on 19/02/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var context
    @Query private var items: [DataManager]
    
    @State var text: String = ""
    
    // Funções
    func addItem(_ item: String) {
        let item = DataManager(item: item)
        context.insert(item)
    }
    
    func deleteItem(_ item: DataManager) {
        context.delete(item)
    }
    
    func updateItem(_ item: DataManager) {
        item.item += " Atualizada"
        try? context.save()
    }
    
    var body: some View {
        VStack {
            
            HStack {
                TextField("Adicionar item", text: $text)
                    .textFieldStyle(.roundedBorder)
                
                Button {
                    addItem(text)
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                }
            }
            
            Spacer()
            
            List {
                ForEach(items) { item in
                    HStack {
                        Text(item.item)
                        
                        Spacer()
                        
                        Button {
                            updateItem(item)
                        } label: {
                            Image(systemName: "arrow.triangle.2.circlepath")
                        }
                    }
                }
                .onDelete { indexes in
                    for index in indexes {
                        deleteItem(items[index])
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
