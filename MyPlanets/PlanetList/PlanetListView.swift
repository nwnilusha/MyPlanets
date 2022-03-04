//
//  ContentView.swift
//  MyPlanets
//
//  Created by Nilusha Wimalasena on 2022-02-08.
//

import SwiftUI
import SDWebImageSwiftUI


struct PlanetListView: View {
    
    @ObservedObject var allPlanets = PlanetList()
    var body: some View {
        NavigationView{
            
            List(){
                ForEach(allPlanets.planets){planet in
                    NavigationLink(destination: PlanetView(planets: planet), label: {
                        planetList(name: planet.name, climate: planet.climate, id:planet.id)
                    })
                }
                
                if allPlanets.planetURL != ""{
                    Text("Featching data")
                        .onAppear(perform:{
                            allPlanets.getAllPlannetList()
                        })
                }
            }
            .navigationTitle("My Planet List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetListView()
    }
}



struct planetList : View{
    var name:String
    var climate:String
    var id:Int
    
    var body: some View{
        HStack{
            AnimatedImage(url: URL(string: "https://picsum.photos/200/300?random=\(id)"))
                .resizable()
                .frame(width: 30, height: 30)
            
            
            VStack{
                Text(name)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.leading)
                Text(climate)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.leading)
            }
        }
        
    }
}


