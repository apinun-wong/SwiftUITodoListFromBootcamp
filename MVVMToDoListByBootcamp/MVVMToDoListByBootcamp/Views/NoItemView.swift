//
//  NoItemView.swift
//  MVVMToDoListByBootcamp
//
//  Created by Apinun on 23/10/2567 BE.
//

import SwiftUI

struct NoItemView: View {
    @State var animate: Bool = false
    var body: some View {
        ScrollView {
            VStack(spacing: 18) {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a production product! Are you a production product! Are you a production product! Are you a production product!")
                NavigationLink(destination: {
                    AddView()
                }, label: {
                    Text("Add Someting 😘")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? .red: .accent)
                        .cornerRadius(12)
                        .onAppear(perform: startInfiniteAnimation)
                        .padding(10)
                        .shadow(color: animate ? .secondaryAccent.opacity(0.7): .accent.opacity(0.7),
                                    radius: animate ? 30 : 10,
                                x:0,
                                y: animate ? 50 : 30)
                })
                .padding(.horizontal, 30)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
        }
        .frame(maxWidth: 400)
    }
    
    private func startInfiniteAnimation() {
        withAnimation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
            animate.toggle() // Toggle the scale to trigger the animation
        }
    }
}

#Preview {
    NoItemView()
}
