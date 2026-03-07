//
//  CitySearchView.swift
//  WeatherApplication
//
//  Created by Lindokuhle Khumalo on 2026/03/06.
//

import SwiftUI

struct CitySearchView: View {
    
    @StateObject private var viewModel = WeatherViewModel()
    @State private var city = ""
    
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [Color.blue, Color.white],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .ignoresSafeArea()
            
            VStack (spacing: 50) {
                
                TextField("Enter City...", text: $city)
                    .textFieldStyle(.roundedBorder)
                
                Button {
                    Task {
                        await viewModel.fetchWeather(for: city)
                    }
                } label: {
                    WeatherButton(title: "Get Forcast")
                }
                .background(city.isEmpty ? Color.gray : Color.blue)
                .disabled(city.trimmingCharacters(in: .whitespaces).isEmpty)
                Spacer()
            }
            .padding()
            
            if viewModel.isLoading {
                ProgressView()
            }
        }
        .navigationDestination(isPresented: $viewModel.navigateToForecast) {
            ForecastView(viewModel: viewModel)
        }
        .alert(viewModel.alertMessage, isPresented: $viewModel.showAlert) {
            Button("Try again", role: .cancel) { }
        }
        .navigationTitle("World Wide Weather")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct CitySearchView_Previews: PreviewProvider {
    static var previews: some View {
        CitySearchView()
    }
}
