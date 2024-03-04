//
//  TabButton.swift
//  HeroBag
//
//  Created by 이윤지 on 2023/06/22.
//

import SwiftUI

struct TabButton: View {
    var title : String
    @Binding var selectedTab : String
    var animation : Namespace.ID
    
    
    var body: some View {
        
        Button(action: {
            
            withAnimation(.spring()){selectedTab = title}
            
        }, label: {
            
            VStack(alignment: .leading, spacing: 6, content: {
                
                Text(title)
                    .fontWeight(.heavy)
                    
                    .foregroundColor(selectedTab == title ? .orange : .gray)
                
             
                //애니메이션 더하기
                if selectedTab == title {
                    
                    Capsule()
                        .fill(Color.orange)
                        .frame(width: 40, height: 4)
                        .matchedGeometryEffect(id: "Tab", in: animation)
                        
                }
                
            })
            .frame(width: 100)
        })

        
        
    }
}

