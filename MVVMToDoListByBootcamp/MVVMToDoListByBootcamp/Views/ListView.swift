//
//  ListView.swift
//  MVVMToDoListByBootcamp
//
//  Created by Apinun on 22/10/2567 BE.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel

    var body: some View {
        List {
            ForEach(listViewModel.items) { element in
                ListRowView(item: element)
                    .onTapGesture {
                        withAnimation(.linear) {
                            listViewModel.updateItem(item: element)
                        }
                    }
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
        }
        .navigationTitle("Todo List 📒")
        .navigationBarItems(leading: EditButton(),
                            trailing: NavigationLink("Add", destination: {
            AddView()
        }))
    }
}

#Preview {
    NavigationView {
        ListView()
    }
    .environmentObject(ListViewModel())
}

