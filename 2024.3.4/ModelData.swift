//
//  ModelData.swift
//  HeroBag
//
//  Created by 이윤지 on 2023/06/22.
//

import SwiftUI

struct MenuModel: Identifiable {
    var id = UUID().uuidString
    var image : String
    var title : String
    var Entitle: String
    var Explain: String
    var price : String
    var color : Color
    var count: Int // 수량 정보 추가
}

var HotCoffee = [

    MenuModel(image: "따뜻한아메리카노", title: "핫 아메리카노", Entitle: "Americano", Explain: "물이 들어갔어요", price: "1,500 원", color: .pink, count: 1),
    MenuModel(image: "따뜻한라떼", title: "핫 라떼", Entitle: "Latte", Explain: "우유가 들어갔어요", price: "2,500 원", color: .pink, count: 1),
    MenuModel(image: "따뜻한카푸치노", title: "핫 카푸치노", Entitle: "Cappuchino", Explain: "우유 적고 거품 많아요", price: "2,700 원", color: .pink, count: 1),
    MenuModel(image: "따뜻한바닐라라떼", title: "핫 바닐라 라떼", Entitle: "Vanlla Latte", Explain: "은은하게 달달해요", price: "3,000 원", color: .pink, count: 1),
    MenuModel(image: "따뜻한카라멜라떼", title: "핫 카라멜 라떼", Entitle: "Carmel Latte", Explain: "찐덕하게 달달한 라떼", price: "3,000 원", color: .pink, count: 1),
    MenuModel(image: "따뜻한카페모카", title: "핫 카페 모카", Entitle: "Cafe Mocha", Explain: "초코시럽이 들어간 라떼", price: "3,000 원", color: .pink, count: 1),


    
    
]

var IceCoffee = [

    MenuModel(image: "따뜻한아메리카노", title: "아이스 아메리카노", Entitle: "Americano", Explain: "물이 들어갔어요", price: "1,500 원", color: .pink, count: 1),
    MenuModel(image: "따뜻한라떼", title: "아이스 라떼", Entitle: "Latte", Explain: "우유가 들어갔어요", price: "2,500 원", color: .pink, count: 1),
    MenuModel(image: "따뜻한카푸치노", title: "아이스 카푸치노", Entitle: "Cappuchino", Explain: "우유 적고 거품 많아요", price: "2,700 원", color: .pink, count: 1),
    MenuModel(image: "따뜻한바닐라라떼", title: "아이스 바닐라 라떼", Entitle: "Vanlla Latte", Explain: "은은하게 달달해요", price: "3,000 원", color: .pink, count: 1),
    MenuModel(image: "따뜻한카라멜라떼", title: "아이스 카라멜 라떼", Entitle: "Carmel Latte", Explain: "찐덕하게 달달한 라떼", price: "3,000 원", color: .pink, count: 1),
    MenuModel(image: "따뜻한카페모카", title: "아이스 카페 모카", Entitle: "Cafe Mocha", Explain: "초코시럽이 들어간 라떼", price: "3,000 원", color: .pink, count: 1),
    
    
]


var Tea = [

    MenuModel(image: "따뜻한아메리카노", title: "유자차", Entitle: "Americano", Explain: "물이 들어갔어요", price: "1,500 원", color: .pink, count: 1),
    MenuModel(image: "따뜻한라떼", title: "자몽차", Entitle: "Latte", Explain: "우유가 들어갔어요", price: "2,500 원", color: .pink, count: 1),
    MenuModel(image: "따뜻한카푸치노", title: "생강차", Entitle: "Cappuchino", Explain: "우유 적고 거품 많아요", price: "2,700 원", color: .pink, count: 1),
    MenuModel(image: "따뜻한바닐라라떼", title: "허브차", Entitle: "Vanlla Latte", Explain: "은은하게 달달해요", price: "3,000 원", color: .pink, count: 1),
    MenuModel(image: "따뜻한카라멜라떼", title: "밀크티", Entitle: "Carmel Latte", Explain: "찐덕하게 달달한 라떼", price: "3,000 원", color: .pink, count: 1),
    MenuModel(image: "따뜻한카페모카", title: "레몬차", Entitle: "Cafe Mocha", Explain: "초코시럽이 들어간 라떼", price: "3,000 원", color: .pink, count: 1),
    
]

var Dessert = [

    MenuModel(image: "따뜻한아메리카노", title: "초코 쿠키", Entitle: "Americano", Explain: "물이 들어갔어요", price: "1,500 원", color: .pink, count: 1),
    MenuModel(image: "따뜻한라떼", title: "일반 쿠키", Entitle: "Latte", Explain: "우유가 들어갔어요", price: "2,500 원", color: .pink, count: 1),
    MenuModel(image: "따뜻한카푸치노", title: "딸기 케이크", Entitle: "Cappuchino", Explain: "우유 적고 거품 많아요", price: "2,700 원", color: .pink, count: 1),
    MenuModel(image: "따뜻한바닐라라떼", title: "밤 케이크", Entitle: "Vanlla Latte", Explain: "은은하게 달달해요", price: "3,000 원", color: .pink, count: 1),
    MenuModel(image: "따뜻한카라멜라떼", title: "초코 케이크", Entitle: "Carmel Latte", Explain: "찐덕하게 달달한 라떼", price: "3,000 원", color: .pink, count: 1),
    MenuModel(image: "따뜻한카페모카", title: "소금빵", Entitle: "Cafe Mocha", Explain: "초코시럽이 들어간 라떼", price: "3,000 원", color: .pink, count: 1),
    
]

var scroll_Tabs = ["Hot\n(뜨겁게)","Ice\n(차갑게)","Tea\n(차)", "Dessert\n(간식)", "Juice\n(주스)"]

var intoCart: [MenuModel] = [
   
]


