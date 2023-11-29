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
                        Image("Logo")
                            .resizable()
                            .frame(width: 105,height: 100)
                            .padding()
                        Text("Basket**Helper**")
                            .foregroundColor(.white)
                            .font(.system(size: 42))
                    }
                    Spacer()
                }
                Spacer()
            }
            .background(
                Image("OnboardingBg")
                    .resizable()
                    .ignoresSafeArea()
                    .aspectRatio(contentMode: .fill)
            )
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
