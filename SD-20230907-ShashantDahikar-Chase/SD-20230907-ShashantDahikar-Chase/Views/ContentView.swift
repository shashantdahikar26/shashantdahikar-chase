//
//  ContentView.swift
//  SD-20230907-ShashantDahikar-Chase
//
//  Created by Shashant Dahikar on 07/09/23.
//

import SwiftUI

struct ContentView: View {
    private struct Constants {
        let userDefaultsKey = "lastSearchedCity"
    }

    @State private var searchText = ""
    @StateObject var weatherViewModel = WeatherViewModel(locationManager: LocationManager())
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.blue, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical) {
                VStack {
                    SearchBarView(text: $searchText) {
                        Task {
                            await weatherViewModel.fetchCityName(cityName: searchText)
                        }
                    }
                    
                    Text(weatherViewModel.weatherData?.name ?? "city").bold().font(.largeTitle)
                    
                    Image(uiImage: (weatherViewModel.weatherData?.iconImage ?? UIImage(systemName: "cloud"))!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                    
                    Text(String(weatherViewModel.weatherData?.temp ?? Double(0)).appendDegree()).bold().font(.largeTitle)
                    Text(weatherViewModel.weatherData?.description ?? "Description")
                    
                    WeatherDetailView().environmentObject(weatherViewModel)
                    
                    Spacer()
                }
            }
            
        }.onAppear{
            self.weatherViewModel.locationManager.requestAuthorization()
            
            if let lastSearchedCity = UserDefaults.standard.string(forKey: Constants().userDefaultsKey) {
                searchText = lastSearchedCity
                Task {
                    await weatherViewModel.fetchCityName(cityName: searchText)
                }
            } else {
                weatherViewModel.getUserCurrentCityWithLocation()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
