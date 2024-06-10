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
    @EnvironmentObject var vm: ViewController
    
    @State var text: String = ""
    
    var body: some View {
        VStack {
            
            HStack {
                TextField("Adicionar item", text: $text)
                    .textFieldStyle(.roundedBorder)
                
                Button {
                    vm.addItem(text, context: context)
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
                            vm.updateItem(item, context: context)
                        } label: {
                            Image(systemName: "arrow.triangle.2.circlepath")
                        }
                    }
                }
                .onDelete { indexes in
                    for index in indexes {
                        vm.deleteItem(items[index], context: context)
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
