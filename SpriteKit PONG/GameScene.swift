//
//  GameScene.swift
//  SpriteKit PONG
//
//  Created by Michael Linker on 4/15/19.
//  Copyright © 2019 Michael Linker. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    var topPaddle = SKSpriteNode()
    override func didMove(to view: SKView) {
      let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsBody = border
        border.restitution = 1
        physicsWorld.contactDelegate = self
        
        topPaddle = self.childNode(withName: "topPaddle") as! SKSpriteNode
    }
    func didBegin(_ contact: SKPhysicsContact) {
        print(contact.bodyB)
        print(contact.bodyA)
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
