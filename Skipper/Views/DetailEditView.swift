//
//  DetailEditView.swift
//  Skipper
//
//  Created by Farzad Rahman on 2023-10-05.
//

import SwiftUI
import PhotosUI
import UIKit



struct DetailEditView: View {
    @State var selectedItem: PhotosPickerItem?
    @State var selectedPhoto: UIImage?
    @Binding var skip: Skip

    var body: some View {
        Form{
            Section(header: Text("Skip Details")){
                TextField("# of Skips", value: $skip.count, format: .number)
                                .textFieldStyle(.roundedBorder)
                TextField("Location", text: $skip.location)
               ThemePicker(selection: $skip.theme)
                
            }
            
            
            VStack {
                if let photo = selectedPhoto {
                    Image(uiImage: photo)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                }
     
     
                PhotosPicker(selection: $selectedItem,
                             matching: .images) {
                    Text("something")
                }
            }
            .onChange(of: selectedItem) { newItem in
                Task {
                    guard let imageData = try? await newItem?.loadTransferable(type: Data.self) else { return }
                    selectedPhoto = UIImage(data: imageData)
                    skip.image = selectedPhoto
                }
            }
        }
        .padding()

    }
}

//func loadTransferable(from imageSelection: PhotosPickerItem) -> Progress {
//    return imageSelection.loadTransferable(type: Image.self) { result in
//        DispatchQueue.main.async {
//            guard imageSelection == self.imageSelection else { return }
//            switch result {
//            case .success(let image?):
//                // Handle the success case with the image.
//            case .success(nil):
//                // Handle the success case with an empty value.
//            case .failure(let error):
//                // Handle the failure case with the provided error.
//            }
//        }
//    }
//}

#Preview {
    DetailEditView(skip: .constant(Skip.sampleData[1]))
    
}
