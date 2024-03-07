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
//                                Text(product.Explain)
//                                    .font(.subheadline)
                                Text("\(product.count)개")
                                    .font(.subheadline)
                                Text("\(product.price * product.count)원")
                                    .font(.subheadline)
                                
                            }
                            Spacer()
                            Button(){
                                if let index = intoCart.firstIndex(where: { $0.id == product.id }) {
                                        // Remove the product at the found index
                                        intoCart.remove(at: index)
                                        // Recalculate the total amount after item removal
                                        calculateTotal()
                                    }
                                
                            } label: {
                                Rectangle()
                                    .frame(width: 50, height: 30, alignment: .center)
                                    .cornerRadius(5)
                                    .overlay(
                                       // Image(systemName: "trash")
                                        Text("삭제")
                                            .foregroundColor(.white)
                                    )
                                    .foregroundColor(.red)
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
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.green)
                        .opacity(0.8)
                        .frame(width: 350, height: 120)
                    VStack {
                        Text("총합 가격")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .frame(width: 350, alignment: .leading)
                            .padding(.leading, 60)
                        Text("$\(totalAmount)")
                            .foregroundColor(.white)
                            .font(.system(size: 26, weight: .bold))
                            .frame(width: 350, alignment: .leading)
                            .padding(.leading, 60)
                    }
                    Button() {
                        
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder()
                                .frame(width: 120, height: 50)
                                .foregroundColor(.white)
                            Text("주문하기 >")
                                .foregroundColor(.white)
                                .bold()
                        }
                    }.offset(x: 80)
                }

            }
            .navigationTitle("장바구니")
            .navigationBarItems(leading: Button(action: {
                withAnimation{
                showingCart.toggle()
                    }
            }) {
                Image(systemName: "chevron.backward.circle")
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

