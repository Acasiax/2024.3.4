//
//  Home.swift
//  addTocart
//
//  Created by 이윤지 on 3/1/24.
//
import SwiftUI

struct AddToCartView: View {
    
    //@EnvironmentObject var homeData: HomeViewModel
    
    @State var count = 1
    @State private var isPlusButtonPressed: Bool = false
    @State private var isminusButtonPressed: Bool = false
    @Binding var selectedBag : MenuModel!
    @EnvironmentObject var homeData: HomeViewModel
    var animation: Namespace.ID
    @Namespace var CartAnimation
   
    
    
    var body: some View {
        
        VStack{
            HStack(spacing: 15){
                if !homeData.startAnimation{
                    Image(selectedBag?.image ?? "따뜻한카푸치노")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                   //     .matchedGeometryEffect(id: "SHOE", in: animation)
                        .matchedGeometryEffect(id: "SHOE", in: CartAnimation)
                    //.padding(.horizontal)
                }
                
                VStack(alignment: .trailing, spacing: 10, content: {
                 
                   
                    Text(selectedBag?.title ?? "기본 제목")
                    //Text(selectedBag.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.trailing)
                    
                   // Text("\(selectedBag?.price)가격")
                    //⛑️
                    Text("\((selectedBag?.price ?? 0) * (selectedBag?.count ?? 0)) 원")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                })
                
            }
            .padding()
            
            Divider()
            
            Text("사이즈 선택")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
                .padding(.vertical)
            
            let columns = Array(repeating: GridItem(.flexible(), spacing: 8), count: 4)
            
            LazyVGrid(columns: columns, alignment: .leading, spacing: 15, content: {
                ForEach(sizes,id: \.self){size in
                    Button(action: {
                        withAnimation{
                            homeData.selectedSize = size
                        }
                    }, label: {
                        Text(size)
                            .fontWeight(.semibold)
                            .foregroundColor(homeData.selectedSize == size ? .white : .black)
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(homeData.selectedSize == size ? Color.orange : Color.black.opacity(0.06))
                            .cornerRadius(10)
                        
                    })
                }
            })
            .padding(.top)
            
            
            
            HStack(spacing: 20){
                
                Button(action: {
                    
                    if selectedBag.count > 0{selectedBag.count -= 1
                        isminusButtonPressed = true
                        isPlusButtonPressed = false
                    }
                    
                }){
                    Image(systemName: "minus")
                        .font(.title2)
                        
                        .frame(width: 35, height: 35)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                        .foregroundColor(isminusButtonPressed ? Color.white : Color.gray)
                        .background(isminusButtonPressed ? Color.orange : Color.clear) // 오렌지 색상으로 변경
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                }
                
                Text("\(selectedBag?.count ?? 77)")
              //  Text("\(selectedBag.count)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.pink)
                
                Button(action: {selectedBag.count += 1
                    isPlusButtonPressed = true
                    isminusButtonPressed = false
                    
                }) {
                    
                    Image(systemName: "plus")
                        .font(.title2)
                    //.foregroundColor(.gray)
                        .frame(width: 35, height: 35)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                    // isPlusButtonPressed의 값에 따라 조건부 배경색 설정
                        .foregroundColor(isPlusButtonPressed ? Color.white : Color.gray)
                        .background(isPlusButtonPressed ? Color.orange : Color.clear) // 오렌지 색상으로 변경
                    
                        
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                    
                }
                
                Spacer()
             
            }
            .padding(.horizontal)
            
            
            // "장바구니로" 버튼 액션 내에서 selectedBag의 정보와 count 값을 사용하여 intoCart 배열에 추가
            Button(action: {
                withAnimation(.easeInOut(duration: 0.7)){
                    // 장바구니 아이템 수 업데이트
                    homeData.cartItemsCount = intoCart.count
                  //  homeData.updateCartItemsCount // 총액을 재계산할 때마다 장바구니 아이템 수를 업데이트
                    homeData.startAnimation.toggle()
                    // selectedBag의 정보를 새로운 MenuModel 인스턴스에 복사하고, count 값을 설정
                    if let bag = selectedBag {
                        let newItem = MenuModel(image: bag.image, title: bag.title, Entitle: bag.Entitle, Explain: bag.Explain, price: bag.price, color: bag.color, count: selectedBag.count)
                        // intoCart 배열에 새 항목 추가
                        intoCart.append(newItem)
                        homeData.updateCartItemsCount(with: 1) // 장바구니 아이템 수 업데이트
                        
                    }
                    print("📍수량\(selectedBag.count),메뉴\(selectedBag?.title), 가격\(selectedBag?.price)")
                    print(intoCart)
                }
            }, label: {
                Text("장바구니에 담기")
                    .fontWeight(.bold)
                    .foregroundColor(count > 1 ?  .white : .black)
                    .foregroundColor(isPlusButtonPressed ?  .black : .white)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(homeData.selectedSize == "" ? Color.black.opacity(0.06) : Color.orange)
                    .background(isPlusButtonPressed ? Color.orange : Color.clear) // 오렌지 색상으로 변경
                    .cornerRadius(18)
            })
            .disabled(count == 0)
            .padding(.top)
        }
        .padding()
        .background(Color.pink.opacity(0.2))
        .background(Color.white)
        
        .cornerRadius(20)
        .padding(40)
    }
}

let sizes = ["작은 컵", "중간 컵", "큰 컵"]












// "장바구니로" 버튼 액션 내에서 selectedBag의 정보와 count 값을 사용하여 intoCart 배열에 추가
//Button(action: {
//    withAnimation(.easeInOut(duration: 0.7)){
//        homeData.startAnimation.toggle()
//        if let bag = selectedBag {
//            if let index = intoCart.firstIndex(where: { $0.id == bag.id }) {
//                // 이미 장바구니에 상품이 있으면 수량만 업데이트
//                intoCart[index].count += count
//            } else {
//                // 장바구니에 상품이 없으면 새로 추가
//                let newItem = MenuModel(image: bag.image, title: bag.title, Entitle: bag.Entitle, Explain: bag.Explain, price: bag.price, color: bag.color, count: selectedBag.count)
//                // intoCart 배열에 새 항목 추가
//                intoCart.append(newItem)
//            }
//        }
//        print("📍수량\(selectedBag.count),메뉴\(selectedBag?.title), 가격\(selectedBag?.price)")
//        print(intoCart)
//    }
//},
//
