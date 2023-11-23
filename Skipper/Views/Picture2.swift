import SwiftUI
import PhotosUI
import UIKit


struct Picture2: View {
    
    @State var selectedItem: PhotosPickerItem?
    @State var selectedPhoto: UIImage?
    
    var body: some View {
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
            }
        }
            
        }
    }



