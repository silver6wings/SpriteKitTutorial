//
//  MyScene.m
//  AnimatedBear
//
//  Created by Tony Dahbura on 7/16/13.
//  Copyright (c) 2013 Tony Dahbura. All rights reserved.
//


#import <AVFoundation/AVFoundation.h>
#import "MyScene.h"


@implementation MyScene {
    
    SKSpriteNode *_bear;
    NSArray *_bearWalkingFrames;
    
    
}

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor blackColor];

        //Setup the array to hold the walking frames
        NSMutableArray *walkFrames = [NSMutableArray array];
        
        //Load the TextureAtlas for the bear
        SKTextureAtlas *bearAnimatedAtlas = [SKTextureAtlas atlasNamed:@"BearImages"];
        
        //Load the animation frames from the TextureAtlas
        int numImages = bearAnimatedAtlas.textureNames.count;
        for (int i=1; i <= numImages/2; i++) {
            NSString *textureName = [NSString stringWithFormat:@"bear%d", i];
            SKTexture *temp = [bearAnimatedAtlas textureNamed:textureName];
            [walkFrames addObject:temp];
        }
        _bearWalkingFrames = walkFrames;
        
        //Create bear sprite, setup position in middle of the screen, and add to Scene
        SKTexture *temp = _bearWalkingFrames[0];
        _bear = [SKSpriteNode spriteNodeWithTexture:temp];
        _bear.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        [self addChild:_bear];
        
        //Start the bear walking
        //[self walkingBear];
        
    }
    return self;
}

-(void)walkingBear
{
    //This is our general runAction method to make our bear walk.
    //By using a withKey if this gets called while already running it will remove the first action before
    //starting this again.
    
    [_bear runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:_bearWalkingFrames
                                                                    timePerFrame:0.1f
                                                                          resize:NO
                                                                         restore:YES]] withKey:@"walkingInPlaceBear"];
    return;
}

/*
//touches ended handler for part 1
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    CGPoint location = [[touches anyObject] locationInNode:self];
    CGFloat multiplierForDirection;
    
    if (location.x <= CGRectGetMidX(self.frame)) {
        //walk left
        multiplierForDirection = 1;
    } else {
        //walk right
        multiplierForDirection = -1;
    }
    
    _bear.xScale = fabs(_bear.xScale) * multiplierForDirection;
    
    [self walkingBear];
    
}
*/

//touches ended handler for part 2
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    CGPoint location = [[touches anyObject] locationInNode:self];
    CGFloat multiplierForDirection;
    
    CGSize screenSize = self.frame.size;
    
    float bearVelocity = screenSize.width / 3.0;
    
    //x and y distances for move
    CGPoint moveDifference = CGPointMake(location.x - _bear.position.x, location.y - _bear.position.y);
    float distanceToMove = sqrtf(moveDifference.x * moveDifference.x + moveDifference.y * moveDifference.y);
    
    float moveDuration = distanceToMove / bearVelocity;
    
    if (moveDifference.x < 0) {
        multiplierForDirection = 1;
    } else {
        multiplierForDirection = -1;
    }
    _bear.xScale = fabs(_bear.xScale) * multiplierForDirection;
    
    if ([_bear actionForKey:@"bearMoving"]) {
        //stop just the moving to a new location, but leave the walking legs movement running
        [_bear removeActionForKey:@"bearMoving"];
    }
    
    if (![_bear actionForKey:@"walkingInPlaceBear"]) {
        //if legs are not moving go ahead and start them
        [self walkingBear];  //start the bear walking
    }
    
    SKAction *moveAction = [SKAction moveTo:location duration:moveDuration];
    SKAction *doneAction = [SKAction runBlock:(dispatch_block_t)^() {
        NSLog(@"Animation Completed");
        [self bearMoveEnded];
    }];
    
    SKAction *moveActionWithDone = [SKAction sequence:@[moveAction,doneAction ]];
    
    [_bear runAction:moveActionWithDone withKey:@"bearMoving"];
}


-(void)bearMoveEnded
{
    [_bear removeAllActions];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}


@end
