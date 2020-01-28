//
//  ContentView.swift
//  TipToEach 2.0
//
//  Created by UMANG BARTHWAL on 25/01/20.
//  Copyright © 2020 UMANG BARTHWAL. All rights reserved.
//

import SwiftUI

struct ContentView: View
{
    @State private var checkAmount = ""
    @State private var numberOfPeople=2
    @State private var tipPercentage=2
    let tippercentages=[10,15,20,25,0]
    
    var totalPerPerson: Double
    {
        let peopleCount=Double(numberOfPeople + 2)
        let tipSelection=Double(tippercentages[tipPercentage])
        let orderAmount=Double(checkAmount) ?? 0
        let amountPerPerson=(orderAmount+(tipSelection*orderAmount)/100)/peopleCount
        return amountPerPerson
        
    }
    
    var body: some View
    {
        NavigationView
            {
                
        Form
            {
                
                Section
                    {
                        TextField("Amount", text: $checkAmount)
                            .keyboardType(.decimalPad)
                        Picker("Number of people", selection: $numberOfPeople)
                        {
                            ForEach(2 ..< 100)
                            {
                                Text("\($0) people")
                            }
                        }
                }
                
               
                Section(header: Text("How much tip do you wanna leave ?"))
               {
                    
                       Picker("Tip Percentage", selection: $tipPercentage)
                       {
                           ForEach(0 ..< tippercentages.count)
                           {
                               Text("\(self.tippercentages[$0])%")
                           }
                       .pickerStyle(SegmentedPickerStyle())
                   }
               }

                
                Section
                    {
                        Text("$\(totalPerPerson,specifier: "%0.2f")")
                }
                
                }
        .navigationBarTitle("TipToEach", displayMode: .inline)
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
