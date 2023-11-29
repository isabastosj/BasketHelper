//
//  ItemCardView.swift
//  BasketHelperNano4
//
//  Created by Isabela Bastos Jastrombek on 09/10/23.
//

import SwiftUI
import SwiftData

struct ItemCardView: View {
    @State var item: Item
    var body: some View {
        VStack {
            HStack(spacing: 16) {
                NavigationLink(value: item) {
                    EmptyView()
                }
                
            }
            .overlay {
                HStack(spacing: 16) {
                    Image(systemName: item.isDone ? "checkmark.square.fill" : "square")
                        .font(.title3)
                        .foregroundColor(item.isDone ? Color("AppColor") : Color("AppTextColor"))
                        .frame(width: 20, height: 20)
                        .onTapGesture {
                            item.isDone.toggle()
                        }
                    
                    Text(item.name)
                        .foregroundColor(item.isDone ? Color("AppTextColor").opacity(0.3) : Color("AppTextColor"))
                    Spacer()
                    Text("\(item.quantity) x")
                        .foregroundColor(item.isDone ? Color("AppTextColor").opacity(0.3) : Color("AppTextColor").opacity(0.8))
                    let formattedPrice = String(format: "%.2f", item.price)
                    Text(formattedPrice)
                        .foregroundColor(item.isDone ? Color("AppTextColor").opacity(0.3) : Color("AppTextColor").opacity(0.8))
                        .frame(width: 60)
                    
                    
                }
                .frame(maxWidth: .infinity)
                .onTapGesture {
                    print("minha nossa")
                }
                .padding(.trailing, 24)
            }
        }
    }
}

#Preview {
    ItemCardView(item: Item(name: "exemplo", timestamp: .now, isDone: true))
}
