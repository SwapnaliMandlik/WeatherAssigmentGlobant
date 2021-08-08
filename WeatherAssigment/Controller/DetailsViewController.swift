

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var lblTemp: UILabel!
    @IBOutlet weak var lblMain: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    var temperature = ""
    var displayMain = ""
    var displayDescription = ""
    @IBOutlet weak var imageBG: UIImageView!
    
    var viewModel: DetailsViewModel?
    var l: List!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Details"
        viewModel = DetailsViewModel.init(weatherData: l)
        
        lblTemp.text = viewModel?.getTemp()
        lblMain.text = displayMain
        lblDescription.text = displayDescription
        imageBG.image = UIImage.init(named: (viewModel?.getBGImageForWeather())!)
        
    }
    
    @IBAction func tapBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
