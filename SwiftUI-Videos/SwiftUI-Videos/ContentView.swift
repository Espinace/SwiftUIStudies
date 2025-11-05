//
//  ContentView.swift
//  SwiftUI-Videos
//
//  Created by Bruno Amazonas Espinace on 19/09/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List(0..<20){ item in
                HStack{
                    Image("DC122CE4-6520-4235-91C3-262187E55B79")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 90)
                        .cornerRadius(8)
                    
                    Spacer().frame(width: 16)
                    
                    VStack(alignment: .leading) {
                        Text("JB, O melhor para voce!")
                            .fontWeight(.semibold)
                            .lineLimit(2)
                            .minimumScaleFactor(0.75)
                        Spacer().frame(height: 5)
                        Text("08/10/2023")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
            }.navigationTitle("Fotos JB")
        }
    }
}

#Preview {
    ContentView()
}
