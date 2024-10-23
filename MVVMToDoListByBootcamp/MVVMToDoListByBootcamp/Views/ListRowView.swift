//
//  ListRowView.swift
//  MVVMToDoListByBootcamp
//
//  Created by Apinun on 22/10/2567 BE.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle": "circle")
                .foregroundColor(item.isCompleted ? .green: .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 4)
    }
}

#Preview {
//    static var items1 = ItemModel(title: "First", isCompleted: false)
//    static var items2 = ItemModel(title: "Second", isCompleted: false)
    ListRowView(item: .init(title: "Test 1",
                            isCompleted: false))
    ListRowView(item: .init(title: "Test 2",
                            isCompleted: false))
}
