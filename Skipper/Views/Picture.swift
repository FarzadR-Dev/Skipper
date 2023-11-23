import SwiftUI
import PhotosUI
import UIKit

@MainActor
final class PictureViewModel: ObservableObject {
    
    @Published private(set) var selectedImage: UIImage? = nil
    @Published var imageSelection: PhotosPickerItem? = nil {
        didSet{
            
        }
    }
    
    private func setImage(from selection: PhotosPickerItem?){
        guard let selection else {return}
        
        Task {
            if let data = try? await selection.loadTransferable(type: Data.self){
                if let uiImage = UIImage(data: data) {
                    selectedImage = uiImage
                    return
                }
            }
        }
    }
    
}
struct PictureView: View {
    
    @StateObject private var viewModel = PictureViewModel()
    @State private var selectedImageData: Data? = nil
    
    var body: some View {
        VStack(spacing: 40) {
            
            if let image = viewModel.selectedImage {
                Image(uiImage: image )
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .cornerRadius(10)
            }
            
            PhotosPicker(selection: $viewModel.imageSelection, matching: .images){
                Text("Select a photo!")
                    .foregroundColor(.green)
            }
            
        }
    }
}
