//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Bruno Amazonas Espinace on 21/01/25.
//

import SwiftUI

struct FlagImage: View {
    let flagName: String
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        Image(flagName)
            .resizable()
            .scaledToFit()
            .frame(width: width, height: height)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var finalScore = 0
    
    @State private var answersCount = 0
    @State private var endGame = false
    
    var body: some View {
        ZStack{
            RadialGradient(stops: [
                .init(color: Color(red: 0.38, green: 0.41, blue: 0.36), location: 0.3),
                .init(color: Color(red:0.76, green:0.15, blue:0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                VStack(spacing: 15) {
                    VStack{
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3){ number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagImage(flagName: countries[number], width: 200, height: 120)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(finalScore)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
            
        }
        .alert(scoreTitle, isPresented: $showingScore){
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(finalScore)!")
        }
        .alert("You nailed it!", isPresented: $endGame){
            Button("Reset", action: resetGame)
        } message: {
            Text("Your final score is \(finalScore)!")
        }
    }
    func flagTapped(_ number: Int){
        if number == correctAnswer {
            scoreTitle = "Correct!"
            finalScore += 1
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
        }
        showingScore = true
        answersCount += 1
        
        if answersCount == 8 {
            endGame = true
        }
        
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func resetGame(){
        finalScore = 0
    }
}

#Preview {
    ContentView()
}
