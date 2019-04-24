//
//  GameScene.swift
//  SpriteKit PONG
//
//  Created by Michael Linker on 4/15/19.
//  Copyright © 2019 Michael Linker. All rights reserved.
//

import SpriteKit
import GameplayKit

let paddleCategory: UInt32 = 1
let wallCategory: UInt32 = 2
let ballCategory: UInt32 = 4

class GameScene: SKScene, SKPhysicsContactDelegate {
    var topPaddle = SKSpriteNode()
    var ball = SKSpriteNode()
    var TrueOrFalse = true
    override func didMove(to view: SKView) {
      let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsBody = border
        border.restitution = 1
        physicsWorld.contactDelegate = self
        
        let topLeft = CGPoint(x: frame.origin.x,y: -frame.origin.y)
        let topRight = CGPoint(x: -frame.origin.x, y: -frame.origin.y)
        
        let top = SKNode()
        top.name = "top"
        top.physicsBody = SKPhysicsBody(edgeFrom: topLeft, to: topRight)
        self.addChild(top)
        
        topPaddle = self.childNode(withName: "topPaddle") as! SKSpriteNode
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        
        topPaddle.physicsBody?.categoryBitMask = paddleCategory
        top.physicsBody?.categoryBitMask = wallCategory
        ball.physicsBody?.categoryBitMask = ballCategory
        
    }
    func didBegin(_ contact: SKPhysicsContact) {
        print(contact.bodyB.node?.name)
        print(contact.bodyA.node?.name)
        contact.bodyB.velocity.dx *= 1.01
        contact.bodyB.velocity.dy *= 1.01
        contact.bodyB.affectedByGravity = TrueOrFalse
        TrueOrFalse = !TrueOrFalse
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self)
        topPaddle.run(SKAction.moveTo(x: location.x, duration: 0.2))
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self)
        topPaddle.run(SKAction.moveTo(x: location.x, duration: 0.2))
    }
}
