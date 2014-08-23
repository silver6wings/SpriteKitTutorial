#import <Foundation/Foundation.h>

@interface CSBody : NSObject
{
    int num;
    int x;
    int y;
    CSBody * next;
}

@property (nonatomic, assign) int num;
@property (nonatomic, assign) int x;
@property (nonatomic, assign) int y;
@property (nonatomic) CSBody * next;

+(CSBody *)bodyWithNum:(int)num X:(int)tx Y:(int)ty;

@end
