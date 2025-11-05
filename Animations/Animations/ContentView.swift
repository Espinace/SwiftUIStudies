//
//  ContentView.swift
//  Animations
//
//  Created by Bruno Amazonas Espinace on 29/01/25.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 0.0
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    let letters = Array("Hello SwiftUI")
    
    var body: some View {
        HStack(spacing: 0){
            ForEach(0..<letters.count, id: \.self){ num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? .blue : .red)
                    .offset(dragAmount)
                    .animation(.linear.delay(Double(num) / 20), value: dragAmount)
            }
        }
        .gesture(
            DragGesture()
                .onChanged{ dragAmount = $0.translation }
                .onEnded{ _ in
                    dragAmount = .zero
                    enabled.toggle()
                }
        )
        
        //        LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
        //            .frame(width: 300, height: 200)
        //            .clipShape(.rect(cornerRadius: 10))
        //            .offset(dragAmount)
        //            .gesture(
        //                DragGesture()
        //                    .onChanged { dragAmount = $0.translation }
        //                    .onEnded { _ in
        //                        withAnimation(.bouncy){
        //                            dragAmount = .zero
        //                        }
        //                    }
        //            )
        //            .animation(.bouncy, value: dragAmount)
        
        
        //        Button("Tap Me"){
        //            enabled.toggle()
        //        }
        //        .frame(width: 200, height: 200)
        //        .background(enabled ? .blue : .red)
        //        .foregroundStyle(.white)
        //        .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
        //        .animation(.default, value: enabled)
        
                Button("Tap Me"){
                    withAnimation(.spring(duration: 1, bounce: 0.5)){
                        animationAmount += 360
                    }
                }
                .padding(50)
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(.circle)
                .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 0, z: 1))
        
        //        print(animationAmount)
        //
        //        return VStack{
        //            Stepper("Scale amount", value: $animationAmount.animation(), in: 1...10)
        //
        //            Spacer()
        //
        //            Button("Tap Me"){
        //                animationAmount += 1
        //            }
        //            .padding(40)
        //            .background(.blue)
        //            .foregroundStyle(.white)
        //            .clipShape(.circle)
        //            .scaleEffect(animationAmount)
        //        }
        
        VStack {
            Button("Tap Me"){
                animationAmount += 1
            }
            .padding(50)
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .overlay(
                Circle()
                    .stroke(.blue)
                    .scaleEffect(animationAmount)
                    .opacity(2 - animationAmount)
                    .animation(
                        .easeOut(duration: 1)
                        .repeatForever(autoreverses: false),
                        value: animationAmount)
            )
        }
        .onAppear{
            animationAmount = 2
        }
    }
}

#Preview {
    ContentView()
}
