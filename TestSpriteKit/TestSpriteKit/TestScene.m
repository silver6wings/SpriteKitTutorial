
#import "TestScene.h"

@implementation TestScene

SKSpriteNode * testNode;
SKEmitterNode * testEmitter;

-(id)initWithSize:(CGSize)size{
    if (self = [super initWithSize:size]) {
        
        
        NSMutableArray *testFrames = [NSMutableArray array];
        
        SKTextureAtlas *testAtlas = [SKTextureAtlas atlasNamed:@"FireFrames"];
        
        for (int i=0; i < testAtlas.textureNames.count; i++) {
            NSString *textureName = [NSString stringWithFormat:@"IMG%05d", i];
            NSLog(@"%@",textureName);
            SKTexture *temp = [testAtlas textureNamed:textureName];
            [testFrames addObject:temp];
        }
        
        SKTexture *temp = testFrames[0];
        
        SKSpriteNode * testSprite = [SKSpriteNode spriteNodeWithTexture:temp];
        testSprite.size = CGSizeMake(300, 300);
        testSprite.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        [self addChild:testSprite];
        
        [testSprite runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:testFrames timePerFrame:0.04]]];
        
        /*
        SKTextureAtlas * testTextureAtlas = [SKTextureAtlas atlasNamed:@"fire.atlas"];
        SKTexture * testTexture1 = [testTextureAtlas textureNamed:@"IMG00000"];
        
        // 测试SpriteNode
        testNode = [[SKSpriteNode alloc] initWithTexture:testTexture1];
        testNode.size = CGSizeMake(100, 100);
        testNode.position = CGPointMake(100, 200);
        //testNode.name = @"spaceship";
        //testNode.color = [SKColor redColor];//[SKColor colorWithRed:0.5f green:0.5f blue:0.5 alpha:1.0f];
        //testNode.colorBlendFactor = 0.9f;
        //testNode.blendMode = SKBlendModeAdd;
        [self addChild:testNode];
        */
         
        /* 文字Node
        SKLabelNode *testLabel = [SKLabelNode labelNodeWithFontNamed:@"Arial"];
        testLabel.text = @"Hello, World!";
        testLabel.fontSize = 30;
        testLabel.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        [self addChild:testLabel];
         */
        
        /* 播放视频
        SKVideoNode * videoNode = [[SKVideoNode alloc] initWithVideoFileNamed:@"testVideo.mp4"];
        videoNode.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        [self addChild:videoNode];
        [videoNode play];
         */
        
        /* 粒子发射器
        NSString * smokePath = [[NSBundle mainBundle] pathForResource:@"TestSpark" ofType:@"sks"];
        testEmitter = [NSKeyedUnarchiver unarchiveObjectWithFile:smokePath];
        testEmitter.position = CGPointMake(100, 100);
        testEmitter.targetNode = self;
        [self addChild:testEmitter];
         */

        /* 遮罩层效果
        SKSpriteNode * maskNode = [[SKSpriteNode alloc] initWithImageNamed:@"testMask.png"];
        maskNode.size = CGSizeMake(100, 100);
        SKSpriteNode * backNode = [[SKSpriteNode alloc] initWithImageNamed:@"testCrop.jpg"];
        backNode.size = CGSizeMake(300, 200);
        SKCropNode * cropNode = [[SKCropNode alloc] init];
        cropNode.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        cropNode.maskNode = maskNode;
        [cropNode addChild:backNode];
        [self addChild:cropNode];
         */
        
    }
    return self;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    /* 停止燃烧
    testEmitter.particleLifetime = 0;
     */
}

@end
