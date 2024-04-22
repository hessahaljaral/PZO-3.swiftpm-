//
//  SecondView.swift
//  PZO
//
//  Created by hessah aljarallah  on 31-01-2024.
//

import Foundation
import SwiftUI


struct SecondView: View {
    @State private var isStarted = false
    
    var body: some View {
        ZStack {
            VStack {
                Color(hex: "#D86787")
                    .ignoresSafeArea()
                    .padding()
            }
            .background(Color(hex: "D86787"))
            .edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .fill(Color(hex: "#33215F"))
                .frame(width: 550, height: 690)
                .cornerRadius(51)
                .overlay(
                    VStack {
                        Spacer()
                        Text("Let's get to know each other a little🙂")
                            .font(.title3)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                        Spacer()
                        Text("Imagine that we have a small light💡 bulb that can be on or off. We can use the number 1 to represent a light bulb on and use the number 0 to represent a light bulb that is off.")
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding()
                            .multilineTextAlignment(.center)
                        Text("Using only these two numbers, you can represent any information in the computer. For example, you can use the numbers 0 and 1 to represent letters, numbers, pictures, sounds, and other information for me to understand🧠.")
                            .font(.title3)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                        Spacer()
                        Text("Let's learn how to read letters in my language 🖥️")
                            .font(.title3)
                            .foregroundColor(Color.white)
                            .padding()
                            .multilineTextAlignment(.center)
                        Spacer()
                        Text("Don't worry, you always win on the second try🏆")
                            .font(.title3)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                        Spacer()
                        Button(action: {
                            isStarted = true
                        }) {
                            Text("Start")
                                .font(.largeTitle)
                                .foregroundColor(Color.white)
                        }
                        .padding()
                        .fullScreenCover(isPresented: $isStarted) {
                            ThirdView()
                        }
                    }
                )
            
//            
            Image("computer2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 300)
                .offset(x: -200, y: UIScreen.main.bounds.height/2 - 100) 
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}

