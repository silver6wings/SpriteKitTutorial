#import "CSBody.h"

@implementation CSBody
@synthesize num, x, y, next;

+(CSBody *)bodyWithNum:(int)tNum X:(int)tx Y:(int)ty
{
    CSBody * tBody = [[CSBody alloc] init];
    tBody.num = tNum;
    tBody.x = tx;
    tBody.y = ty;
    return tBody;
}

@end
