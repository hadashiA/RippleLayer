import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var rippleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let waveLayer = RippleLayer(
            size: self.rippleView.frame.size,
            numSprings: 320,
            random: true)
        waveLayer.fillColor = UIColor(red: 204/255, green: 233/255, blue: 249/255, alpha: 1.0).CGColor
        self.rippleView.layer.addSublayer(waveLayer)
    }
}

