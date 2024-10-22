//
//  AddView.swift
//  MVVMToDoListByBootcamp
//
//  Created by Apinun on 22/10/2567 BE.
//

import SwiftUI

struct AddView: View {
    @State var textFieldText: String = ""
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                HStack  {
                    Spacer()
                        .frame(width: 24)
                    TextField("Type something here...", text: $textFieldText)
                        .padding(.horizontal)
                        .frame(height: 55)
                        .background(.gray.opacity(0.2))
                        .cornerRadius(12)
                    Spacer()
                        .frame(width: 24)
                }
                Button {
                    
                } label: {
                    Spacer()
                        .frame(width: 24)
                    Text("SAVE")
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .cornerRadius(12)
                    Spacer()
                        .frame(width: 24)
                }

            }
        }
        .navigationTitle("Add an Item 📝")
    }
}

#Preview {
    NavigationView {
        AddView()
    }
}
