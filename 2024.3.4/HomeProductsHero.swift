//
//  HomeProductsHero.swift
//  2024.3.4
//
//  Created by 이윤지 on 3/4/24.
//

import SwiftUI

struct HomeProductsHero: View {
    
    //@State var ccartView = CartView()
    //@State var showingCart = false
    @State private var showingCart = false
    @State var selectedTab = scroll_Tabs[0]
    @Namespace var animation
    @State var show = false
    @State var selectedBag : MenuModel!
    @StateObject var homeData = HomeViewModel()
    
        //히어로 애니메이션 좋아요 이미지 움직이게
        @Namespace var CartAnimation
    
    var filteredItems: [MenuModel] {
           switch selectedTab {
           case "Hot\n(뜨겁게)":
               return HotCoffee
           case "Ice\n(차갑게)":
               return IceCoffee
           case "Tea\n(차)":
               return Tea
           case "Dessert\n(간식)":
               return Dessert
           default:
               return HotCoffee
           }
       }
    
    var body: some View {
 
        ZStack{
            // 조건부로 CartView 표시
                     if showingCart {
                         // CartView()를 화면에 표시
                         CartView(showingCart: $showingCart)
                             .transition(.asymmetric(insertion: .opacity.combined(with: .move(edge: .bottom)), removal: .opacity.combined(with: .move(edge: .bottom))))
                             .transition(.opacity) // 페이드 인/아웃 효과
                             .transition(.move(edge: .bottom)) // 뷰가 나타날 때 애니메이션 효과 적용
                             .zIndex(1) // CartView를 다른 UI 요소 위에 표시하기 위해 z-index 설정
                     }
            VStack(spacing: 0){
                ZStack{
                    
                    HStack(spacing: 15){
      
                        Button(action: {}, label: {
                            Image(systemName: "house.fill")
                                .font(.title)
                                .foregroundColor(.orange)
                        })
                        Spacer(minLength: 0)
                        
                      
                        
                        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top), content: {
                            
                            Button(action: {
                                withAnimation(.easeInOut(duration: 0.5)) { // This ensures the toggle is animated
                                        self.showingCart.toggle()
                                    }
                                // self.showingCart.toggle()
                                
                                  //  CartView()
                                
                            }, label: {
                                Image(systemName: "bag.fill")
                                    .font(.title3)
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background(Color.purple)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .overlay(
                                        Text("\(homeData.cartItems)")
                                            .font(.caption)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                            .padding(10)
                                            .background(Color.orange)
                                            .clipShape(Circle())
                                            .offset(x: 15, y: -10)
                                           // .opacity(homeData.cartItems != 0 ? 1 : 0)
                                    )
                            })
                       
                        })
      
                    }.overlay(
                        Text("키오스크 연습 꾸욱")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.yellow)
                    )
                }
                .padding()
                .padding(.top,UIApplication.shared.windows.first?
                    .safeAreaInsets.top)
                
                .background(Color.green).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                
                ScrollView(.vertical, showsIndicators: false, content:
                            {
                    
                    VStack{

                        HStack{
                            
                            Text("카페")
                                .font(.title)
                                .fontWeight(.heavy)
                                .foregroundColor(.black)
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                        .padding(.top)
                        .padding(.bottom,10)
                        
                        ScrollView(.horizontal, showsIndicators: false, content: {
                            
                            HStack(spacing: 15){
                                ForEach(scroll_Tabs, id: \.self){tab in
                                    //탭 버튼
                                    TabButton(title: tab, selectedTab: $selectedTab, animation: animation)
                                    
                                }
                            }
                            .padding(.horizontal)
                            .padding(.top,10)
                        })
                        
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing: 15), count: 2),spacing: 15){
                            //ForEach(bags){bag in
                            ForEach(filteredItems){bag in
                                BagView(bagData: bag, animation: animation)
                                    .onTapGesture {
                                        withAnimation(.easeIn){
                                            
                                            selectedBag = bag
                                        //    show.toggle()
                                            homeData.showCart.toggle()
                                            
                                        }
                                    }
                                
                            }
                            
                        }
                        .padding()
                        .padding(.top,10)
                        .padding(.bottom,100)
                        
                    }
                })
            }
            //배경이 흰색일때 위에 헤더 제외한 밑에 모든 배경을 살짝 회색으로 처리해주는 것임
            .background(Color.yellow.opacity(0.05).ignoresSafeArea(.all, edges: .all))
            //블러링
           // .blur(radius: homeData.showCart ? 50 : 0)
            AddToCartView(selectedBag: $selectedBag, animation: CartAnimation)
                .offset(y: homeData.showCart ? homeData.startAnimation ? 700 : 0 : 700)
                .environmentObject(homeData)
            
          //  CartView()
//                .sheet(isPresented: $showingCart) {
//                           CartView() // CartView를 모달 형태로 표시
//                       }
            
            
            //애니메이션
            if homeData.startAnimation{
                VStack{
                    Spacer()
                    ZStack{
                        Color.orange
                            .frame(width: homeData.ItemAnimation ? 100 : getRect().width * 0.3 ,height: homeData.ItemAnimation ? 100 : getRect().width * 1.3, alignment: .center)
                            .clipShape(Circle())
                        
                        Image(selectedBag.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        //장바구니에 담았을때 동그라미로 들어가게 하는 히어로 애니메이션
                            .matchedGeometryEffect(id: "SHOE", in: CartAnimation)
                            .frame(width: 80, height: 80)
                    }
                    .offset(y: homeData.saveCart ? 70 : -120)
                    //스케일 효과
                    .scaleEffect(homeData.saveCart ? 0.6 : 1)
                    .onAppear(perform: homeData.performAnimations)
                    if !homeData.saveCart{
                        Spacer()
                    }
                    Image(systemName: "bag\(homeData.additemtocart ? ".fill" : "")")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(homeData.additemtocart ? Color.purple : Color.orange)
                        .clipShape(Circle())
                        .offset(y: homeData.showItem ? -50 : 300)
                }
                //전체적인 뷰의 스크린 넓이 세팅?
                .frame(width: getRect().width)
                .offset(y: homeData.endAnimation ? 500 : 0)
                
            }

        }
  
        .background(Color.green.opacity(0.19))
        .ignoresSafeArea(.all, edges: .top)
        .ignoresSafeArea(.all, edges: .bottom)
        // end애니메이션 다시 전부 복구
        .onChange(of: homeData.endAnimation, perform: { value in
            if homeData.endAnimation{
                homeData.resetAll()
                
            }
        })
        
    }
}




#Preview{
    HomeProductsHero()
}


extension View {
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
}
