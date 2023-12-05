//
//  ContentView.swift
//  UnitConverter
//
//  Created by Student1 on 05/12/2023.
//


import SwiftUI

struct ContentView: View {
    @State private var inputUnit = "Meters"
    @State private var outputUnit = "Meters"
    @State private var inputValue = ""

    let units = ["Meters", "Kilometers", "Feet", "Yards", "Miles"]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input")) {
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(units, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())

                    TextField("Value", text: $inputValue)
                        .keyboardType(.decimalPad)
                }

                Section(header: Text("Output")) {
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(units, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())

                    Text("Converted Value: \(convertUnits())")
                }
            }
            .navigationBarTitle("Length Converter")
        }
    }

    func convertUnits() -> String {
        let inputValue = Double(self.inputValue) ?? 0
        let baseValue = convertToMeters(value: inputValue, unit: inputUnit)
        let convertedValue = convertFromMeters(value: baseValue, unit: outputUnit)
        return String(format: "%.2f", convertedValue)
    }

    func convertToMeters(value: Double, unit: String) -> Double {
        // Conversion logic to meters
        switch unit {
            case "Kilometers": return value * 1000
            case "Feet": return value / 3.2808
            case "Yards": return value / 1.0936
            case "Miles": return value * 1609.34
            default: return value // Meters
        }
    }

    func convertFromMeters(value: Double, unit: String) -> Double {
        // Conversion logic from meters
        switch unit {
            case "Kilometers": return value / 1000
            case "Feet": return value * 3.2808
            case "Yards": return value * 1.0936
            case "Miles": return value / 1609.34
            default: return value // Meters
        }
    }
}
 
