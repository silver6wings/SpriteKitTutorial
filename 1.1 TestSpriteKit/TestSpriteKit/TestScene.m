//
//  TestScene.m
//  TestSpriteKit
//
//  Created by silver6wings on 14-8-19.
//  Copyright (c) 2014年 silver6wings. All rights reserved.
//

#import "TestScene.h"

@interface TestScene()
@property (nonatomic) SKSpriteNode * testNode;
@property (nonatomic) SKEmitterNode * testEmitter;
@end

@implementation TestScene

-(id)initWithSize:(CGSize)size{
    if (self = [super initWithSize:size]) {
        
//        _testNode = [[SKSpriteNode alloc] initWithImageNamed:@"Spaceship.png"];
//        _testNode.size = CGSizeMake(50, 50);
//        _testNode.position = CGPointMake(100, 200);
//        _testNode.name = @"spaceship";
//        [self addChild:_testNode];
        
//        SKVideoNode * videoNode = [[SKVideoNode alloc] initWithVideoFileNamed:@"testVideo.mp4"];
//        videoNode.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
//        [self addChild:videoNode];
//        [videoNode play];
        
//        NSString * smokePath = [[NSBundle mainBundle] pathForResource:@"TestSpark" ofType:@"sks"];
//        _testEmitter = [NSKeyedUnarchiver unarchiveObjectWithFile:smokePath];
//        _testEmitter.position = CGPointMake(100, 100);
//        _testEmitter.targetNode = self;
//        [self addChild:_testEmitter];

        SKSpriteNode * maskNode = [[SKSpriteNode alloc] initWithImageNamed:@"testMask.png"];
        maskNode.size = CGSizeMake(100, 100);
        
        
        SKSpriteNode * backNode = [[SKSpriteNode alloc] initWithImageNamed:@"testCrop.jpg"];
        backNode.size = CGSizeMake(300, 200);
        
        SKCropNode * cropNode = [[SKCropNode alloc] init];
        cropNode.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        cropNode.maskNode = maskNode;
        [cropNode addChild:backNode];
        [self addChild:cropNode];
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    _testEmitter.particleLifetime = 0;
//    _testEmitter.particleLifetimeRange = 0;
    
}

@end
