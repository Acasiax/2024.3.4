//
//  sso.swift
//  2024.3.4
//
//  Created by 이윤지 on 3/6/24.
//


import SwiftUI

struct Co: View {
    @Binding var showingCart: Bool
    @State var cartItems: [MenuModel] // intoCart 대신 사용하는 초기 상태를 제공해야 합니다.

    @EnvironmentObject var homeData: HomeViewModel // EnvironmentObject를 사용하여 HomeViewModel에 접근
    
    @State var totalPrice = 0.00
    
    
    
    
    
    
    var body: some View {
        VStack {
            Text("My Cart")
                .font(.system(size: 44, weight: .semibold, design: .rounded))
                .frame(width: 320, alignment: .leading)
            List {
                
                ForEach(cartItems) { item in // 여기서 cartItems을 직접 사용합니다.
                    HStack {
                        Image(item.image)
                            .resizable()
                            .frame(width: 40, height: 40)
                        VStack(spacing: 5) {
                            Text(item.title)
                            Text("$\(String(format: "%.2f", item.price))")
                                .foregroundColor(.gray)
                        }
                    }
                }.onDelete { indexSet in
                    cartItems.remove(atOffsets: indexSet)
                    calculateTotalPrice()
                }
            }
            .background(.clear)

            .scrollContentBackground(.hidden)
            Spacer()
            totalView // 총 가격을 보여주는 뷰를 별도의 구조체로 추출하였습니다.
            
        }
        
        .onAppear(perform: calculateTotalPrice)
       
        
    }
    
    func calculateTotalPrice() {
        totalPrice = cartItems.reduce(0.00) { $0 + Double($1.price) }
    }

    var totalView: some View { // totalPrice와 관련된 뷰를 별도로 분리하여 관리
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.green)
                .opacity(0.8)
                .frame(width: 350, height: 120)
            VStack {
                Text("Total Price")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                    .frame(width: 350, alignment: .leading)
                    .padding(.leading, 60)
                Text("$\(String(format: "%.2f", totalPrice))")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .frame(width: 350, alignment: .leading)
                    .padding(.leading, 60)
            }
            Button(action: {
                // 결제 로직 추가
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder()
                        .frame(width: 120, height: 50)
                        .foregroundColor(.white)
                    Text("Pay Now >")
                        .foregroundColor(.white)
                        .bold()
                }
            }.offset(x: 80)
        }
    }
}



// `intoCart` 변수는 Co 뷰의 생성자에서 초기화되어야 합니다.
// Co(showingCart: .constant(true), cartItems: intoCart).environmentObject(HomeViewModel())

//


