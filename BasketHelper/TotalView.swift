//
//  TotalView.swift
//  BasketHelperNano4
//
//  Created by Isabela Bastos Jastrombek on 09/10/23.
//

import SwiftUI

struct TotalView: View {
    
//    @Environment(\.modelContext) var modelContext
    var totalPrice: Double
//    @State var formattedPrice: String
//    @State var items: [Item]

    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color("AppColor"))
                .frame(height: 64)
                .padding(.horizontal, 16)
                .overlay {
                    HStack {
                        Text("Total:")
                            .font(.title3)
                            .bold()
                            .foregroundColor(.white)
                        
                        Spacer()
                        let formattedPrice = String(format: "%.2f", totalPrice)
                        Text("\(formattedPrice)")
                            .font(.title3)
                            .bold()
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 32)
                }
        }
    }
}

#Preview {
    TotalView(totalPrice: 20)
}
