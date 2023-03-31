//
//  SecondScene.swift
//  swift game gc1
//
//  Created by Dxjerry on 2017/12/8.
//  Copyright © 2017年 dxjerry. All rights reserved.
//

import UIKit
import SpriteKit

let bird=SKSpriteNode(imageNamed: "human(smail)的副本")
var numoftube:Int=0
var gameover:Bool=false
var enemyarr:[SKSpriteNode]=[]
let overword=SKLabelNode()
var didbegin:Bool=false

class SecondScene: SKScene,SKPhysicsContactDelegate {
    override func didMove(to view: SKView) {
        createScene()
        self.physicsWorld.contactDelegate=self
    }
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    func spawnEnemy() {
        let enemy = SKSpriteNode(imageNamed: "monster(a)small.png")
        enemy.name = "enemy"
        enemy.physicsBody = SKPhysicsBody.init(circleOfRadius: 25)
        enemy.physicsBody?.affectedByGravity=false //不受重力影响
        enemy.physicsBody?.usesPreciseCollisionDetection = true //物理体允许检测碰撞
        enemy.physicsBody!.contactTestBitMask = 1
        enemy.physicsBody?.collisionBitMask = 1
        enemy.position = CGPoint(x: frame.size.width + enemy.size.width/2,y: frame.size.height * random(min: 0, max: 1))
        addChild(enemy)
        enemy.run(SKAction.moveBy(x: -size.width - enemy.size.width, y: 0.0,duration: TimeInterval(random(min: 1, max: 2))))
        enemyarr.append(enemy)
    }
    
    func tickDown()
    {
        print("tick...")
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if didbegin==false{
            bird.physicsBody?.affectedByGravity=true
            run(SKAction.repeatForever(SKAction.sequence([SKAction.run(spawnEnemy),SKAction.wait(forDuration: 1.0)])))
            overword.isHidden=true
            overword.text="你失败了!"
            overword.fontSize=10
            didbegin=true
        }
        else{
            if gameover==false{
                let impulse =  CGVector(dx: 0, dy: 30)
                bird.physicsBody?.applyImpulse(impulse)
            }
        }
    }
    
    

    func testMain2(){
        print("hello main2")
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        print(contact.bodyA.node?.name ?? "nv")
        print(contact.bodyB.node?.name ?? "nv")
        print("=======")
        if ((contact.bodyA.node?.name=="bird")&&(contact.bodyB.node?.name=="enemy")){
            contact.bodyB.affectedByGravity=true
            gameover=true
            showword()
        }
        else if((contact.bodyA.node?.name=="enemy")&&(contact.bodyB.node?.name=="bird")){
            //self.removeFromParent()
            contact.bodyA.affectedByGravity=true
            gameover=true
            showword()
        }
        else if ((contact.bodyA.node?.name==nil)&&(contact.bodyB.node?.name=="bird"))||((contact.bodyA.node?.name=="bird")&&(contact.bodyB.node?.name==nil)){
            gameover=true
            showword()
        }
    }
    
    func showword(){
        let tobig = SKAction.scale(to: 3.0, duration: 1)
        overword.isHidden=false
        overword.run(tobig)
    }
    
    func createScene(){
        //设置物理效果的边界
        let playableRect = CGRect(x: 0, y: 10, width: (self.view?.bounds.width)!, height: (self.view?.bounds.height)!-10)
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: playableRect)
        
        bird.name="bird"
        bird.position=CGPoint(x:100,y:UIScreen.main.bounds.size.height/2+200)
        bird.physicsBody = SKPhysicsBody.init(circleOfRadius: 25)
        bird.physicsBody?.usesPreciseCollisionDetection = true //物理体允许检测碰撞
        bird.physicsBody?.isDynamic = true //允许移动
        bird.physicsBody?.affectedByGravity=false
        bird.physicsBody?.restitution=0.3   //弹性值
        bird.physicsBody!.contactTestBitMask = 1
        bird.physicsBody?.collisionBitMask = 1
        self.addChild(bird)
        
        overword.text="点击任意处开始！"
        overword.fontName="Chalkduster"
        overword.position=CGPoint(x:self.frame.midX, y:self.frame.midY)
        overword.fontSize=30
        overword.fontColor=UIColor.red
        self.addChild(overword)
    }
    
    override func update(_ currentTime: TimeInterval) {
        for eni in enemyarr{
            if (eni.position.x<=0){
                eni.removeFromParent()
                enemyarr.remove(at: enemyarr.index(of: eni)!)
            }
        }
    }
}
