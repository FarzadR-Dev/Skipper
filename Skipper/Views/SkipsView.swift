//
//  SkipsView.swift
//  Skipper
//
//  Created by Farzad Rahman on 2023-09-28.
//

import SwiftUI

struct SkipsView: View {
    @Binding var skips: [Skip]
    @State private var isPresentingNewScrumView = false
    
    var body: some View {
        NavigationStack {
            List($skips) { $Skip in
                NavigationLink(destination: DetailView(skip: $Skip)){
                    CardView(skip: Skip)
                }
                .listRowBackground(Skip.theme.mainColor)
            //                Divider()
            }
            .navigationTitle("History of Skips")
            .toolbar {
                Button(action: {
                    isPresentingNewScrumView = true
                }){
                        Image(systemName: "plus")
                }
                }
            }
        .sheet(isPresented: $isPresentingNewScrumView) {
            
        }
        }
        
}

struct SkipsView_Previews: PreviewProvider {
    static var previews: some View {
        SkipsView(skips: .constant(Skip.sampleData))
    }
}
