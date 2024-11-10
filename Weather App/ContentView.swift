//
//  ContentView.swift
//  Weather App
//
//  Created by Zeth Thomas on 11/1/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack {
                CityTextView(cityName: "Las Vegas")
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      temperature: 82)
                
                HStack (spacing: 20)  {
                WeatherDayView(dayOfWeek: "TUE",
                               imageName: "cloud.sun.fill",
                               temperature: 82)
                WeatherDayView(dayOfWeek: "WED",
                               imageName: "sun.max.fill",
                               temperature: 90)
                WeatherDayView(dayOfWeek: "THU",
                               imageName: "wind.snow",
                               temperature: 70)
                WeatherDayView(dayOfWeek: "FRI",
                               imageName: "cloud.sun.fill",
                               temperature: 75)
                WeatherDayView(dayOfWeek: "SAT",
                               imageName: "cloud.bolt.rain.fill",
                               temperature: 62)
                    
                }
                
                Spacer()
                
                Button  {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white   )
                }
                
                Spacer()
            }
           
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16 , weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
            
        }
    }
}

struct BackgroundView: View {
    
  var isNight: Bool
    
    var body: some View {
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}


