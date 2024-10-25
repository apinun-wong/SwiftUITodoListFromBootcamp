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
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemView()
            } else {
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
                .listStyle(.plain)
            }
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

