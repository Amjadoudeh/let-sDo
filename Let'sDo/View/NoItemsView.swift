//
//  NonItemsView.swift
//  Let'sDo
//
//  Created by Amjad Oudeh on 14.09.22.
//

import SwiftUI

struct NoItemsView: View {
    @State var animate = false
    let secoundaryAccentColor = Color("SecoundaryAccentColor")
    
    var body: some View {
        ScrollView {
            VStack {
                Text("There is no items yet!")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.bottom)
                Text("Get more orgnise and click the button below to start adding new things to do..")
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 20)
                NavigationLink(
                    destination: AddToView(),
                    label: {
                    Text("Add you first item 😃")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 60)
                        .frame(maxWidth: .infinity)
                        .background(animate ? secoundaryAccentColor : Color.accentColor)
                        .cornerRadius(10)
                })
                .padding(.horizontal, animate ? 30 : 50)
                .scaleEffect(animate ? 1.1 : 0.8)
                .offset(y: animate ?  -6 : 0)
                .shadow(color: animate ? secoundaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                        radius: animate ? 40 : 20,
                        y: animate ? 20 : 10)
                
            }
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1 ) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NonItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NoItemsView()
    }
}
