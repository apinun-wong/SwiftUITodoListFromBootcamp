//
//  AddView.swift
//  MVVMToDoListByBootcamp
//
//  Created by Apinun on 22/10/2567 BE.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
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
                    saveButtonPressed()
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
        .alert("Alert Title",
               isPresented: $showAlert, actions:{
            Button("OK", role: .cancel) { }
        }, message: {
            Text(alertTitle)
        })
    }
    
    func saveButtonPressed() {
        if isTextAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func isTextAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo list must be at least 3 characters long. ❌❌❌"
            showAlert = true
            return false
        }
        showAlert = false
        return true
    }
    
    func getAlert() -> Alert {
        Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationView {
        AddView()
    }
    .environmentObject(ListViewModel())
}
