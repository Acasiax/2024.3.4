//
//  CartView.swift
//  2024.3.4
//
//  Created by 이윤지 on 3/6/24.
//

import SwiftUI


struct CartView: View {
    @Binding var showingCart: Bool
    @State private var cartItems: [MenuModel] = intoCart
    @State private var totalAmount = 0

    var body: some View {
        NavigationView {
            VStack {
                List(cartItems, id: \.id) { product in
                    HStack {
                        Image(product.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 70)
                        VStack(alignment: .leading) {
                            Text(product.title)
                                .font(.headline)
                            Text(product.Explain)
                                .font(.subheadline)
                            Text("\(product.count)개")
                                .font(.subheadline)
                            Text(product.price)
                                .font(.subheadline)
                            
                        }
                    }
                }
                
                HStack {
                    Text("Total for \(cartItems.count) items: ")
                   // Spacer()
                    Text("$\(totalAmount)")
                }
                .padding()
                
                Button("Checkout") {
                    // Implement checkout action
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
            }
            .navigationTitle("Cart")
            .navigationBarItems(leading: Button(action: {
                           // Toggles the showingCart state
                showingCart.toggle()
                  
                       }) {
                           // Replace "xmark.circle" with your specific X mark button design
                           Image(systemName: "xmark.circle")
                               .foregroundColor(.black)
                           
                       },
                       trailing: Button(action: {
                           cartItems.removeAll()
                           calculateTotal()
                       }) {
                           Image(systemName: "trash.fill")
                       })
                       .onAppear {
                           calculateTotal()
                       }
                   }
               }
               
    func calculateTotal() {
        totalAmount = cartItems.reduce(0) { total, item in
            total + (Int(item.price) ?? 0) * item.count
        }
    }
}



#Preview {
    CartView(showingCart:.constant(true))
}
