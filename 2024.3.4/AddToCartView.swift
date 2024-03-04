//
//  Home.swift
//  addTocart
//
//  Created by 이윤지 on 3/1/24.
//
import SwiftUI

struct AddToCartView: View {
    
    @State var count = 0
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
                    
                    Text(selectedBag?.price ?? "기본 제목")
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
                    
                    if count > 0{count -= 1
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
                
                Text("\(count)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.pink)
                
                Button(action: {count += 1
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
            
            
            Button(action: {
                withAnimation(.easeInOut(duration: 0.7)){
                    homeData.startAnimation.toggle()
                    
                      
                }
            }, label: {
                Text("장바구니로")
                    .fontWeight(.bold)
                    .foregroundColor(count > 0 ?  .white : .black)
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

