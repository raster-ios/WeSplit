//
//  ContentView.swift
//  WeSplit
//
//  Created by Gena Raster on 28.11.21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeopleIndex = 2
    @State private var tipPercentage = 20
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
                
                Picker("Select number of people", selection: $numberOfPeopleIndex) {
                    ForEach(2..<20) {
                        Text("\($0) people")
                    }
                }
                .pickerStyle(.automatic)
                
                Picker("Tips", selection: $tipPercentage) {
                    ForEach(tipPercentages, id: \.self) {
                        Text($0, format: .percent)
                    }
                }
                .pickerStyle(.segmented)
                
                Spacer()
            }
            .padding()
            .navigationTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
