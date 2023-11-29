//
//  OnboardingView.swift
//  BasketHelper
//
//  Created by Isabela Bastos Jastrombek on 17/10/23.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var showOnboarding: Bool
    var body: some View {
        
        VStack {
            
            TabView() {
                OnboardingView1()
                OnboardingView2()
                OnboardingView3()
                OnboardingView4(showOnboarding: $showOnboarding)
            }
            .tabViewStyle(PageTabViewStyle())
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.bottom, 24)
        .background(
            Image("OnboardingBg")
                .resizable()
                .ignoresSafeArea()
                .aspectRatio(contentMode: .fill)
        )
    }
}

struct OnboardingView1: View {
    var body: some View {
        VStack(spacing: 64) {
            
            Image(systemName: "plus")
                .font(.system(size: 160))
                .frame(height: 140)
            
            Spacer()
            
            VStack(spacing: 16) {
                Text("New Item")
                    .font(.largeTitle)
                    .bold()
                
                Text("To start, add a new item to your grocery list by tapping on the plus icon.")
                    .multilineTextAlignment(.center)
            }
            
        }
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 36)
        .padding(.bottom, 156)
        .padding(.top, 184)
//        .background(Color("AppColor"))
    }
}

struct OnboardingView2: View {
    var body: some View {
        VStack(spacing: 64) {
            
            Image(systemName: "chevron.right")
                .font(.system(size: 160))
                .frame(height: 140)
            
            Spacer()
            
            VStack(spacing: 16) {
                Text("Edit Item")
                    .font(.largeTitle)
                    .bold()
                
                Text("Chose a name, how many and the price, you can edit it later.")
                    .multilineTextAlignment(.center)
            }
            
            
        }
        .foregroundStyle(.white)
        .padding(.horizontal, 36)
        .padding(.bottom, 156)
        .padding(.top, 184)
    }
}

struct OnboardingView3: View {
    var body: some View {
        VStack(spacing: 64) {
            
            Image(systemName: "trash.fill")
                .font(.system(size: 160))
                .frame(height: 140)
            
            Spacer()
            
            VStack(spacing: 16) {
                Text("Delete Item")
                    .font(.largeTitle)
                    .bold()
                
                Text("Drag an item to the left for the delete option to appear.")
                    .multilineTextAlignment(.center)
            }
        }
        .foregroundStyle(.white)
        .padding(.horizontal, 36)
        .padding(.bottom, 156)
        .padding(.top, 184)
    }
}

struct OnboardingView4: View {
    @Binding var showOnboarding: Bool
    var body: some View {
        ZStack {
            VStack(spacing: 64) {
                
                Image(systemName: "checkmark.square.fill")
                    .font(.system(size: 160))
                    .frame(height: 140)
                
                Spacer()
                
                VStack(spacing: 16) {
                    Text("Check Item")
                        .font(.largeTitle)
                        .bold()
                    
                    Text("When you check an item, it's price is added to the total.")
                        .multilineTextAlignment(.center)
                }
            }
            .foregroundStyle(.white)
            .padding(.horizontal, 36)
            .padding(.bottom, 156)
            .padding(.top, 184)
            
            VStack {
                Spacer()
                Button {
                    showOnboarding.toggle()
                    
                } label: {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(.white)
                        .frame(height: 64)
                        .padding(.horizontal, 16)
                        .overlay {
                            Text("Continue")
                                .foregroundColor(Color("AppColor"))
                                .bold()
                        }
                }
            }
            .padding(.bottom, 56)
        }
    }
}

#Preview {
    OnboardingView(showOnboarding: .constant(true))
}
