//
//  WeatherButton.swift
//  SwiftUI-WeatherProject
//
//  Created by sossokleng on 13/9/21.
//

import SwiftUI
struct WeatherButton:View {
    var title: String
    var textColor:Color
    var backgroundColor:Color
    
    var body: some View{
        Text(title)
            .frame(width: 270, height: 60)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20,weight: .bold,design: .default))
            .cornerRadius(10)
    }
}
