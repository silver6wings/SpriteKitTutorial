
#import "TestScene.h"

@implementation TestScene

SKSpriteNode * testNode;
SKEmitterNode * testEmitter;

-(id)initWithSize:(CGSize)size{
    if (self = [super initWithSize:size]) {
        
        /* 测试SpriteNode */
        testNode = [[SKSpriteNode alloc] initWithImageNamed:@"Spaceship.png"];
        testNode.size = CGSizeMake(100, 100);
        testNode.position = CGPointMake(100, 200);
        testNode.name = @"spaceship";
        testNode.color = [SKColor colorWithRed:0.5f green:0.5f blue:0.5 alpha:1.0f];
        testNode.colorBlendFactor = 0.9f;
        [self addChild:testNode];

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
