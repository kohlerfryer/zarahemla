//
//  Arrow.swift
//  zarahemla
//
//  Created by Kitty Katt on 1/1/18.
//  Copyright © 2018 dreamboundlabs. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class Arrow: NSObject{

    private var node: SKSpriteNode?
    private var damping: CGFloat = 20
    
    private let size: CGSize = CGSize(width: 5, height: 100)
    private let width: Int = 5
    private let height: Int = 100
    private let color: UIColor = UIColor.black
    
    
    init(angle: Double){
        super.init()
        self.node = SKSpriteNode(color: self.color, size: self.size)

        self.node!.physicsBody = SKPhysicsBody(rectangleOf: self.node!.size)
        //self.node!.physicsBody!.linearDamping = self.damping
        self.node!.physicsBody!.affectedByGravity = false
        self.node!.position = CGPoint(x: (cos(angle * M_PI / 180.0) * 60 ), y: (sin(angle * M_PI / 180.0) * 50))
        self.node!.zRotation = CGFloat(angle)
        print("origin: x:\(self.node!.position .x)  y:\(self.node!.position .y) angle:\(self.node!.zRotation)")
        
        var timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(removeNode),
            userInfo: nil,
            repeats: true
        )
        timer.fire()

    }
    
    public func fire(){
        self.node!.physicsBody!.applyForce(CGVector(dx: 40, dy: -20))
    }
    
    @objc func removeNode() {
        self.getNode()?.removeFromParent()
    }
    
    func getNode() -> SKSpriteNode? {
        return self.node
    }
    
}
