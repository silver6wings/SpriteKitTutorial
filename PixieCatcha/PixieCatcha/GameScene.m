//
//  GameScene.m
//  PixieCatcha
//
//  Created by silver6wings on 14-11-18.
//  Copyright (c) 2014年 silver6wings. All rights reserved.
//

#import "GameScene.h"
#import "CVRole.h"

@implementation GameScene

CVRole * bee;

-(void)didMoveToView:(SKView *)view {
    
    self.physicsWorld.gravity = CGVectorMake(0, -5);
    self.physicsWorld.contactDelegate = self;
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    
    self.backgroundColor = [UIColor whiteColor];
    
    bee = [[CVRole alloc] initWithFrame16x:@"role1.png"];
    bee.anchorPoint = CGPointMake(0.5, 0.5);
    bee.size = CGSizeMake(60, 60);
    bee.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    
    bee.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:bee.frame.size];
    bee.physicsBody.allowsRotation = NO;
    bee.physicsBody.restitution = -1.0;
    [self addChild:bee];
    
//    SKNode * ground = [[SKNode alloc] init];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    if (bee.frame.origin.y < 20) {
        bee.physicsBody.velocity = CGVectorMake(0, 400);
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
