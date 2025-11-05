//
//  ContentView.swift
//  EdutaimentApp
//
//  Created by Bruno Amazonas Espinace on 25/10/25.
//

import SwiftUI
/*
 um aplicativo educativo para criancas onde ajuda elas a praticar com tabelas de multiplicacao "quanto e 8x7".
 O jogador deve poder escolher qual tabela ele vai querer praticar, pode ser por meio de botoes ou um stepper Üp to...
 o jogador pode escolher quantas questoes ele quer responder: 5, 10 ou 20.
 as questoes devem ser geradas randomicamente
 no final deve mostrar ao jogador quantas ele acertou e oferecer a jogar de novo.
 */
struct ContentView: View {
    @State private var quantity: Int = 5
    @State private var number: Int = 2
    @State private var title = "Let's Multiply!"
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Stepper("Which table to practice?   \(number)", value: $number, in: 1...100)
                    .padding()
                Stepper("Quantity of questions:   \(quantity)", value: $quantity, in: 5...20)
                    .padding()
                NavigationLink(destination: MultiplicationView(quantity: quantity, number: number)){
                    Text("Play!")
                        .font(.headline)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .shadow(radius: 3)
                }
                .padding(.top, 30)
                
                Spacer()
            }
            .padding()
            .navigationTitle(title)
        }
    }
}

#Preview {
    ContentView()
}
