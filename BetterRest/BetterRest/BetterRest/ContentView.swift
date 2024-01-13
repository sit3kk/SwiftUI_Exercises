//
//  ContentView.swift
//  BetterRest
//
//  Created by Konrad Sitek on 13/01/2024.
//

import SwiftUI


struct drawText: ViewModifier {
    let font = Font.system(size: 22, weight: .heavy, design: .default)
    
    func body(content: Content) -> some View {
        content
            .font(font)
        
    }
}

struct DrawHorizontalText: View {
    var text: String
    var textResult: String
    
    
    var body: some View {
        HStack {
            Text(text)
                .modifier(drawText())
                .foregroundColor(Color.green)
            
            Text(textResult)
                .modifier(drawText())
                .foregroundColor(Color.red)
        }
    }
}


struct ContentView: View {
    
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 2
    
    
    var recommendedBadTime: String {
        calculateBedtime()
    }
    
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    
    
    let rangeOfCoffee = 1...5
    
    var body: some View {
        NavigationView {
            Form {
                
                Section(header: Text("When do you want to wake up?"), content: {
                    
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .datePickerStyle(WheelDatePickerStyle())
                    
                })
                
                Section(header: Text("Desired amount of sleep")) {
                    
                    Stepper(value: $sleepAmount, in: 0...12, step: 0.25) {
                        Text("\(sleepAmount, specifier: "%g") hours")
                    }
                }
                
                Section(header: Text("Daily coffee intake")) {
                    
                    Picker(selection: $coffeeAmount, label: Text("Daily coffe intake")) {
                        ForEach(rangeOfCoffee, id: \.self) {
                            amount in
                            Text(amount == 1 ? "1 cup" : "\(amount) cups")
                        }
                    }
                }
                
                DrawHorizontalText(text: "You ideal bedtime is: ", textResult: "\(recommendedBadTime)")
                
            }
            .navigationBarTitle("BetterRest")
        }
        
    }
    
    
    
    func runBadTime() -> String {
        return "RunbadTime"
    }
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
    func calculateBedtime() -> String {
    let model = SleepCalculator()
        
        let componenets = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (componenets.hour ?? 0) * 60 * 60
        let minute = (componenets.minute ?? 0) * 60
        
        do {
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            
            
            return  formatter.string(from: sleepTime)
        } catch {
            
            return "Error"
        }
    }
}
