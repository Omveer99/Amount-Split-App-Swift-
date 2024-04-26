//
//  mainUi.swift
//  Omveer`s App
//
//  Created by Omveer Panwar on 29/02/24.
//

import SwiftUI

struct mainUi: View {
    @State var sm = 2
    @State var checkAmount = ""
    @State var tippercent = 2
  
    let tippercentages = [10,15,20,25,0]
    
    var totalperperson : Double{
        let peoplecount = Double(sm + 2)
        let tipSelection = Double(tippercentages[tippercent])
        let orderAmount = Double(checkAmount) ?? 0
        let tipvalue = orderAmount / 100 * tipSelection
        let grandtotal = orderAmount + tipvalue
        let amountperperson = grandtotal / peoplecount
        return amountperperson
    }
    var body: some View {
        
        NavigationView{
            Form{
                Section{
                    TextField("ENTER Amount", text: $checkAmount)
                    Picker("number of peoples", selection: $sm){
                        ForEach(2..<100){
                            Text("\($0) peoples")
                    }
                }
            }
                Section(header: Text("How much tip you want to leave?")){
                    Picker("Tip Percentage", selection: $tippercent){
                        ForEach(0..<tippercentages.count){
                            Text("\(self.tippercentages[$0]) %")
                    }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section{
                    Text("$\(totalperperson, specifier: "%.2f")")
                }
            
        }.navigationBarTitle("Amount Split App", displayMode: .inline)
        
            
            
        }
    }
}

#Preview {
    mainUi()
}
