
#import "TestScene.h"

static const uint32_t testCategory1 = 0x1 << 0;
static const uint32_t testCategory2 = 0x1 << 1;
static const uint32_t testCategory3 = 0x1 << 2;

@implementation TestScene

SKSpriteNode * node1, * node2;
SKEmitterNode * testEmitter;

-(id)initWithSize:(CGSize)size{
    if (self = [super initWithSize:size])
    {
        self.backgroundColor = [UIColor blueColor];
        SKTexture * all = [SKTexture textureWithImageNamed:@"test.png"];
        SKTexture * texture = [SKTexture textureWithRect:CGRectMake(0, 0.75, 0.25, 0.25) inTexture:all];
        
        SKSpriteNode * node = [SKSpriteNode spriteNodeWithTexture:texture];
        node.size = CGSizeMake(100, 100);
        node.position = CGPointMake(100, 100);
        [self addChild:node];
        
        NSLog(@"12345");
    }
    return self;
}

-(void)didBeginContact:(SKPhysicsContact *)contact{
    NSLog(@"Contact");
    if ((contact.bodyA.categoryBitMask == testCategory1 && contact.bodyB.categoryBitMask == testCategory2) ||
        (contact.bodyB.categoryBitMask == testCategory1 && contact.bodyA.categoryBitMask == testCategory2) ) {
        NSLog(@"Contact A B");
//        [node2 removeFromParent];
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [node1.physicsBody applyForce:CGVectorMake(500, 1000)];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    /* 停止燃烧
     //testEmitter.particleLifetime = 0;
     testEmitter.particleBirthRate = 0;
     */
    
}

-(void)didMoveToView:(SKView *)view{
    
    /* 测试NodeTree
     */

    
    /* 测试PhysicsJoint
     self.physicsWorld.gravity = CGVectorMake(0, 0);
     self.physicsWorld.contactDelegate = self;
     self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
     
     
     node1 = [SKSpriteNode spriteNodeWithColor:[SKColor redColor] size:CGSizeMake(50, 50)];
     node1.position = CGPointMake(160, 100);
     node1.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:20];
     node1.physicsBody.categoryBitMask = testCategory1;
     node1.physicsBody.collisionBitMask = testCategory2;
     node1.physicsBody.contactTestBitMask = testCategory2;
     [self addChild:node1];
     
     node2 = [SKSpriteNode spriteNodeWithColor:[SKColor blueColor] size:CGSizeMake(50, 50)];
     node2.position = CGPointMake(160, 200);
     node2.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(40, 40)];
     node2.physicsBody.dynamic = YES;
     node2.physicsBody.categoryBitMask = testCategory2;
     node2.physicsBody.collisionBitMask = testCategory1;
     node2.physicsBody.contactTestBitMask = testCategory1;
     [self addChild:node2];
     
     SKPhysicsJoint * testJoint = [SKPhysicsJointLimit jointWithBodyA:node1.physicsBody
     bodyB:node2.physicsBody
     anchorA:CGPointMake(160, 100)
     anchorB:CGPointMake(160, 200)];
     
     [self.physicsWorld addJoint:testJoint];
     */
    
    
    /* textureAtlas样例代码
     NSMutableArray * testFrames = [NSMutableArray array];
     
     SKTextureAtlas * testAtlas = [SKTextureAtlas atlasNamed:@"FireFrames"];
     [testAtlas preloadWithCompletionHandler:^{
     NSLog(@"load completed");
     }];
     
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
     */
    
    /* 测试plist
     NSString * path = [[NSBundle mainBundle] pathForResource:@"TextureNames" ofType:@"plist"];
     NSDictionary * dict = [[NSDictionary alloc] initWithContentsOfFile:path];
     NSLog(@"%@", dict);
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
    
    /* 遮罩层效果CropNode
     SKSpriteNode * maskNode = [SKSpriteNode spriteNodeWithImageNamed:@"testMask.png"];
     maskNode.size = CGSizeMake(100, 100);
     SKSpriteNode * backNode = [SKSpriteNode spriteNodeWithImageNamed:@"testCrop.jpg"];
     backNode.size = CGSizeMake(300, 200);
     SKCropNode * cropNode = [[SKCropNode alloc] init];
     cropNode.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
     cropNode.maskNode = maskNode;
     [cropNode addChild:backNode];
     [self addChild:cropNode];
     */
    
    /*
     // 测试SpriteNode Child
     testNode = [[SKSpriteNode alloc] initWithImageNamed:@"Spaceship.png"];
     testNode.size = CGSizeMake(100, 100);
     testNode.position = CGPointMake(100, 200);
     testNode.name = @"spaceship";
     testNode.color = [SKColor redColor];//[SKColor colorWithRed:0.5f green:0.5f blue:0.5 alpha:1.0f];
     //testNode.colorBlendFactor = 0.9f;
     //testNode.blendMode = SKBlendModeAdd;
     //testNode.anchorPoint = CGPointMake(0.5, 0.5);
     //[testNode runAction:[SKAction rotateByAngle:3.14159f duration:0.0f]];
     [self addChild:testNode];
     
     SKSpriteNode * testChild = [SKSpriteNode spriteNodeWithImageNamed:@"Missile.png"];
     testChild.position = CGPointMake(25, 0);
     testChild.size = CGSizeMake(10, 40);
     testChild.name = @"Missile";
     [testNode addChild:testChild];
     */
}


-(void)update:(NSTimeInterval)currentTime{
    //NSLog(@"update start");
}


-(void)didEvaluateActions{
    //NSLog(@"did Action");
}

-(void)didSimulatePhysics{
    //NSLog(@"did Physics");
}



@end
