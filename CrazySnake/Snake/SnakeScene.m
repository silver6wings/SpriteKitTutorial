//
//  MyScene.m
//  CrazySnake
//
//  Created by silver6wings on 14-4-11.
//  Copyright (c) 2014年 silver6wings. All rights reserved.
//

#import "SnakeScene.h"

#define CS_BOTTOM 5
#define CS_LEFT 5

#define CS_WIDTH 320
#define CS_HEIGHT 480
#define CS_SIZE 10
#define CS_MAX_X (CS_WIDTH/CS_SIZE)
#define CS_MAX_Y (CS_HEIGHT/CS_SIZE)

static const int CSDx[4] = {0, 1, 0, -1};
static const int CSDy[4] = {-1, 0, 1, 0};

static inline CGPoint xy2point(int i, int j)
{
    return CGPointMake(CS_LEFT + j * CS_SIZE, CS_HEIGHT - ( CS_BOTTOM + i*CS_SIZE ));
}

typedef enum : NSUInteger {
    CSDirectionUp = 0,
    CSDirectionRight = 1,
    CSDirectionDown = 2,
    CSDirectionLeft = 3
} CSDirection;


typedef enum : NSUInteger {
    CSContentSpace = 0,
    CSContentApple = -1
} CSContent;

@interface SnakeScene()
@property (nonatomic, assign) int snakeHeadX;
@property (nonatomic, assign) int snakeHeadY;
@property (nonatomic, assign) int snakeTailX;
@property (nonatomic, assign) int snakeTailY;
@property (nonatomic, assign) int snakeLength;
@property (nonatomic) CSDirection snakeDirection;

@property (nonatomic, assign) BOOL moving;
@property (nonatomic, assign) float interval;
@property (nonatomic, assign) float prevMouseX;
@property (nonatomic, assign) float prevMouseY;
@property (nonatomic) NSTimeInterval prevTime;
@property (nonatomic) SKLabelNode * myLabel;
@end

@implementation SnakeScene
{
    int map[CS_MAX_Y][CS_MAX_X];
    SKSpriteNode * graph[CS_MAX_Y][CS_MAX_X];
}

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        _myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        _myLabel.text = @"stop";
        _myLabel.fontSize = 30;
        _myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        [self addChild:_myLabel];
        
        
        // 初始化地图
        for (int i = 0; i < CS_MAX_Y; i++) {
            for (int j = 0; j < CS_MAX_X; j++) {
                map[i][j] = CSContentSpace;
                graph[i][j] = [SKSpriteNode spriteNodeWithColor:[UIColor clearColor] size:CGSizeMake(CS_SIZE-2, CS_SIZE-2)];
                graph[i][j].position = xy2point(i, j);
                [self addChild:graph[i][j]];
            }
        }
        
        // 初始化蛇
        _interval = 0.05f;
        _moving = NO; // 是否移动
        _snakeDirection = CSDirectionDown; // 开始向右
        _snakeLength = 6;
        
        for (int i = 0; i < _snakeLength; i++) {
            map[0][i] = _snakeLength - i;
        }
        
        _snakeHeadX = _snakeLength - 1;
        _snakeHeadY = 0;
        _snakeTailX = 0;
        _snakeTailY = 0;
        
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
    
    // 获取鼠标坐标
    UITouch * touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    NSLog(@"x:%f y:%f", location.x, location.y);
    
    // 判断鼠标动作
    if (fabsf(location.x - _prevMouseX) > fabsf(location.y - _prevMouseY)) {
        if (location.x > _prevMouseX) {
            _myLabel.text = @"right";
            if(_snakeDirection != CSDirectionLeft) _snakeDirection = CSDirectionRight;
        } else if (location.x < _prevMouseX){
            _myLabel.text = @"left";
            if(_snakeDirection != CSDirectionRight) _snakeDirection = CSDirectionLeft;
        }
    } else {
        if (location.y > _prevMouseY) {
            _myLabel.text = @"up";
            if(_snakeDirection != CSDirectionDown) _snakeDirection = CSDirectionUp;
        } else if (location.y < _prevMouseY){
            _myLabel.text = @"down";
            if(_snakeDirection != CSDirectionUp) _snakeDirection = CSDirectionDown;
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
    for (int i = 0; i < CS_MAX_Y; i++) {
        for (int j = 0; j < CS_MAX_X; j++) {
            
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
    _snakeHeadX += CSDx[_snakeDirection];
    _snakeHeadY += CSDy[_snakeDirection];
    
    if (_snakeHeadX >= CS_MAX_X || _snakeHeadX < 0 ||
        _snakeHeadY >= CS_MAX_Y || _snakeHeadY < 0) {
        NSLog(@"Dead to wall");
        _moving = false;
        return;
    }
    
    
    if(map[_snakeHeadY][_snakeHeadX] > 0){
        NSLog(@"Dead to self");
        _moving = false;
        return;
    }
    
    for (int i = 0; i < CS_MAX_Y; i++) {
        for (int j = 0; j < CS_MAX_X; j++) {
            if (map[i][j] > 0) map[i][j]++;
        }
    }
 
    map[_snakeHeadY][_snakeHeadX] = 1;
    map[_snakeTailY][_snakeTailX] = CSContentSpace;
    
    for (int i = 0; i < 4; i++) {
        if(map[_snakeTailY+CSDy[i]][_snakeTailX+CSDx[i]] == _snakeLength){
            _snakeTailX += CSDx[i];
            _snakeTailY += CSDy[i];
        }
    }
}

-(void)outputMap
{
    for (int i = 0; i < CS_MAX_Y; i++) {
        for (int j = 0; j < CS_MAX_X; j++) {
            printf("%d", map[i][j]);
        }
        printf("\n");
    }
    printf("-------------\n");

}

@end
