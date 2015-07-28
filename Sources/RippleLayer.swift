import UIKit

public class RippleLayer : CAShapeLayer {
    public var ripple: Ripple
    private var beforeTimestamp: CFTimeInterval?
    private var hasRandomSplash: Bool
    private var randomWaveHeight: CGFloat = 100
    
    public init(size: CGSize, numSprings: Int = 340, random: Bool = true) {
        self.hasRandomSplash = random
        self.ripple = Ripple(size: size, numSprings: numSprings)
        super.init()
        
        self.path = self.ripple.createPath()
        
        let displayLink = CADisplayLink(target: self, selector: "onUpdate:")
        displayLink.addToRunLoop(NSRunLoop.currentRunLoop(), forMode: NSRunLoopCommonModes)
        
        self.ripple.rippleAt(0, height: self.randomWaveHeight)
    }
    
    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func onUpdate(displayLink: CADisplayLink) {
        if let beforeTimestamp = self.beforeTimestamp {
            let elapsed = displayLink.timestamp - beforeTimestamp
            let updateValue: CGFloat = CGFloat(elapsed) * 60.0 * 0.1
            if self.hasRandomSplash {
                let r = arc4random_uniform(UInt32(10000 * elapsed))
                if r < 3 {
                    let i = arc4random_uniform(UInt32(self.ripple.springs.count))
                    self.ripple.rippleAt(Int(i), height: self.randomWaveHeight)
                }
            }
            self.ripple.updateSprings(updateValue)
            self.path = self.ripple.createPath()
            
        }
        self.beforeTimestamp = displayLink.timestamp
    }
}
