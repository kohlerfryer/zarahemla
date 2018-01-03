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
    private var moveLeft : Bool = false
    private var moveRight : Bool = false
    
    override func sceneDidLoad() {

        self.lastUpdateTime = 0

        leftButton = SKSpriteNode(color: UIColor.green, size: CGSize(width: 100, height: 50))
        leftButton?.position = CGPoint(x: -(screenWidth/2), y: 0)
        leftButton?.name = "left_button"
        
        rightButton = SKSpriteNode(color: UIColor.green, size: CGSize(width: 100, height: 50))
        rightButton?.position = CGPoint(x: (screenWidth/2), y: 0)
        rightButton?.name = "right_button"
        
        ground = SKSpriteNode(color: UIColor.brown, size: CGSize(width: self.frame.width, height: 30))
        ground?.position = CGPoint(x: 0, y: -(screenHeight/2))
        ground?.physicsBody = SKPhysicsBody(rectangleOf: ground!.size)
        ground?.physicsBody?.affectedByGravity = false
        ground?.physicsBody?.allowsRotation = false
        ground?.physicsBody?.isDynamic = false
        
        samuel = SKSpriteNode(color: UIColor.darkGray, size: CGSize(width: 20, height: 50))
        samuel?.position = CGPoint(x: 0, y: 30-(screenHeight/2))
        samuel?.physicsBody = SKPhysicsBody(rectangleOf: samuel!.size)
        
        self.addChild(leftButton!)
        self.addChild(rightButton!)
        self.addChild(ground!)
        self.addChild(samuel!)
        

    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch:UITouch = touches.first! as UITouch
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        
        if let name = touchedNode.name{
            if name == self.leftButton?.name{
                moveLeft = true
            }
            else if name == self.rightButton?.name{
                moveRight = true
            }
        }
  
        
//        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.moveLeft = false
        self.moveRight = false
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
        
        if(moveRight){
            self.samuel?.position.x = (self.samuel?.position.x)! + 15
        }else if(moveLeft){
            self.samuel?.position.x = (self.samuel?.position.x)! - 15
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
