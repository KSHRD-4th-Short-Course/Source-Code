// 1. Create Slider outlet
// 2. Create Label outlet
// 3. Create Action from slider
// 4. Set slider value to label


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var valueLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        slider.value = 0
        slider.maximumValue = 100
        slider.minimumValue = 0
        
        valueLabel.text = ""
    }

    @IBAction func sliderValueChange(_ sender: Any) {
        valueLabel.text = "\(slider.value)"
    }
}






