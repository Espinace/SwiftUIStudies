//
//  MultiplicationView.swift
//  EdutaimentApp
//
//  Created by Bruno Amazonas Espinace on 25/10/25.
//

import SwiftUI

struct MultiplicationView: View {
    
    let quantity: Int
    let number: Int
    
    @State private var questions: [Question] = []
    @State private var showResults = false
    @State private var totalCorrect = 0

    struct Question: Identifiable {
        let id = UUID()
        let multiplier: Int
        var answer: String = ""
        var correct: Bool? = nil
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20){
                Text("Multiplying table of \(number)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                ForEach($questions) { $question in
                    HStack {
                        Text("\(number) × \(question.multiplier) = ")
                            .font(.title2)
                            .frame(width: 100, alignment: .leading)
                        
                        TextField("Answer", text: $question.answer)
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 80)
                            .keyboardType(.numberPad)
                    }
                }
                if showResults {
                    Text("Você acertou \(totalCorrect) de \(quantity) questões!")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .padding(.top, 10)
                }
                
                Button(action: checkAnswers) {
                    Text(showResults ? "Restart" : "Verify answers")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .cornerRadius(10)
                        .shadow(radius: 3)
                }
                .padding(.top, 20)
            }
            .padding()
        }
        .onAppear(perform: generateQuestions)
    }
        
        func generateQuestions() {
                var generatedMultipliers = Set<Int>()
                var newQuestions: [Question] = []

                while newQuestions.count < quantity {
                    let randomMultiplier = Int.random(in: 1...100)
                    if !generatedMultipliers.contains(randomMultiplier) {
                        generatedMultipliers.insert(randomMultiplier)
                        newQuestions.append(Question(multiplier: randomMultiplier))
                    }
                }

                self.questions = newQuestions
                self.showResults = false
            }
        
        func checkAnswers() {
            var correctCount = 0
            
            for i in questions.indices {
                if let userAnswer = Int(questions[i].answer) {
                    questions[i].correct = (userAnswer == number * questions[i].multiplier)
                    if questions[i].correct == true { correctCount += 1 }
                } else {
                    questions[i].correct = false
                }
            }
            
            totalCorrect = correctCount
            showResults = true
            }
        }

