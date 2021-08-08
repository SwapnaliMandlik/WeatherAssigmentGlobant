

import XCTest
import ObjectMapper
@testable import WeatherAssigment

class WeatherAssigmentTests: XCTestCase {
    
    var vc: WeatherViewController = WeatherViewController()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    //Test Methods
    func testgetMainResponse() {
        
        let json: [String:Any] =
            ["id":801, "main":"Clouds", "description":"broken clouds", "icon":"04d"]
               
       // let data = Mapper<Weather>.map(JSONObject: Weather.self, toObject: json)
        
        let responseData = Mapper<Weather>().map(JSON: json)
        
        XCTAssertEqual("Clouds", responseData?.main)
        XCTAssertEqual("broken clouds", responseData?.description)
        
    }
    
    
    func testTemp() {
      
        let jsonTemp = """
            {
            "dt":1628402400,
            "main":{
               "temp":82.74,
               "feels_like":86.41,
               "temp_min":82.74,
               "temp_max":82.74,
               "pressure":1009,
               "sea_level":1009,
               "grnd_level":947,
               "humidity":64,
               "temp_kf":0
            },
            "weather":[
               {
                  "id":803,
                  "main":"Clouds",
                  "description":"broken clouds",
                  "icon":"04d"
               }
            ],
            "clouds":{
               "all":74
            },
            "wind":{
               "speed":9.37,
               "deg":256,
               "gust":11.36
            },
            "visibility":10000,
            "pop":0.12,
            "sys":{
               "pod":"d"
            },
            "dt_txt":"2021-08-08 06:00:00"
         
        }
        """
                var dictonary:[String:Any]?
                
                if let data = jsonTemp.data(using: String.Encoding.utf8) {
                    
                    do {
                        dictonary = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]
        
                        if let myDictionary = dictonary
                        {
                             //print(" First name is: \(myDictionary["first_name"]!)")
                            let responseTemp = Mapper<List>().map(JSON: myDictionary as! [String : Any])
                        let temp = responseTemp?.main?.temp as! Double
                       print(temp)
                        //    dictonary["dt_txt"]
                            XCTAssertEqual(82.74, temp)
                        }
                    } catch let error as NSError {
                        print(error)
                    }
                }
        }
    
}
