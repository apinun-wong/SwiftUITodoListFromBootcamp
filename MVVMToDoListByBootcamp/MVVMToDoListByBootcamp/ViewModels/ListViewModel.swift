//
//  ListViewModel.swift
//  MVVMToDoListByBootcamp
//
//  Created by Apinun on 23/10/2567 BE.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems: [ItemModel] = [
            ItemModel(title: "This is the first title!", isCompleted: false),
            ItemModel(title: "This is the second title!", isCompleted: true),
            ItemModel(title: "This is the third title!", isCompleted: false)
        ]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from source: IndexSet, to destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompleted()
        }
    }
}
