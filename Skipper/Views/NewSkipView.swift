//
//  NewSkipView.swift
//  Skipper
//
//  Created by Farzad Rahman on 2023-10-26.
//

import SwiftUI

struct NewSkipView: View {
    
    @State var tempCount: Int = 0
    @Binding var skips: [Skip]
    @State private var newSkip = Skip.emptySkip
        @Binding var isPresentingNewSkipView: Bool
     

    var body: some View {
        VStack{
        Button(action: {
            self.tempCount += 1
        }) {
            ZStack {
                Circle()
                    .stroke(.black, lineWidth: 7)
                VStack{
                    Text(((tempCount>0) ? "" : "Tap to increment"))
                    Text(((tempCount > 0) ? "\(tempCount)" : "0"))
                        .font(.largeTitle)
                }
                
            }
            .padding()
            
        }
            Button(action: {
                self.tempCount = 0
            }){
                Text("Reset")
            }
            .padding()
            Form{
                TextField("Location", text: $newSkip.location)
                ThemePicker(selection: $newSkip.theme)
                Text("Date: \(Date().formatted(date:.abbreviated, time: .omitted))")
            }
            .background(newSkip.theme.mainColor)
            Button(action: {
                newSkip.count = tempCount
                newSkip.date = Date()
                
                skips.append(newSkip)
                isPresentingNewSkipView = false
            }){
                Text("Save")
            }
            
        }
    }
}

struct NewSkipView_Previews: PreviewProvider {
    static var previews: some View {
        NewSkipView(skips: .constant(Skip.sampleData), isPresentingNewSkipView: .constant(true))
    }
}
