//
//  SplashScreenView.swift
//  BasketHelperNano4
//
//  Created by Isabela Bastos Jastrombek on 10/10/23.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    VStack(spacing: 8) {
                        Image(systemName: "basket.fill")
                            .font(.system(size: 140))
                            .foregroundColor(Color("AppColor"))
                        HStack(spacing: 0) {
                            Text("Basket ")
                                .foregroundColor(Color("TextColor"))
                                .font(.system(size: 42))
                                .fontWeight(.heavy)
                            Text("Helper")
                                .foregroundColor(Color("AppColor"))
                                .font(.system(size: 42))
                                .fontWeight(.heavy)
                        }
                    }
                    Spacer()
                }
                Spacer()
            }
            .background(Color("AppBackgroundColor"))
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
