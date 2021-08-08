


import Foundation

class DetailsViewModel {
    
    var list : List?
    
    init(weatherData: List) {
        self.list = weatherData
        
    }
    enum ImageName: String {
        case clouds = "Clouds"
        case rain = "Rain"
    }
    
    func getBGImageForWeather () -> String {
        if let m = self.list?.weather?.first?.main
        {
            if (m == "Clouds"){
                return ImageName.clouds.rawValue
            } else {
                return ImageName.rain.rawValue
            }
            
        }
        return "NA"
        
    }
    func getTemp() -> String {
        if let m = self.list?.main?.temp
        {
            return m.description + " F"
        }
        return "NA"
    }
    
}
