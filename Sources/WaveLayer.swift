import UIKit

public class WaveLayer : CAShapeLayer {
    private var wave: Wave
    private var beforeTimestamp: CFTimeInterval?
    private var hasRandomSplash: Bool
    private var randomWaveHeight: CGFloat = 100
    
    init(size: CGSize, numSprings: Int = 340, random: Bool = true) {
        self.hasRandomSplash = random
        self.wave = Wave(size: size, numSprings: numSprings)
        super.init()
        
        self.path = self.wave.createPath()
        
        let displayLink = CADisplayLink(target: self, selector: "onUpdate:")
        displayLink.addToRunLoop(NSRunLoop.currentRunLoop(), forMode: NSRunLoopCommonModes)
    }
    
    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func onUpdate(displayLink: CADisplayLink) {
        if let beforeTimestamp = self.beforeTimestamp {
            let elapsed = displayLink.timestamp - beforeTimestamp
            let updateValue: CGFloat = CGFloat(elapsed) * 60.0 * 0.1
            if self.hasRandomSplash {
                let r = arc4random_uniform(UInt32(10000 * elapsed))
                if r < 3 {
                    let i = arc4random_uniform(UInt32(self.wave.springs.count))
                    self.wave.rippleAt(Int(i), height: self.randomWaveHeight)
                }
            }
            self.wave.updateSprings(updateValue)
            self.path = self.wave.createPath()
            
        }
        self.beforeTimestamp = displayLink.timestamp
    }
}