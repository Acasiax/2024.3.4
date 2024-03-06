//
//  CartView.swift
//  2024.3.4
//
//  Created by 이윤지 on 3/6/24.
//

import SwiftUI


struct CartView: View {
    @Binding var showingCart: Bool
    @State private var cartItems1: [MenuModel] = intoCart
    @State private var totalAmount = 0

    
    
    var body: some View {
        NavigationView {
            VStack {
                List(cartItems1, id: \.id) { product in
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
                            // 가격과 수량을 곱한 총액을 표시
                            Text("\(product.price * product.count)원")
                            //Text("\(product.price)원")
                                .font(.subheadline)
                            
                        }
                    }
                }
                
                HStack {
                    Text("총 \(cartItems1.count)개를 담았고 총합 가격은: ")
                   // Spacer()
                    Text("$\(totalAmount)")
                }
                .padding()
                
                Button("주문하기!\n진짜 결제는 아니에요 걱정하지 마세요^^") {
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
                           cartItems1.removeAll()
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
        totalAmount = cartItems1.reduce(0) { total, item in
            total + (Int(item.price) ?? 0) * item.count
        }
    }
}



#Preview {
    CartView(showingCart:.constant(true))
}
