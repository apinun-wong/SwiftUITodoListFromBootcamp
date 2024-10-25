//
//  ListViewModel.swift
//  MVVMToDoListByBootcamp
//
//  Created by Apinun on 23/10/2567 BE.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    let itemKey: String = "itemsList"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard let items = UserDefaults.standard.data(forKey: itemKey),
            let saveItems = try? JSONDecoder().decode([ItemModel].self, from: items) else {
            return
        }
        self.items = saveItems
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
    
    func saveItems() {
        if let encodeData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodeData, forKey: itemKey)
        }
    }
}
