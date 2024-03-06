//
//  CartView.swift
//  2024.3.4
//
//  Created by 이윤지 on 3/6/24.
//

import SwiftUI

struct CartView: View {
    @Binding var showingCart: Bool
    @State private var totalAmount = 0

    @EnvironmentObject var homeData: HomeViewModel

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(intoCart, id: \.id) { product in
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
                                Text("\(product.price * product.count)원")
                                    .font(.subheadline)
                            }
                        }
                    }
                    .onDelete { indexSet in
                        intoCart.remove(atOffsets: indexSet)
                        calculateTotal()
                    }
                }

                HStack {
                    Text("총 \(intoCart.count)개를 담았고 총합 가격은: ")
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
                showingCart.toggle()
            }) {
                Image(systemName: "xmark.circle")
                    .foregroundColor(.black)
            }, trailing: Button(action: {
                intoCart.removeAll()
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
        totalAmount = intoCart.reduce(0) { total, item in
            total + (item.price * item.count)
        }
        homeData.updateCartItemsCount(with: intoCart.count)
    }
}

// MenuModel 구조체와 intoCart 전역 변수 선언은 그대로 유지됩니다.

