//
//  PlanetView.swift
//  MyPlanets
//
//  Created by Nilusha Wimalasena on 2022-02-09.
//

import SwiftUI
import SDWebImageSwiftUI

struct PlanetView: View {
    
    var planets:planet
    
    var body: some View {
        VStack(spacing:20){
            
            Spacer()
            
            Text(planets.name)
                .font(.title)
                .fontWeight(.semibold)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            AnimatedImage(url: URL(string: "https://picsum.photos/200/300?random=\(planets.id)"))
                .resizable()
                .scaledToFit()
                .frame(height: 150)
                .cornerRadius(15)
            
            HStack(spacing:40){
                
                Label("Climate :",systemImage: "bolt.fill")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(planets.climate)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            
            HStack(spacing:40){
                
                Label("Orbital Period :",systemImage: "bolt.fill")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(planets.orbital_period)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            
            HStack(spacing:40){
                
                Label("Gravity :",systemImage: "bolt.fill")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(planets.gravity)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            
            
            
            
            
            
            Spacer()
        }
        
    }
}

struct PlanetView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetView(planets: planet(id: 1, name: "Earth", climate: "Normal", orbital_period: "10", gravity: "standard"))
    }
}
