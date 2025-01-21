//
//  ContentView.swift
//  TimeCoversion
//
//  Created by Bruno Amazonas Espinace on 21/01/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputNumber = 0.0
    @State private var inputUnit = ""
    @State private var outputUnit = ""
    
    let units = ["seconds", "minutes", "hours", "days"]
    
    var convertedInput: Double {
        let toConvert = inputNumber
        let inputConverted: Double
        
        if inputUnit == "minutes" {
            inputConverted = toConvert * 60
        } else if inputUnit == "hours"{
            inputConverted = toConvert * 3600
        } else if inputUnit == "days"{
            inputConverted = toConvert * 86400
        } else {
            inputConverted = toConvert
        }
        return inputConverted
    }
    
    var convertedOutput: Double {
        let outputConverted: Double
        let toConvert = convertedInput
        
        if outputUnit == "minutes" {
            outputConverted = toConvert / 60
        } else if outputUnit == "hours"{
            outputConverted = toConvert / 3600
        } else if outputUnit == "days"{
            outputConverted = toConvert / 86400
        } else {
            outputConverted = toConvert
        }
        return outputConverted
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section("Time to convert") {
                    TextField("Time to convert", value: $inputNumber, format: .number)
                        .keyboardType(.decimalPad)
                    
                    Picker("Unit to Convert", selection: $inputUnit){
                        ForEach(units, id: \.self){
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("To which unit do you want to convert?"){
                    Picker("Output Unit", selection: $outputUnit){
                        ForEach(units, id: \.self){
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Conversion result"){
                    Text(convertedOutput, format: .number)
                }
            }
            .navigationTitle("TimeConversion")
        }
    }
}
    
#Preview {
    ContentView()
}
