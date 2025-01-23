//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Bruno Amazonas Espinace on 23/01/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var choice = ""
    @State private var result = false
    @State private var gameMove = Int.random(in: 0...2)
    @State private var finalScore = 0
    @State private var answersCount = 0
    @State private var endGame = false
    
    let moves = ["Rock", "Paper", "Scissors"]
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(red: 0.38, green: 0.41, blue: 0.36), .brown], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                Spacer()
                
                HStack{
                    Text("Rock,").foregroundStyle(.gray)
                    Text("Paper,").foregroundStyle(.white)
                    Text("Scissors").foregroundStyle(.teal)
                }
                Text("GO!")
                    .foregroundStyle(.black)
                    .font(.system(size: 100, weight: .bold, design: .default))
                
                Spacer()
                Text("Choose your move!")
                HStack{
                    Button("Rock"){
                        moveTapped(0)
                    }
                    Button("Paper"){
                        moveTapped(1)
                    }
                    Button("Scissors"){
                        moveTapped(2)
                    }
                }
                .foregroundStyle(.white)
                
                Spacer()
                Spacer()
                
                Text("Score: \(finalScore)")
                .foregroundStyle(.teal)
            }
            .padding()
            .font(.largeTitle.bold())
        }
        .alert("Nice Move!", isPresented: $result){
            Button("Continue", action: continuePlaying)
        } message: {
            Text("Your score is \(finalScore)")
        }
        .alert("How did it go?", isPresented: $endGame){
            Button("Restart", action: restartGame)
        } message: {
            Text("\(finalScore)/10")
        }
    }
    
    func moveTapped(_ number: Int){
    if number != gameMove{
        if number == 0 && gameMove == 2{
            finalScore += 1
        }else if number == 1 && gameMove == 0{
            finalScore += 1
        }else if number == 2 && gameMove == 1{
            finalScore += 1
        }else{
            finalScore -= 1
        }
        answersCount += 1
    } else {
        finalScore += 0
    }
    
    if answersCount == 10 {
            endGame = true
    }
        continuePlaying()
        result = true
    }
    
    func continuePlaying(){
        gameMove = Int.random(in: 0...2)
    }
    
    func restartGame(){
        finalScore = 0
        answersCount = 0
        endGame = false
        continuePlaying()
    }
}

#Preview {
    ContentView()
}
