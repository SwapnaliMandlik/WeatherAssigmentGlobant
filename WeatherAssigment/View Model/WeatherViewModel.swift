
import Foundation
import Alamofire
import ObjectMapper

class WeatherViewModel {
    
    let weatherUrl: String = "https://api.openweathermap.org/data/2.5/forecast?APPID=d65a6a5aa07ef9ac968eb9aee985520e&lat=18.5204&lon=73.8567&units=imperial"
    
    var response: Result?
    
    func fetchWeatherData(completionHandler: @escaping (_ status: Bool) -> ()){
        
        guard let urlString = URL(string: weatherUrl) else { return }
        AF.request(urlString).responseJSON { (responce) in
            switch responce.result {
            case .success(let value):
                guard let castingValue = value as? [String: Any] else { return }
                guard let responseData = Mapper<Result>().map(JSON: castingValue) else { return }
                self.response = responseData
                completionHandler(true)
            case .failure(let error):
                completionHandler(false)
                print(error.localizedDescription)
            }
            
        }
    }
    
    func getTemp(for row: Int) -> String {
        
        if let temp = response?.list?[row].main?.temp {
            return temp.description + " F" //String(temp)
            
        }
        return "NA"
    }
    
    func getDate(for row: Int) -> String {
        if let date = response?.list?[row] {
            if let temp = date.dt_txt{
                return getTodayWeekDay(dateString: temp) //+ "\n" + getDate(dateString: temp) + " " + getTime(dateString: temp)
            }
        }
        return "NA"
    }
    
    func getTodayWeekDay(dateString: String)-> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        guard let date = formatter.date(from: dateString) else {
            return "Ghost day"
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" + "\n" + "EEEE"
        let weekDay = dateFormatter.string(from: date)
        return weekDay
    }
    
    
    func getMain(for row: Int) -> String {
        if let mainValue1 = response?.list?[row] {
            if let mainValue = mainValue1.weather?.first {
                return mainValue.main!
            }
        }
        return "NA"
    }
    
    func getDescription(for row: Int) -> String {
        if let descriptionValue1 = response?.list?[row] {
            if let descriptionValue = descriptionValue1.weather?.first {
                return descriptionValue.description!
            }
        }
        return "NA"
    }
    
    
}
