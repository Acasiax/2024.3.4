//
//  DetailView.swift
//  HeroBag
//
//  Created by 이윤지 on 2023/06/22.
//

import SwiftUI


struct DetailView: View {
    @State var currentIndex: Int = 0
    @Environment(\.colorScheme) var scheme
    
    @Binding var MenuData : MenuModel!
    @Binding var show : Bool
    var animation: Namespace.ID
    @State var selectedColor = Color.red
    @State var count = 0
    @State var isSmallDevice = UIScreen.main.bounds.height < 750
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false){
            VStack{
                HStack{
                    VStack(alignment: .leading, spacing: 5){
                        
                        Button(action: {
                            
                            withAnimation(.easeOut){show.toggle()}
                            
                        }) {
                            
                            Image(systemName: "chevron.left")
                                .font(.title)
                                .foregroundColor(.black)
                                .padding(.top)
                        }
                        
                        Text("선택한 메뉴")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text(MenuData.title)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                    }
                    Spacer(minLength: 0)
                    Spacer()
                    Button(action: {}) {
                        
                        Image(systemName: "cart")
                            .font(.title)
                            .foregroundColor(.red)
                    }
                }
                .padding()
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                
                HStack(spacing: 10){
                    
                    VStack(alignment: .leading, spacing: 6){
                        Text("가격")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text(MenuData.price)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                    }
                    
                    Image(MenuData.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    //히어로 애니메이션
                        .matchedGeometryEffect(id: MenuData.image, in: animation)
                }
                .padding()
                .padding(.top,10)
                .zIndex(1)
                
                VStack{
                    ScrollView(isSmallDevice ? .vertical : .vertical, showsIndicators: false){

                        Text("메뉴 이름과 갯수를 확인하고\n장바구니에 담아주세요")
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        HStack(spacing: 20){
                            
                            Button(action: {
                                
                                if count > 0{count -= 1}
                                
                            }){
                                Image(systemName: "minus")
                                    .font(.title2)
                                    .foregroundColor(.gray)
                                    .frame(width: 35, height: 35)
                                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                            }
                            
                            Text("\(count)")
                                .font(.title2)
                            
                            Button(action: {count += 1}) {
                                
                                Image(systemName: "plus")
                                    .font(.title2)
                                    .foregroundColor(.gray)
                                    .frame(width: 35, height: 35)
                                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                            }
                            
                            Spacer()
                         
                        }
                        .padding(.horizontal)
                        Spacer(minLength: 0)
                        Button(action: {}) {
                            
                            Text("장바구니에 담기")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 30)
                                .background(Color.pink.opacity(0.7))
                            //  .clipShape(Circle())
                        }
                        .padding(.top)
                        .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 15 : 0)
                        .padding(.bottom,30)
                    }
                }
                .background(
                    Color.white
                        .clipShape(CustomCorner())
                        .padding(.top,isSmallDevice ? -60 : -100)
                    
                )
                .zIndex(0)
            }
            //스크롤 괄호 닫힘
        }
        .background(Color.black.opacity(0.3).ignoresSafeArea(.all, edges: .top))
        .background(BGView(MenuData: MenuData, currentIndex: $currentIndex, scheme: scheme))
        .onAppear {
            //첫번쨰 컬러는 이미지나 백의 색깔잉래
            selectedColor = Color(MenuData.image)
        }
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
 HomeProductsHero()
    }
}



struct BGView: View {
    var MenuData: MenuModel
    @Binding var currentIndex: Int
    var scheme: ColorScheme

    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            
            let color: Color = (scheme == .dark ? .black : .white)
            //custom gradient
            LinearGradient(colors: [
                .black,
                .clear,
                color.opacity(0.15),
                color.opacity(0.5),
                color.opacity(0.8),
                color,
                color
            ], startPoint: .top, endPoint: .bottom)
            
            //블러드 오버레이
            Rectangle()
                .fill(.ultraThinMaterial)
            
        }.ignoresSafeArea()
    }
}
