//
//  ViewModel.swift
//  PZO
//
//  Created by hessah aljarallah  on 07-02-2024.
//

import Foundation
import SwiftUI

class AlphabetViewModel: ObservableObject {
    @Published var currentIndex = 0
    let model = AlphabetModel()
    
    func previousLetter() {
        if currentIndex > 0 {
            currentIndex -= 1
        }
    }
    
    func nextLetter() {
        if currentIndex < model.letters.count - 1 {
            currentIndex += 1
        }
    }
    @Published var pin = [("A", "01000001"), ("B", "01000010"),("C", "01000011"), ("D", "01000100"),("E", "01000101"),("F", "01000110"),("G", "01000111"),( "H", "01001000"),("I", "01001001"),("J", "01001010"),( "K", "01001011"),( "L", "01001100"),( "M", "01001101"),( "N", "01001110"),( "O", "01001111"),( "P", "01010000"),( "Q", "01010001"),( "R", "01010010"),( "S", "01010011"),("T", "01010100"),( "U", "01010101"),( "V", "01010110"),( "W", "01010111"),( "X", "01011000"),( "Y", "01011001"),( "Z", "01011010")]
    
    
    
}
