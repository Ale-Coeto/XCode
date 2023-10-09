//
//  SleepModeView.swift
//  MLApp
//
//  Created by Alejandra Coeto on 07/02/23.
//

import SwiftUI
import CoreML

struct SleepModeView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var stressAmount = 5

    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("When do you want to wake up?")
                        .font(.headline)
                    DatePicker("Please select", selection: $wakeUp, displayedComponents: .hourAndMinute).labelsHidden()
                }
                Section {
                    Text("Desired amount of sleep")
                        .font(.headline)
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                    
                }
                Section {
                    Text("Stresslevel")
                        .font(.headline)
                    Stepper("\(stressAmount)", value: $stressAmount, in: 1...10)
                }
                Section {
                    Text("Your optimal sleep")
                        .font(.headline)
                    Text(self.calculateBedTime())
                        .font(.system(size: 34))
                }
            }
            
        }
    }
            func calculateBedTime() -> String {
                let bedTime: String
                do {
                    let config = MLModelConfiguration()
                    let model = try
                    SleepyTimeSleepMode(configuration: config)
                    let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
                    let hour = (components.hour ?? 0) * 60 * 60
                    let minute = (components.minute ?? 0) * 60
                    let prediction = try
                    model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, stress: Double(stressAmount))
                    let sleepTime = wakeUp - prediction.actualSleep
                    let dateOfSleepTime = sleepTime.formatted(date: .omitted, time: .shortened)
                    bedTime = "\(dateOfSleepTime)"
                    return bedTime
                    
                } catch{
                    bedTime = "Sorry, problem"
                    return bedTime
                }
            }
        }
    

struct SleepModeView_Previews: PreviewProvider {
    static var previews: some View {
        SleepModeView()
    }
}
