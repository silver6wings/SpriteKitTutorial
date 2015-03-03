
#import <SpriteKit/SpriteKit.h>

typedef NS_OPTIONS(int, CVAction)
{
    CVActionNone = 0,
    CVActionStand,
    CVActionAttack,
};

@interface CVRole : SKSpriteNode

-(id)initWithFrame16x:(NSString *)imageName;

-(void)do:(CVAction)action;

@end
