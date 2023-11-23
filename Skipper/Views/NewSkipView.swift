//
//  NewSkipView.swift
//  Skipper
//
//  Created by Farzad Rahman on 2023-10-26.
//

import SwiftUI

struct NewSkipView: View {
    
    @State var tempCount: Int = 0
    
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
            
            Button(action: {
                
            }){
                Text("Save")
            }
        }
    }
}

struct NewSkipView_Previews: PreviewProvider {
    static var previews: some View {
        NewSkipView(isPresentingNewSkipView: .constant(true))
    }
}
