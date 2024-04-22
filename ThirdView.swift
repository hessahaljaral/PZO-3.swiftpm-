//
//  ThirdView.swift
//  PZO
//
//  Created by hessah aljarallah  on 07-02-2024.
//
import SwiftUI

struct ThirdView: View {
    // Observable object for the AlphabetViewModel
    @ObservedObject var viewModel = AlphabetViewModel()
    
    // State variables for elapsed time, input values, button press, correctness of numbers, and animation state
    @State private var secondsElapsed = 0
    @State private var inputValues = [String](repeating: "", count: 8)
    @State private var isButtonPressed = false
    @State private var allNumbersCorrect = false

    var body: some View {
        ZStack {
            Color(hex: "#D86787")
                .ignoresSafeArea()
            
            VStack {
                // Displaying the prompt and elapsed time
                HStack {
                    Text("Guess how the computer reads the letters in record time:")
                        .font(.body)
                        .foregroundColor(Color(red: 0.269, green: 0.177, blue: 0.484))
                    
                    Text("\(secondsElapsed)")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.trailing, 16)
                        .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
                            secondsElapsed += 1
                        }
                }
                
                // Controls for navigating between letters
                HStack(spacing: 16) {
                    Button(action: {
                        viewModel.previousLetter()
                        resetInputValues()
                    }) {
                        Image(systemName: "arrow.left")
                            .font(.system(size: 63))
                            .foregroundColor(.white)
                            .padding(.leading, 16)
                    }
                    
                    Text(String(viewModel.pin[viewModel.currentIndex].0))
                        .font(.system(size: 361, weight: .regular))
                        .foregroundColor(.white)
                        .padding()
                    
                    Button(action: {
                        viewModel.nextLetter()
                        resetInputValues()
                    }) {
                        Image(systemName: "arrow.right")
                            .font(.system(size: 63))
                            .foregroundColor(.white)
                            .padding(.trailing, 20)
                    }
                }
                
                // TextFields for entering binary digits
                HStack(spacing: 16) {
                    ForEach(0..<8, id: \.self) { index in
                        TextField("", text: $inputValues[index])
                            .font(.system(size: 36, weight: .bold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .frame(width: 40, height: 40)
                            .background(inputColor(for: index))
                            .cornerRadius(8)
                            .textContentType(.none)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                            .onChange(of: inputValues[index]) { newValue in
                                checkAllNumbersCorrect()
                            }
                    }
                    // Button to reset input values
                    Button(action: {
                        resetInputValues()
                        isButtonPressed.toggle()
                    }) {
                        Image(systemName: "repeat")
                            .font(.system(size: 50, weight: .bold))
                            .foregroundColor(isButtonPressed ? Color(hex: "#33215F") : .black)
                    }
                }
                
                // Buttons for entering '0' and '1', and to delete the last input
                HStack {
                    
                    BinaryButton(text: "0", action: appendInputValue)
                        .padding(.top, 40)
                    BinaryButton(text: "1", action: appendInputValue)
                        .padding(.top, 40)
                    Button(action: deleteLastInput) {
                        Image(systemName: "delete.right.fill")
                            .font(.system(size: 70))
                            .foregroundColor(.black)
                    }
                }

            }
            .padding()
            
            // Display Lottie animation when all numbers are correct
            if allNumbersCorrect {
                LottieView(lottieFile: "Animation", loopMode: .loop)
                    .edgesIgnoringSafeArea(.all)
                    .onAppear {
                        // Stop the animation after 3 seconds
                        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
                            allNumbersCorrect = false
                        }
                    }
            }
        }
    }
    
    // Function to determine the background color of the TextField based on correctness
    private func inputColor(for index: Int) -> Color {
        let bin = viewModel.pin[viewModel.currentIndex].1
        guard let charIndex = bin.index(bin.startIndex, offsetBy: index, limitedBy: bin.endIndex) else {
            return Color(hex: "#442D7B")
        }
        let correctChar = String(bin[charIndex])
        let inputChar = inputValues[index].isEmpty ? " " : inputValues[index]
        
        if inputChar == correctChar {
            return Color.green
        } else if inputChar == " " {
            return Color(hex: "#442D7B")
        } else {
            return Color.red
        }
    }

    // Function to append input value
    private func appendInputValue(_ value: String) {
        guard let index = inputValues.firstIndex(where: { $0.isEmpty }) else { return }
        inputValues[index] = value
    }
    
    // Function to delete the last input value
    private func deleteLastInput() {
        guard let index = inputValues.lastIndex(where: { !$0.isEmpty }) else { return }
        inputValues[index] = ""
    }
    
    // Function to reset input values
    private func resetInputValues() {
        inputValues.indices.forEach { inputValues[$0] = "" }
    }
    
    // Function to check if all input values are correct
    private func checkAllNumbersCorrect() {
        let bin = viewModel.pin[viewModel.currentIndex].1
        let inputString = inputValues.joined()
        allNumbersCorrect = bin == inputString
    }
}

struct BinaryButton: View {
    let text: String
    let action: (String) -> Void
    
    var body: some View {
        Button(action: {
            action(text)
        }) {
            Text(text)
                .font(.system(size: 189, weight: .regular))
                .foregroundColor(.white)
        }
        .frame(width: 230, height: 260)
        .background(Color(hex: "#33215F"))
        .cornerRadius(20)
    }
}
