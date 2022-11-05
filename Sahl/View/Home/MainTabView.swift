//
//  MainTabView.swift
//  Sahl
//
//  Created by Khawlah on 03/11/2022.
//


import SwiftUI



struct MainTabView: View {
    @StateObject var locationViewModel = LocationSearchViewModel()
    @State var selectedTab: TabItem = .home
    @State private var mapState = MapViewState.noInput
    
    @State var isDriverAccept = false
    
    var body: some View {
        ZStack {
            
            switch(selectedTab) {
            case .home: HomeView(mapState: $mapState)
            case .list: TripsView()
            case .profile: UserAccountView()
            }
            
            tabBar
                .ignoresSafeArea(.keyboard)
            
            if mapState == .locationSelected || mapState == .polylineAdded {
                if !isDriverAccept {
                    RideRequestView(mapState: $mapState, isDriverAccept: $isDriverAccept)
                        .transition(.move(edge: .bottom))
                } else {
                    ChooseDriver(mapState: $mapState, isDriverAccept: $isDriverAccept)
                }
            }
            
        }
        .environmentObject(locationViewModel)
    }
    
    var tabBar: some View {
        GeometryReader { proxy in
            VStack {
                Spacer()
                HStack(alignment: .bottom, spacing: 0){
                    ForEach(TabItem.allCases) { (tabItem) in
                        VStack(spacing: 0) {
                            Spacer()
                            Rectangle()
                                .foregroundColor( .clear )
                                .frame(width: 40, height: 40)
                                .overlay(
                                    ZStack {
                                        tabItem.iconView(.white).opacity(self.selectedTab == tabItem ? 1.0 : 0.0)
                                        tabItem.iconView(Color("Navy Blue")).opacity(self.selectedTab != tabItem ? 1.0 : 0.0)
                                    }
                                )
                                .background(
                                    ZStack {
                                        tabItem.labelView(.primary).opacity(self.selectedTab == tabItem ? 1.0 : 0.0)
                                    }.offset(CGSize(width: 0, height: 32))
                                )
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(height: self.selectedTab == tabItem ? 26 : 5)
                        }
                        .frame(width: proxy.size.width * 0.333)
                        .contentShape( Rectangle() )
                        .onTapGesture {
                            withAnimation(.interactiveSpring(response: 0.4, dampingFraction: 0.7) ) { self.selectedTab = tabItem }
                        }
                    }
                }
                .background(
                    Rectangle()
                        .frame(height: 24 + 49 + 40)
                        .overlay(
                            Circle()
                                .foregroundColor(Color("Navy Blue"))
                                .frame(width: 40, height: 40)
                                .offset(CGSize(width: CGFloat(self.selectedTab.rawValue - 1) * (proxy.size.width * 0.333), height: -29))
                        )
                        .foregroundColor(Color("secondaryBackgroundColor"))
                        .offset(CGSize(width: 0, height: 20))
                        .mask(
                            VStack(spacing: 0) {
                                TopFrameView()
                                    .frame(width: 75, height: 24)
                                    .offset(CGSize(width: CGFloat(self.selectedTab.rawValue - 1) * (proxy.size.width * 0.333), height: 0))
                                Rectangle()
                                    .frame(height: 89)
                            }.offset(CGSize(width: 0, height: 20))
                        )
                        .shadow(color: Color.black.opacity(0.3) , radius: 15, x: 0, y: 0)
                )
                .frame(height: 73)
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .environmentObject(LocationSearchViewModel())
    }
}

struct TopFrameView: Shape {
    func path(in rect: CGRect) -> Path {
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 53.22, y: 4.36))
        for (to, controlPoint1, controlPoint2) in [(CGPoint(x: 60.83, y: 13.06), CGPoint(x: 57.76, y: 7.77), CGPoint(x: 60.14, y: 11.68)), (CGPoint(x: 68.43, y: 22.84), CGPoint(x: 63, y: 17.4), CGPoint(x: 65.05, y: 20.96)), (CGPoint(x: 75.16, y: 23.98), CGPoint(x: 70.49, y: 23.98), CGPoint(x: 75.16, y: 23.98))] {
            bezierPath.addCurve(to: to, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
        }
        bezierPath.addLine(to: CGPoint(x: 0.84, y: 23.98))
        for (to, controlPoint1, controlPoint2) in [(CGPoint(x: 7.57, y: 22.84), CGPoint(x: 0.84, y: 23.98), CGPoint(x: 5.51, y: 23.98)), (CGPoint(x: 15.17, y: 13.06), CGPoint(x: 10.95, y: 20.96), CGPoint(x: 13, y: 17.4)), (CGPoint(x: 22.78, y: 4.36), CGPoint(x: 15.86, y: 11.68), CGPoint(x: 18.24, y: 7.77)), (CGPoint(x: 36.38, y: -0), CGPoint(x: 27.58, y: 0.77), CGPoint(x: 33.55, y: 0.1)), (CGPoint(x: 38, y: 0), CGPoint(x: 37.39, y: -0.04), CGPoint(x: 38, y: 0)), (CGPoint(x: 53.22, y: 4.36), CGPoint(x: 38, y: 0), CGPoint(x: 46.7, y: -0.53))] {
            bezierPath.addCurve(to: to, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
        }
        bezierPath.close()
        return Path(bezierPath.cgPath)
    }
}

