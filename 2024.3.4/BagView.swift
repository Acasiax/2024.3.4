//
//  BagView.swift
//  HeroBag
//
//  Created by 이윤지 on 2023/06/22.
//

import SwiftUI

struct BagView: View {
    
    var bagData : MenuModel
    var animation : Namespace.ID
    
    var body: some View {
       
        VStack(alignment: .leading, spacing: 6) {
            
            ZStack{
                //상품 배경색
                Color(.yellow).opacity(0.5)
                //  Color(bagData.image)
                    .cornerRadius(15)
                
                VStack{
                    
                    Image(bagData.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.top,10)
                        .padding(.leading,5)
                        .padding(.trailing,5)
                        //.padding(20)
                        .matchedGeometryEffect(id: bagData.image, in: animation)
                       
                    
                    Text(bagData.title)
                        .fontWeight(.heavy)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Text(bagData.Entitle)
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                    
                    Text(bagData.Explain)
                        .font(.footnote)
                    // .fontWeight(.semibold)
                        .foregroundColor(.gray)
                    
                    Text("\(bagData.price)원")
                        .fontWeight(.medium)
                    //.fontWeight(.heavy)
                        .foregroundColor(.black)
                        .padding(.bottom,5)
                }
                
            }
        }
    }
}
