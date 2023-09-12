//
//  WeatherDetailView.swift
//  SD-20230907-ShashantDahikar-Chase
//
//  Created by Shashant Dahikar on 11/09/23.
//

import SwiftUI

struct WeatherDetailView: View {
    
    private struct Constants {
        
        let humidity = "Humidity"
        let wind = "Wind"
        let pressure = "Pressure"
        
        let zero = 0
        let viewSpacing = CGFloat(8)
        let viewPadding = CGFloat(30)
        let viewCornerRadius = CGFloat(20)
        
        let imageFrame = CGFloat(35)
    }
    
    @EnvironmentObject var weatherViewModel: WeatherViewModel
    
    var body: some View {
        HStack {
            VStack(spacing: Constants().viewSpacing){
                Image("humid")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: Constants().imageFrame, height: Constants().imageFrame)
                Text(String(weatherViewModel.weatherData?.humidity ?? Constants().zero).appendPercentage()).bold().font(.title2)
                Text(Constants().humidity)
            }
            Spacer()
            VStack(spacing: Constants().viewSpacing){
                Image("wind")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: Constants().imageFrame, height: Constants().imageFrame)
                Text(String(weatherViewModel.weatherData?.wind ?? Constants().zero).appendMPerSec()).bold().font(.title2)
                Text(Constants().wind)
            }
            Spacer()
            VStack(spacing: Constants().viewSpacing){
                Image("pressure")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: Constants().imageFrame, height: Constants().imageFrame)
                Text(String(weatherViewModel.weatherData?.pressure ?? Constants().zero)).bold().font(.title2)
                Text(Constants().pressure)
            }
        }.padding(Constants().viewPadding)
            .background(Color.white).cornerRadius(Constants().viewCornerRadius).padding()
    }
}

struct WeatherDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailView().environmentObject(WeatherViewModel.init(locationManager: LocationManager()))
    }
}
