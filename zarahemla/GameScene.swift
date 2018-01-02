//
//  GameScene.swift
//  zarahemla
//
//  Created by kohler on 12/30/17.
//  Copyright © 2017 dreamboundlabs. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    public var entities = [GKEntity]()
    public var graphs = [String : GKGraph]()
    
    private var lastUpdateTime : TimeInterval = 0
    private var label : SKLabelNode?
    private var samuel : SKSpriteNode?
    private var ground : SKSpriteNode?
    private var leftButton : SKSpriteNode?
    private var rightButton : SKSpriteNode?
    
    override func sceneDidLoad() {

        self.lastUpdateTime = 0

        leftButton = SKSpriteNode(color: UIColor.green, size: CGSize(width: 100, height: 50))
        leftButton?.position = CGPoint(x: -(screenWidth/2), y: 0)
        leftButton?.deleg
        
        ground = SKSpriteNode(color: UIColor.brown, size: CGSize(width: self.frame.width, height: 30))
        ground?.position = CGPoint(x: 0, y: -(screenHeight/2))
        ground?.physicsBody = SKPhysicsBody(rectangleOf: ground!.size)
        ground?.physicsBody?.affectedByGravity = false
        ground?.physicsBody?.allowsRotation = false
        ground?.physicsBody?.isDynamic = false
        
        samuel = SKSpriteNode(color: UIColor.darkGray, size: CGSize(width: 40, height: 100))
        samuel?.position = CGPoint(x: 0, y: -(screenHeight/2)+40)
        samuel?.physicsBody = SKPhysicsBody()
            
        self.addChild(leftButton!)
        self.addChild(ground!)
        self.addChild(samuel!)
        

    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        print("touch up at: \(pos)")
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
         print("touch up at: \(pos)")
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.red
//            self.addChild(n)
//        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let touch:UITouch = touches.! as UITouch
//        let positionInScene = touch.locationInNode(self)
//        let touchedNode = self.nodeAtPoint(positionInScene)
//        
//        if let name = touchedNode.name
//        {
//            if name == "pineapple"
//            {
//                print("Touched")
//            }
//        }
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
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
    
    func didBegin(_ contact: SKPhysicsContact) {
        print("didbegin")
//        node!.removeFromParent()
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        print("didend")
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
        // Called before each frame is rendered
        
        // Initialize _lastUpdateTime if it has not already been
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        
        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime
        
        if(currentTime - self.lastUpdateTime > 2){
            generateArrow()
            self.lastUpdateTime = currentTime
        }
        
        // Update entities
        for entity in self.entities {
            entity.update(deltaTime: dt)
        }
        
        
    }
    
    // Screen width.
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    // Screen height.
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    private func generateArrow(){
        let origin = CGPoint(x: getRandomScreenXValue(), y: Int(screenHeight)/3)
        let arrow = Arrow(origin: origin)
        self.addChild(arrow.getNode()!)
    }
    
    public func getRandomScreenXValue() -> Int {
        let lowerScreenXBound: Int = Int(-screenWidth/2)
        let upperScreenXBound: Int = Int(screenWidth/2)
        return Util.getRandomNumber(lowerBound: lowerScreenXBound, upperBound: upperScreenXBound)
    }

    
}
