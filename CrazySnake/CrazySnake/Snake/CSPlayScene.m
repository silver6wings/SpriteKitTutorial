//
//  MyScene.m
//  CrazySnake
//
//  Created by silver6wings on 14-4-11.
//  Copyright (c) 2014年 silver6wings. All rights reserved.
//

#import "CSPlayScene.h"
#import "CSBody.h"

#define CS_BOTTOM 5
#define CS_LEFT 5

#define CS_WIDTH 320
#define CS_HEIGHT 480
#define CS_SIZE 10
#define CS_MAX_X (CS_WIDTH/CS_SIZE)
#define CS_MAX_Y (CS_HEIGHT/CS_SIZE)

#define CS_SAMPLING_RATE 200            // 采样率
#define CS_SAMPLING_LINEAR_LIMIT 5.0f   // 直线灵敏度
#define CS_SAMPLING_ANGLE_LIMIT 20.f    // 角度灵敏度

static const int CSDx[4] = {0, 1, 0, -1};
static const int CSDy[4] = {-1, 0, 1, 0};

static inline CGPoint xy2point(int i, int j)
{
    return CGPointMake(CS_LEFT + (j-1) * CS_SIZE, CS_HEIGHT - ( CS_BOTTOM + (i-1) * CS_SIZE ));
}

typedef enum : NSUInteger {
    CSDirectionUp = 0,
    CSDirectionRight = 1,
    CSDirectionDown = 2,
    CSDirectionLeft = 3
} CSDirection;


typedef enum : NSUInteger {
    CSContentSpace = 0,
    CSContentWalls = -1,
    CSContentApple = -2
} CSContent;

@interface CSPlayScene()

@property (nonatomic, assign) float interval;
@property (nonatomic, assign) int samplingCount;

@property (nonatomic, assign) int snakeLength;
@property (nonatomic) CSBody * snakeHead;
@property (nonatomic) CSBody * snakeTail;

@property (nonatomic) CSDirection snakeCurrentDirection;
@property (nonatomic) CSDirection snakeTowardsDirection;

@property (nonatomic, assign) BOOL moving;
@property (nonatomic, assign) float prevMouseX;
@property (nonatomic, assign) float prevMouseY;
@property (nonatomic) NSTimeInterval prevTime;
@property (nonatomic) SKLabelNode * myLabel;
@end

@implementation CSPlayScene
{
    CSContent map[CS_MAX_Y + 2][CS_MAX_X + 2];
    SKSpriteNode * graph[CS_MAX_Y + 1][CS_MAX_X + 1];
}

-(id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        _myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        _myLabel.text = @"stop";
        _myLabel.fontSize = 30;
        _myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                        CGRectGetMidY(self.frame));
        [self addChild:_myLabel];
        
        // 初始化参数
        _interval = 0.07f;
        _samplingCount = CS_SAMPLING_RATE;
        
        // 初始化地图
        for (int i = 0; i <= CS_MAX_Y + 1; i++)
            for (int j = 0; j <= CS_MAX_X + 1; j++)
                map[i][j] = CSContentWalls;
        
        for (int i = 1; i <= CS_MAX_Y; i++) {
            for (int j = 1; j <= CS_MAX_X; j++) {
                map[i][j] = CSContentSpace;
                graph[i][j] = [SKSpriteNode spriteNodeWithColor:[UIColor clearColor] size:CGSizeMake(CS_SIZE-2, CS_SIZE-2)];
                graph[i][j].position = xy2point(i, j);
                [self addChild:graph[i][j]];
            }
        }
        
        // 初始化蛇
        _moving = NO; // 是否移动
        _snakeCurrentDirection = CSDirectionRight; // 开始向右
        _snakeTowardsDirection = CSDirectionRight; // 开始向右
        
        // 创建蛇
        _snakeLength = 2;
        _snakeHead = [CSBody bodyWithNum:1 X:2 Y:1];
        _snakeTail = [CSBody bodyWithNum:2 X:1 Y:1];
        _snakeHead.next = _snakeTail;
        
        CSBody * tBody = _snakeHead;
        while (tBody != nil) {
            map[tBody.y][tBody.x] = tBody.num;
            tBody = tBody.next;
        }
        
        [self outputMap];
        [self refreshScreen];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (touches.count > 1) return;
    _myLabel.text = @"start";
    _moving = YES;
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (touches.count > 1) return;
    
    // 判断采样度
    _samplingCount = (_samplingCount++) % CS_SAMPLING_RATE;
    if (_samplingCount != 0) return;
    
    // 获取鼠标坐标
    UITouch * touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    
    float dx = fabsf(location.x - _prevMouseX);
    float dy = fabsf(location.y - _prevMouseY);
    //NSLog(@"x:%f y:%f", location.x - _prevMouseX, location.y - _prevMouseY);
    
    // 判断鼠标动作
    if (fabs(dx-dy) > 2.0f) {
        if (dx > dy || dx > CS_SAMPLING_LINEAR_LIMIT) {
            if (location.x > _prevMouseX) {
                _myLabel.text = @"right";
                if(_snakeCurrentDirection != CSDirectionLeft) _snakeTowardsDirection = CSDirectionRight;
            } else if (location.x < _prevMouseX){
                _myLabel.text = @"left";
                if(_snakeCurrentDirection != CSDirectionRight) _snakeTowardsDirection = CSDirectionLeft;
            }
        } else if (dy > dx || dy > CS_SAMPLING_LINEAR_LIMIT) {
            if (location.y > _prevMouseY) {
                _myLabel.text = @"up";
                if(_snakeCurrentDirection != CSDirectionDown) _snakeTowardsDirection = CSDirectionUp;
            } else if (location.y < _prevMouseY) {
                _myLabel.text = @"down";
                if(_snakeCurrentDirection != CSDirectionUp) _snakeTowardsDirection = CSDirectionDown;
            }
        }
    }
    
    _prevMouseX = location.x;
    _prevMouseY = location.y;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (touches.count > 1) return;
    _myLabel.text = @"stop";
    _moving = NO;
}

-(void)update:(CFTimeInterval)currentTime
{
    if (!_moving) return;
    
    CFTimeInterval timeSinceLast = currentTime - _prevTime;
    if (timeSinceLast > _interval) {
        _prevTime = currentTime;
        [self snakeGo];
        [self refreshScreen];
    }
}

#pragma Custom

-(void)refreshScreen
{
    for (int i = 0; i <= CS_MAX_Y; i++) {
        for (int j = 0; j <= CS_MAX_X; j++) {
            
            if (map[i][j] > 0) {
                graph[i][j].color = [UIColor brownColor];
            } else {
                switch (map[i][j]) {
                    case CSContentSpace:
                        graph[i][j].color = [UIColor clearColor];
                        break;
                    case CSContentApple:
                        break;
                    default:
                        break;
                }
            }
        }
    }
    
}

-(void)snakeGo
{
    int nextX = _snakeHead.x + CSDx[_snakeTowardsDirection];
    int nextY = _snakeHead.y + CSDy[_snakeTowardsDirection];
    
    _snakeCurrentDirection = _snakeTowardsDirection;

    if(map[nextY][nextX] > 0) {
        NSLog(@"Crash self body");
        _moving = false;
        return;
    }
    
    if (map[nextY][nextX] == CSContentWalls) {
        NSLog(@"Crash the wall");
        _moving = false;
        return;
    }
    
    if (map[nextY][nextX] == CSContentSpace) {
        
    }
 
}

-(void)outputMap
{
    for (int i = 0; i < CS_MAX_Y; i++) {
        for (int j = 0; j < CS_MAX_X; j++) {
            printf("%3d", map[i][j]);
        }
        printf("\n");
    }
    printf("-------------\n");
}

@end
