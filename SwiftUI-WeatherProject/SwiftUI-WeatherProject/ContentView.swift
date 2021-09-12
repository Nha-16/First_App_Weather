//
//  ContentView.swift
//  SwiftUI-WeatherProject
//
//  Created by sossokleng on 12/9/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            
            VStack{
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      temperature: isNight ? 23 : 76)
                
                HStack(spacing:20){
                    WheatherDayView(dayOfWeek: "TUE",
                                    imageName: "cloud.sun.fill",
                                    temperature: 79)
                    
                    WheatherDayView(dayOfWeek: "WED",
                                    imageName: "cloud.sun.bolt.fill",
                                    temperature: 74)
                    
                    WheatherDayView(dayOfWeek: "THU",
                                    imageName: "sun.max.fill",
                                    temperature: 44)
                    
                    WheatherDayView(dayOfWeek: "FRI",
                                    imageName: "cloud.sun.rain.fill",
                                    temperature: 23)
                    
                    WheatherDayView(dayOfWeek: "SAT",
                                    imageName: "wind.snow",
                                    temperature: 83)
                    
                }
                Spacer()
                
                Button{
                    isNight.toggle()
                }label:{
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WheatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16,weight: .medium,design:
                                .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28,weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("LightBlue")]),
                       startPoint: .topLeading,
                       endPoint:  .bottomTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityTextView:View {
    var cityName: String
    
    var body: some View{
        Text(cityName)
            .font(.system(size: 32, weight: .medium,design: .default))
            .foregroundColor(.white)
            .padding()    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    var body: some View{
        VStack(spacing:10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 140, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Text("\(temperature)°")
                .font(.system(size: 70,weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom,40)
    }
}
