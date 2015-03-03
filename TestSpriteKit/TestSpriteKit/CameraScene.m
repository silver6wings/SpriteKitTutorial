//
//  CameraScene.m
//  TestSpriteKit
//
//  Created by silver6wings on 14-8-31.
//  Copyright (c) 2014年 silver6wings. All rights reserved.
//

#import "CameraScene.h"

@implementation CameraScene

SKSpriteNode * camera;

-(id)initWithSize:(CGSize)size{
    
    if (self = [super initWithSize:size]) {
        self.backgroundColor = [SKColor blackColor];
        self.anchorPoint = CGPointMake(0.5, 0.5);
        
        SKSpriteNode * myWorld = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship.png"];
        myWorld.position = CGPointMake(0, 0);
        myWorld.name = @"myWorld";
        [self addChild:myWorld];
        
        SKSpriteNode * s1 = [SKSpriteNode spriteNodeWithImageNamed:@"Missile.png"];
        s1.position = CGPointMake(50, 50);
        s1.name = @"s1";
        [self addChild:s1];
        
        camera = [SKSpriteNode spriteNodeWithImageNamed:@"testButton"];
        camera.position = CGPointMake(100, 100);
        camera.name = @"camera";
        [myWorld addChild:camera];
        
        NSLog(@"%f", myWorld.zPosition);
        NSLog(@"%f", s1.zPosition);
        NSLog(@"%f", camera.zPosition);
        
        
        for (SKNode * tNode in self.children) {
            NSLog(@"%@",tNode.name);
        }
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [camera runAction:[SKAction moveByX:10 y:20 duration:0.5]];
}

-(void)didSimulatePhysics{
    [self centerOnNode:camera];
}

-(void)centerOnNode:(SKNode *)node{
    
    CGPoint cameraPositionInScene = [node.scene convertPoint:node.position fromNode:node.parent];
    node.parent.position = CGPointMake(node.parent.position.x - cameraPositionInScene.x,
                                       node.parent.position.y - cameraPositionInScene.y);
    
}

@end
