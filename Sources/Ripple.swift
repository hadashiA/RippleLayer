import UIKit

public final class Ripple {
    struct Spring {
        var height: CGFloat = 0
        var velocity: CGFloat = 0
        
        mutating func update(density: CGFloat, rippleSpeed: CGFloat) {
            // let k: CGFloat = 0.025
            // let acceleration = -k * (targetHeight - self.height)
            
            // self.height   += self.velocity
            // self.velocity += acceleration
            self.velocity += (-rippleSpeed * self.height - density * self.velocity)
            self.height   += self.velocity
        }
    }
    
    var size: CGSize
    var density: CGFloat = 0.02
    var rippleSpeed: CGFloat = 0.1
    var springs: [Spring]
    var numNeighbours = 8

    public init(size: CGSize, numSprings: Int = 340) {
        self.size = size
        self.springs = [Spring](count: numSprings, repeatedValue: Spring())
    }
    
    public func rippleAt(i: Int, height: CGFloat) {
        if i < 0 || i > self.springs.count - 1 {
            return
        }
        
        self.springs[i].height = height
    }
    
    public func updateSprings(spread: CGFloat) {
        let count = self.springs.count
        for i in 0..<count {
            self.springs[i].update(self.density, rippleSpeed: self.rippleSpeed)
            // self.springs[i].update(self.size.height, rippleSpeed: self.rippleSpeed)
        }

        var leftDeltas = [CGFloat](count: self.springs.count, repeatedValue: 0)
        var rightDeltas = [CGFloat](count: self.springs.count, repeatedValue: 0)

        for t in 0..<self.numNeighbours {
            for i in 0..<count {
                if i > 0 {
                    leftDeltas[i] = spread * (self.springs[i].height - self.springs[i - 1].height)
                    self.springs[i - 1].velocity += leftDeltas[i]
                }
                if i < self.springs.count - 1 {
                    rightDeltas[i] = spread * (self.springs[i].height - self.springs[i + 1].height)
                     self.springs[i + 1].velocity += rightDeltas[i]
                }
            }
            
            for i in 0..<count {
                if i > 0 {
                    self.springs[i - 1].height += leftDeltas[i]
                }
                if i < count - 1 {
                    self.springs[i + 1].height += rightDeltas[i]
                }
            }
        }
    }
    
    public func createPath() -> CGPath {
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: 0, y: self.size.height))
        for i in 0..<self.springs.count {
            let spring = self.springs[i]
            
            let x = CGFloat(i) * (self.size.width / CGFloat(self.springs.count))
            let y = spring.height
            path.addLineToPoint(CGPoint(x: x, y: y))
        }
        path.addLineToPoint(CGPoint(x: self.size.width, y: self.size.height))
        path.closePath()
        return path.CGPath
    }
}
