//
//  CustomCorner.swift
//  HeroBag
//
//  Created by 이윤지 on 2023/06/23.
//

import SwiftUI

struct CustomCorner: Shape {
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath( roundedRect: rect,
                                 byRoundingCorners: [.topLeft, .topRight, .bottomLeft, .bottomRight], cornerRadii:
        CGSize(width: 35, height: 35))

        return Path(path.cgPath)
    }
    
    
    }



