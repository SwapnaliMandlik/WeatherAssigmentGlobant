

import UIKit
import Alamofire
import ObjectMapper

class WeatherViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var weatherViewModel: WeatherViewModel = WeatherViewModel()
    var weatherList: [List]?
    var selectedIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Temperature"
        configureTableView()
        getWeatherData()
        
    }
    
    func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    func reloadData(){
        tableView.reloadData()
    }
    
    func getWeatherData() {
        weatherViewModel.fetchWeatherData { status in
            if status {
                self.reloadData()
            } else {
                print("Some error occured!!")
            }
        }
    }
    
}

extension WeatherViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return weatherViewModel.response?.list?.count ?? 0
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            if indexPath.row == selectedIndex {
                return 354
            }else {
                return 115
            }
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: WeatherTableViewCell = tableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell") as! WeatherTableViewCell
        cell.lblTemp?.text = weatherViewModel.getTemp(for: indexPath.row)
        cell.lblDate.text = weatherViewModel.getDate(for: indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let story = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        
        vc.temperature = weatherViewModel.getTemp(for: indexPath.row)
        
        vc.displayMain = weatherViewModel.getMain(for: indexPath.row)
        
        vc.displayDescription = weatherViewModel.getDescription(for: indexPath.row)
        vc.l = weatherViewModel.response?.list?[indexPath.row]
        
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
     }
    
}

