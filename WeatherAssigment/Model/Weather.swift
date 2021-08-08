

import Foundation
import ObjectMapper

// MARK: - Result
struct Result : Mappable {
    var cod : String?
    var message : Int?
    var cnt : Int?
    var list : [List]?
    var city : City?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        cod <- map["cod"]
        message <- map["message"]
        cnt <- map["cnt"]
        list <- map["list"]
        city <- map["city"]
    }
    
}

// MARK: - List
struct List : Mappable {
    var dt : Int?
    var main : Main?
    var weather : [Weather]?
    var clouds : Clouds?
    var wind : Wind?
    var visibility : Int?
    var pop : Double?
    var rain : Rain?
    var sys : Sys?
    var dt_txt : String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        dt <- map["dt"]
        main <- map["main"]
        weather <- map["weather"]
        clouds <- map["clouds"]
        wind <- map["wind"]
        visibility <- map["visibility"]
        pop <- map["pop"]
        rain <- map["rain"]
        sys <- map["sys"]
        dt_txt <- map["dt_txt"]
    }
    
}

// MARK: - City
struct City : Mappable {
    var id : Int?
    var name : String?
    var coord : Coord?
    var country : String?
    var population : Int?
    var timezone : Int?
    var sunrise : Int?
    var sunset : Int?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        id <- map["id"]
        name <- map["name"]
        coord <- map["coord"]
        country <- map["country"]
        population <- map["population"]
        timezone <- map["timezone"]
        sunrise <- map["sunrise"]
        sunset <- map["sunset"]
    }
    
}
// MARK: - Clouds
struct Clouds : Mappable {
    var all : Int?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        all <- map["all"]
    }
    
}

// MARK: - Coord
struct Coord : Mappable {
    var lat : Double?
    var lon : Double?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        lat <- map["lat"]
        lon <- map["lon"]
    }
    
}
// MARK: - Main
struct Main : Mappable {
    var temp : Double?
    var feels_like : Double?
    var temp_min : Double?
    var temp_max : Double?
    var pressure : Int?
    var sea_level : Int?
    var grnd_level : Int?
    var humidity : Int?
    var temp_kf : Int?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        temp <- map["temp"]
        feels_like <- map["feels_like"]
        temp_min <- map["temp_min"]
        temp_max <- map["temp_max"]
        pressure <- map["pressure"]
        sea_level <- map["sea_level"]
        grnd_level <- map["grnd_level"]
        humidity <- map["humidity"]
        temp_kf <- map["temp_kf"]
    }
    
}

// MARK: - Weather
struct Weather : Mappable {
    var id : Int?
    var main : String?
    var description : String?
    var icon : String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        id <- map["id"]
        main <- map["main"]
        description <- map["description"]
        icon <- map["icon"]
    }
    
}

// MARK: - Wind
struct Wind : Mappable {
    var speed : Double?
    var deg : Int?
    var gust : Double?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        speed <- map["speed"]
        deg <- map["deg"]
        gust <- map["gust"]
    }
    
}
// MARK: - Rain
struct Rain : Mappable {
    
    
    var threeH : Double?
    
    init?(map: Map) {
        
        if(map.JSON["3h"] as? Double == nil) {
            return nil
        }
        threeH <- map["3h"]
    }
    
    mutating func mapping(map: Map) {
        
        threeH <- map["3h"]
    }
    
}
// MARK: - Sys
struct Sys : Mappable {
    var pod : String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        pod <- map["pod"]
    }
    
}
