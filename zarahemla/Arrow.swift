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
    private var damping: CGFloat = 30
    
    private let size: CGSize = CGSize(width: 5, height: 100)
    private let width: Int = 5
    private let height: Int = 100
    private let color: UIColor = UIColor.black
    
    
    init(origin: CGPoint){
        super.init()
        self.node = SKSpriteNode(color: self.color, size: self.size)
        self.node!.physicsBody = SKPhysicsBody(rectangleOf: self.node!.size)
        self.node!.physicsBody!.linearDamping = self.damping
        self.node!.position = origin
        var timer = Timer.scheduledTimer(
            timeInterval: 10,
            target: self,
            selector: #selector(removeNode),
            userInfo: nil,
            repeats: true
        )
        timer.fire()

    }
    
    @objc func removeNode() {
        self.getNode()?.removeFromParent()
    }
    
    func getNode() -> SKSpriteNode? {
        return self.node
    }
    
}
