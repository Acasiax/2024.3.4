//
//  HomeViewModel.swift
//  addTocart
//
//  Created by 이윤지 on 3/1/24.
//

import SwiftUI


class HomeViewModel: ObservableObject, Identifiable {
    @Published var cartItemsCount = 0 // 장바구니 아이템 수를 추적하는 프로퍼티
    
   // @Published var resetTrigger = false
   // @Published var count = 0 // 카트에 담긴 상품의 수를 나타내는 변수 추가
   // @Binding var count = 1
  @Published var showCart = false
  @Published var selectedSize = ""
    
    @Published var startAnimation = false
    @Published var ItemAnimation = false
    
    @Published var showItem = false
    @Published var saveCart = false
    @Published var additemtocart = false
    @Published var endAnimation = false
    
    @Published var cartItems = 0
    
    // 아이템이 추가되거나 장바구니에서 제거될 때마다 이 메서드를 호출합니다.
//       func updateCartItemsCount() {
//          
//           self.cartItemsCount = intoCart.count
//       }
    
    
    // 장바구니 아이템 수를 업데이트하는 함수
        func updateCartItemsCount(with count: Int) {
           // cartItemsCount += count
            self.cartItemsCount = intoCart.count
        }
    
    
    
    
    
    //애니메이션 실향
    func performAnimations(){
        
        withAnimation(.easeOut(duration: 0.8)){
            ItemAnimation.toggle()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
            withAnimation(.easeInOut){
                self.showItem.toggle()
            }
            
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.75){
            withAnimation(.easeInOut(duration: 0.5)){
                self.saveCart.toggle()
            }
        }
        
        //0.75 + 0.5 = 1.25
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.1){
            self.additemtocart.toggle()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.25){
            withAnimation(.easeInOut(duration: 0.5)){
                self.endAnimation.toggle()
            }
        }
    }
    func resetAll() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){[self] in
            
            withAnimation{
                showCart.toggle()
            }
            
            startAnimation = false
            endAnimation = false
            selectedSize = ""
            additemtocart = false
            ItemAnimation = false
            saveCart = false
            cartItems += 1
          //  count = 1
           // self.count = 0 // 카트에 담긴 상품의 수를 0으로 초기화
            
        }
    }
}


