import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var rippleView: UIView!
    
    private var enableRipple = false
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if !self.enableRipple {
            let layer = RippleLayer(
                size: self.rippleView.frame.size,
                numSprings: 320,
                random: true)
            // layer.ripple.animateEdge = .Bottom
            layer.fillColor = UIColor(red: 204/255, green: 233/255, blue: 249/255, alpha: 1.0).CGColor
            self.rippleView.layer.addSublayer(layer)
            
            self.enableRipple = true
        }
    }
}

