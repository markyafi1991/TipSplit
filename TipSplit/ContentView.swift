//
//  ContentView.swift
//  TipSplit
//
//  Created by Mark on 2/12/26.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    var calculator: BillCalculator {
        BillCalculator(
            amount: checkAmount,
            people: numberOfPeople,
            tipPercentage: tipPercentage
        )
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(1..<100, id: \.self) {
                            Text($0 == 1 ? "1 person" : "\($0) people")
                        }
                    }
                    .pickerStyle(.menu)
                }
                Section("How much tip do you want to leave?") {
                    Picker("Tip percentage", selection: $tipPercentage){
                        ForEach(0..<101, id: \.self) {
                            Text(Double($0) / 100, format: .percent)
                        }
                    }
                    .pickerStyle(.menu)
                }
                Section("Amount per person") {
                    Text(calculator.totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                Section("Total amount") {
                    Text(calculator.grandTotal, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .foregroundStyle(tipPercentage == 0 ? .red : .primary)
                    
                    if tipPercentage == 0 {
                        Text("No tip selected")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle("TipSplit")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Reset") {
                        checkAmount = 0
                        numberOfPeople = 2
                        tipPercentage = 20
                        amountIsFocused = false
                    }
                }
                
                if amountIsFocused {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") { amountIsFocused = false }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
