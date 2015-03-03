
#import "CVRole.h"

@implementation CVRole

SKTexture * textureFrame;

-(id)initWithFrame16x:(NSString *)imageName
{
    if (self = [super init]) {
        textureFrame = [SKTexture textureWithImageNamed:imageName];
        [self do:CVActionStand];
    }
    return self;
}

-(void)do:(CVAction)action
{
    
    switch(action)
    {
        case CVActionStand:
            [self runAction:[SKAction repeatActionForever:[self getAnimation:0.5]]];
            break;
        case CVActionAttack:
            
            break;
            
        default:
            break;
    }
}

-(SKAction *)getAnimation:(CGFloat)baseY
{
    NSMutableArray * textureArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 4; i++)
    {
        SKTexture * texture = [SKTexture textureWithRect:CGRectMake(0.25*i, baseY, 0.25, 0.25) inTexture:textureFrame];
        [textureArray addObject:texture];
    }
    return [SKAction animateWithTextures:textureArray timePerFrame:0.1];
}

@end
