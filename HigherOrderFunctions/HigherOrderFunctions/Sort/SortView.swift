import SwiftUI

struct Product: Identifiable {
    let id = UUID()
    let image: String
    let name: String
    let memory: Int
    let color: String
    let price: Double
}

struct SortView: View {
    @State private var sortOption: SortOption = .priceAscending
    
    let products = [
        Product(image: "iphone15", name: "iPhone 15", memory: 128, color: "White", price: 999.99),
        Product(image: "iphone15pro", name: "iPhone 15 Pro", memory: 512, color: "Black", price: 1099.99),
        Product(image: "ipad", name: "iPad Pro", memory: 256, color: "White", price: 799.99),
        Product(image: "airpods", name: "AirPods", memory: 0, color: "White", price: 249.99),
    ]
    
    var sortedProducts: [Product] {
        switch sortOption {
        case .priceAscending:
            return products.sorted { $0.price > $1.price }
        case .priceDescending:
            return products.sorted { $0.price < $1.price }
        case .memory:
            return products.sorted { $0.memory > $1.memory }
        }
    }
    
    var body: some View {
        ScrollView{
            
            HStack{
                Image(systemName: "cart")
                
                Spacer()
                
                Text("Products")
                    .font(.title)
                
                Spacer()
                
                
            }.padding(.horizontal)
            
                
            VStack{
                
                HStack{
                    Text("Newest Apple Products")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                 
                    VStack {
                        
                        Menu {
                            Button(action: {
                                sortOption = .priceAscending
                            }) {
                                Text("Price (Higher To Lower)")
                            }
                            
                            Button(action: {
                                sortOption = .priceDescending
                            }) {
                                Text("Price (Lower To Higher)")
                            }
                            
                            Button(action: {
                                sortOption = .memory
                            }) {
                                Text("Memory Space (Higher First)")
                            }
                        } label: {
                            Image(systemName: "ellipsis")
                                .font(.title)
                                .foregroundColor(.black)
                                .padding()
                        }
                    }

                }
                ForEach(sortedProducts) { product in
                    HStack {
                        Image(product.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16 * 5, height: 16 * 5)
                            .clipShape(.circle)
                        
                        VStack(alignment: .leading){
                            Text(product.name)
                                .font(.headline)
                            HStack{
                                Text("$\(product.price, specifier: "%.2f") USD")
                                    .font(.callout)
                                
                                Text("- \(product.memory)GB")
                                    .font(.callout)
                                
                                Text("- \(product.color)")
                                    .font(.callout)
                                
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.4)))
                    .padding(.horizontal)
                }
            }
        }
    }
}
enum SortOption {
    case priceAscending
    case priceDescending
    case memory
}

struct SortView_Previews: PreviewProvider {
    static var previews: some View {
        SortView()
    }
}
