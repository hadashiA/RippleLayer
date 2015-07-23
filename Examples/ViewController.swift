import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var waveView: UIView!
    
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
        
        let waveLayer = WaveLayer(
            size: self.waveView.frame.size,
            numSprings: 320,
            random: true)
        waveLayer.fillColor = UIColor(red: 204/255, green: 233/255, blue: 249/255, alpha: 1.0).CGColor
        self.waveView.layer.addSublayer(waveLayer)
    }
}

