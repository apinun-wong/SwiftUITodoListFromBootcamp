//
//  ListView.swift
//  MVVMToDoListByBootcamp
//
//  Created by Apinun on 22/10/2567 BE.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [String] = [
        "This is the first title!",
        "This is the second!",
        "Third!"
    ]
    var body: some View {
        List {
            ForEach(items, id: \.self) { element in
                ListRowView(title: element)
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
}

