//
//  PlanetListViewModel.swift
//  MyPlanets
//
//  Created by Nilusha Wimalasena on 2022-02-14.
//

import Foundation
import Alamofire
import SwiftyJSON

class PlanetList:ObservableObject{
    @Published var planets = [planet]()

    var planetURL:String = "https://swapi.dev/api/planets"
    
    var allPlannets:planet = planet(id: 1, name: "", climate: "", orbital_period: "", gravity: "")
    
    init(){
        setupPublishers()
        
    }
    
    private func setupPublishers(){
        getAllPlannetList()
    }
    
    func getAllPlannetList(){
        
        AF.request(planetURL).response { response in
            let json = try! JSON(data: response.data!)
            //self.previousPage = json["previous"].stringValue
            self.planetURL = json["next"].stringValue
            print(self.planetURL)
            
            for i in json["results"]{
                self.planets.append(planet(id: i.1["diameter"].intValue, name: i.1["name"].stringValue, climate: i.1["climate"].stringValue, orbital_period: i.1["orbital_period"].stringValue, gravity: i.1["gravity"].stringValue))
                
            }
        }
        
    }
    
    func calculeteDistence(){
        print("Distence for the plannet is :\(allPlannets.orbital_period) ")
    }
}
