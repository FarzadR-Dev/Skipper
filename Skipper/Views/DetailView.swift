//
//  DetailView.swift
//  Skipper
//
//  Created by Farzad Rahman on 2023-09-28.
//

import SwiftUI
import PhotosUI
import UIKit

struct DetailView: View {
    @Binding var skip: Skip
    @State private var editingSkip = Skip.emptySkip
    @State private var isPresentingEditView = false
    @State var selectedItem: PhotosPickerItem?
    @State var selectedPhoto: UIImage?
    
    var body: some View {
        VStack(alignment: .center){
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                
                ZStack {
                  Circle()
                        .stroke(.black, lineWidth: 4)
                  
                    Text(String(skip.count))
                        .font(.largeTitle)
                    
                }
                .frame(width: 90, height: 90)
                .padding()

            }
            List {
                
                Section(header: Text("Details")) {
                    HStack{
                        Label("Location", systemImage: "map")
                        Spacer()
                        Text(skip.location)
                        
                        
                    }
                    .padding(.bottom)
                    HStack{
                        Label("Date/Time", systemImage: "clock")
                        Spacer()
                        Text("\(skip.date.formatted())")
                        
                    }
                    HStack {
                        Label("Theme", systemImage: "paintpalette")
                        Spacer()
                        Text(skip.theme.name)
                            .padding(4)
                            .cornerRadius(4)
                    }
                    
                }
            }
            .navigationTitle("\(skip.date.formatted())")
            .toolbar {
                Button("Edit") {
                    isPresentingEditView = true
                    editingSkip = skip
                }
            }
            .sheet(isPresented: $isPresentingEditView) {
                NavigationStack {
                    DetailEditView(skip: $editingSkip)
                        .navigationTitle("\(skip.date.formatted())")
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cancel") {
                                    isPresentingEditView = false
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Done") {
                                    isPresentingEditView = false
                                    skip = editingSkip
                                }
                            }
                        }
                }
                
            }
            
        }
        .padding()
        
        .onChange(of: selectedItem) { newItem in
            Task {
                guard let imageData = try? await newItem?.loadTransferable(type: Data.self) else { return }
                selectedPhoto = UIImage(data: imageData)
            }
        }
    }
    
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
  
            
        DetailView(skip: .constant(Skip.sampleData[1]))
                
        
    }
}
