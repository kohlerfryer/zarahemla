//
//  GameScene.swift
//  zarahemla
//
//  Created by kohler on 12/30/17.
//  Copyright © 2017 dreamboundlabs. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    
    private var lastUpdateTime : TimeInterval = 0
    private var label : SKLabelNode?
    private var arrow : SKShapeNode?
    private var ground : SKShapeNode?
    private var arrowPhysicsBody : SKPhysicsBody?
    private var groundPhysicsBody : SKPhysicsBody?
    
    override func sceneDidLoad() {

        self.lastUpdateTime = 0

    
        arrow = SKShapeNode(rect: CGRect(x: 0, y: 0, width: 100, height: 10))
        arrowPhysicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 100, height: 10))
        arrowPhysicsBody?.isDynamic = true
        arrow?.physicsBody = arrowPhysicsBody
        arrowPhysicsBody?.affectedByGravity = true
        //arrowPhysicsBody?.applyForce(CGVector(dx: 0, dy: -300))
        arrow?.fillColor = UIColor.black
        
        
        ground = SKShapeNode(rect: CGRect(x: -screenWidth/2, y: -screenHeight/2, width: screenWidth, height: 50))
        groundPhysicsBody = SKPhysicsBody(rectangleOf: CGSize(width: screenWidth, height: 50))
        groundPhysicsBody?.isDynamic = false
        ground?.physicsBody = groundPhysicsBody
        ground?.fillColor = UIColor.brown

        addChild(arrow!)
        addChild(ground!)
        

    }
    
    
    func touchDown(atPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.green
//            self.addChild(n)
//        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.blue
//            self.addChild(n)
//        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.red
//            self.addChild(n)
//        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let label = self.label {
//            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
//        }
//        
//        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        // Initialize _lastUpdateTime if it has not already been
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        
        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime
        
        // Update entities
        for entity in self.entities {
            entity.update(deltaTime: dt)
        }
        
        self.lastUpdateTime = currentTime
    }
    
    // Screen width.
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    // Screen height.
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
}
