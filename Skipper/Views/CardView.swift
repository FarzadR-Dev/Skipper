//
//  CardView.swift
//  Skipper
//
//  Created by Farzad Rahman on 2023-09-27.
//

import SwiftUI

struct CardView: View {
    
    
    let skip: Skip

    var body: some View {
        HStack(alignment: .top) {
            Text(String(skip.count))
                .font(.largeTitle)
            Spacer()
            
            Label(skip.date.formatted(date:.abbreviated, time: .omitted), systemImage: "clock")
                    .padding(.trailing, 20)
                
                Spacer()
                Label("\(skip.location)", systemImage: "map")
        }
        .padding()
    }
}

struct CardView_Previews: PreviewProvider {
    static var skip = Skip.sampleData[0]
    static var previews: some View {
        CardView(skip: skip)
            .background(skip.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
