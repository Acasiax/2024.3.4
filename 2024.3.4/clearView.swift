//
//  clearView.swift
//  2024.3.4
//
//  Created by 이윤지 on 3/7/24.
//

import SwiftUI

struct ClearView: View {
    @State private var showClearView = true
    @State private var showClearView2 = true
    @State private var showClearView3 = true

    var body: some View {
        // 모든 뷰가 숨겨진 경우 아무것도 표시하지 않음
        if showClearView || showClearView2 || showClearView3 {
            ZStack {
                Color.clear
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.5))
                   
                    .onTapGesture {
                        if self.showClearView {
                            self.showClearView = false
                        } else if self.showClearView2 {
                            self.showClearView2 = false
                        } else if self.showClearView3 {
                            self.showClearView3 = false
                        }
                    }
                
                if showClearView {
                    SpeechBubbleTailCenter1()
                        .fill(Color.blue.opacity(0.8))
                        .frame(width: 230, height: 150)
                        .overlay(
                            Text("1. 카테고리를 선택할 수 있어요")
                                .foregroundColor(.white)
                                .padding(.top, -62)
                        )
                        .padding(.top, -280)
                   
                }
                if showClearView2 {
                    SpeechBubbleTailCenter1()
                        .fill(Color.blue.opacity(0.8))
                        .frame(width: 230, height: 150)
                        .overlay(
                            Text("2. 메뉴를 선택할 수 있어요")
                                .foregroundColor(.white)
                                .padding(.top, -62)
                        )
                        .padding(.top, 310)
                        .padding(.leading, -100)
                    
                }
                if showClearView3 {
                    SpeechBubbleTailCenter2()
                        .fill(Color.blue.opacity(0.8))
                        .frame(width: 230, height: 150)
                        .overlay(
                            Text("3. 장바구니를 확인해보세요")
                                .foregroundColor(.white)
                                .padding(.top, -62)
                                .padding(.leading, -15)
                        )
                        .padding(.top, -350)
                        .padding(.trailing, -20)
                     
                }
            }
        }
    }
}


#Preview{

    HomeProductsHero()
              .environmentObject(HomeViewModel()) // HomeViewModel의 인스턴스를 생성하고 환경 객체로 추가
    
}




struct SpeechBubbleTailCenter1: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        path.addRoundedRect(in: CGRect(x: 0, y: 0, width: rect.width, height: rect.height * 0.3), cornerSize: CGSize(width: 20, height: 20))
        
        let tailWidth: CGFloat = rect.width * 0.2
        let tailHeight: CGFloat = rect.height * 0.1
        let tailOriginX = rect.width / 2 - tailWidth / 2
        let tailOriginY = rect.height * 0.3
        
        path.move(to: CGPoint(x: tailOriginX, y: tailOriginY))
        path.addLine(to: CGPoint(x: tailOriginX + tailWidth / 2, y: tailOriginY + tailHeight))
        path.addLine(to: CGPoint(x: tailOriginX + tailWidth, y: tailOriginY))
        path.closeSubpath()
        
        return path
    }
}

struct SpeechBubbleTailCenter2: Shape {
    
    func path(in rect: CGRect) -> Path {
           
           var path = Path()
           
           // 말풍선 본체의 높이를 조정하여 추가
           let bodyHeight = rect.height * 0.3 // 말풍선 본체의 높이를 전체 높이의 70%로 조정
           path.addRoundedRect(in: CGRect(x: 0, y: 0, width: rect.width - rect.height * 0.1, height: bodyHeight), cornerSize: CGSize(width: 20, height: 20))
           
           // 꼬리의 크기와 위치 정의
           let tailWidth: CGFloat = rect.height * 0.1 // 꼬리의 너비를 말풍선 높이의 10%로 설정
           let tailHeight: CGFloat = tailWidth
           let tailOriginX = rect.width - tailWidth // 꼬리의 시작점 X 좌표
           let tailOriginY = bodyHeight / 2 - tailWidth / 2 // 꼬리의 시작점 Y 좌표를 말풍선 본체 높이에 맞게 조정
           
           // 꼬리 경로 추가
           path.move(to: CGPoint(x: tailOriginX, y: tailOriginY))
           path.addLine(to: CGPoint(x: rect.width, y: tailOriginY + tailWidth / 2)) // 꼬리의 끝점 (오른쪽 가운데)
           path.addLine(to: CGPoint(x: tailOriginX, y: tailOriginY + tailWidth))
           path.closeSubpath()
           
           return path
       }
}
