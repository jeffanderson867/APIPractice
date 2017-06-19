//
//  NetworkController.swift
//  APIPractice
//
//  Created by Big J on 6/16/17.
//  Copyright © 2017 AndersonCoding. All rights reserved.
//

import Foundation

class NetworkController {


    func fetchAPOD(completion: @escaping (APOD) -> () ) {
        //want it to fetch JSON from Astronomy Picture of the Day (APOD) API and return APOD object initialized with JSON dictionary

        //let baseURLString: String = "https://api.nasa.gov/planetary/apod"

        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.nasa.gov"
        components.path = "/planetary/apod"

        let apiKeyItem = URLQueryItem(name: "api_key", value: "DEMO_KEY")

        components.queryItems = [apiKeyItem]
        let url = components.url
        var json: [String: String] = [:]

        //fetch json and make APOD object
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if let data = data {
                let rawJSON = try? JSONSerialization.jsonObject(with: data)

                json = (rawJSON as? [String: String])!
                let myAPOD: APOD = APOD(json: json)

                completion(myAPOD)
            }

        }
        task.resume()

    }

}

class APOD {
    var json: [String: String]
    var imageURLString: String?
    var description: String?
    var date: String?
    var copyright: String?
    var title: String?



    init(json:[String: String]){
        self.json = json
        self.imageURLString = json["url"]
        self.description = json["explanation"]
        self.date = json["date"]
        self.title = json["title"]
        if let copyright = json["copyright"]{
            self.copyright = copyright
        }
    }
}
