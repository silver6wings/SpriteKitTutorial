//
//  MyScene.m
//  Sisyphus
//
//  Created by silver6wings on 14-8-23.
//  Copyright (c) 2014年 silver6wings. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        self.backgroundColor = [SKColor whiteColor];
        self.physicsWorld.gravity = CGVectorMake(0, -5);
        
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, NULL, 0, 0);
        CGPathAddLineToPoint(path, NULL, 0, 100);
        CGPathAddLineToPoint(path, NULL, 100, 0);
        CGPathCloseSubpath(path);
        
        SKSpriteNode * mountain = [SKSpriteNode spriteNodeWithColor:[SKColor redColor] size:CGSizeMake(100, 100)];
        mountain.position = CGPointMake(0, 0);
        mountain.physicsBody = [SKPhysicsBody bodyWithPolygonFromPath:path];
        mountain.physicsBody.dynamic = NO;
        [self addChild:mountain];
        
        SKSpriteNode * ball = [SKSpriteNode spriteNodeWithColor:[SKColor blueColor] size:CGSizeMake(50, 50)];
        ball.position = CGPointMake(50, 400);
        ball.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:30.0f];
        [self addChild:ball];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
}

-(void)update:(CFTimeInterval)currentTime {
    
}

@end
