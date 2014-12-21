//
//  GameScene.m
//  PixieCatcha
//
//  Created by silver6wings on 14-11-18.
//  Copyright (c) 2014年 silver6wings. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

SKSpriteNode * bee;

-(void)didMoveToView:(SKView *)view {
    
    self.physicsWorld.gravity = CGVectorMake(0, -20);
    self.physicsWorld.contactDelegate = self;
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    
    
    bee = [[SKSpriteNode alloc] initWithImageNamed:@"bee0.png"];
    bee.anchorPoint = CGPointMake(0.5, 0.5);
    bee.size = CGSizeMake(100, 75);
    bee.position = CGPointMake(CGRectGetMidX(self.frame),
                                   CGRectGetMidY(self.frame));
    bee.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:bee.frame.size];
    
    [self addChild:bee];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    if (bee.frame.origin.y < 20) {
        [bee.physicsBody applyImpulse:CGVectorMake(0, 300)];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
