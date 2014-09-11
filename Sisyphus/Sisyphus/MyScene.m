//
//  MyScene.m
//  Sisyphus
//
//  Created by silver6wings on 14-8-23.
//  Copyright (c) 2014年 silver6wings. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

SKSpriteNode * ball;
SKSpriteNode * mountain;

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        self.backgroundColor = [SKColor whiteColor];
        self.physicsWorld.gravity = CGVectorMake(0, -5);
        self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
        
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, NULL, 0, 100);
        CGPathAddLineToPoint(path, NULL, 100, 0);
        CGPathAddLineToPoint(path, NULL, 0, 0);
        CGPathCloseSubpath(path);
        
        mountain = [SKSpriteNode spriteNodeWithColor:[SKColor redColor] size:CGSizeMake(100, 100)];
        mountain.position = CGPointMake(20, 0);
        mountain.physicsBody = [SKPhysicsBody bodyWithPolygonFromPath:path];
        mountain.physicsBody.dynamic = NO;
        [self addChild:mountain];
        
        ball = [SKSpriteNode spriteNodeWithColor:[SKColor blueColor] size:CGSizeMake(50, 50)];
        ball.position = CGPointMake(50, 400);
        ball.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:30.0f];
//        ball.physicsBody.friction = 0;
        ball.physicsBody.linearDamping = 0;
        ball.physicsBody.affectedByGravity = NO;
        [self addChild:ball];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [ball.physicsBody applyForce:CGVectorMake(0, 500)];
//    ball.physicsBody.velocity = CGVectorMake(0, 500);
}

-(void)update:(CFTimeInterval)currentTime {
    
}

@end
