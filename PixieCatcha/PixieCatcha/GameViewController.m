//
//  GameViewController.m
//  PixieCatcha
//
//  Created by silver6wings on 14-11-18.
//  Copyright (c) 2014年 silver6wings. All rights reserved.
//

#import "GameViewController.h"
#import "GameScene.h"

@implementation SKScene (Unarchive)

+ (instancetype)unarchiveFromFile:(NSString *)file {
    
    /* Retrieve scene file path from the application bundle */
    NSString * nodePath = [[NSBundle mainBundle] pathForResource:file ofType:@"sks"];
    
    /* Unarchive the file to an SKScene object */
    NSData * data = [NSData dataWithContentsOfFile:nodePath
                                          options:NSDataReadingMappedIfSafe
                                            error:nil];
    
    NSKeyedUnarchiver * arch = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    [arch setClass:self forClassName:@"SKScene"];
    
    SKScene * scene = [arch decodeObjectForKey:NSKeyedArchiveRootObjectKey];
    [arch finishDecoding];
    
    return scene;
}
@end

@implementation GameViewController

//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//
//    // Configure the view.
//    NSLog(@"aaa");
//    
//    SKView * skView = (SKView *)self.view;
//    skView.showsFPS = YES;
//    skView.showsNodeCount = YES;
//    
//    NSLog(@"bbb");
//    /* Sprite Kit applies additional optimizations to improve rendering performance */
//    skView.ignoresSiblingOrder = YES;
//    
//    // Create and configure the scene.
//    GameScene *scene = [GameScene unarchiveFromFile:@"GameScene"];
//    scene.scaleMode = SKSceneScaleModeAspectFill;
//    
//    // Present the scene.
//    [skView presentScene:scene];
//}

-(void)loadView
{
    [super loadView];
    SKView * skView = [[SKView alloc] initWithFrame:self.view.bounds];
    self.view = skView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    skView.showsDrawCount = YES;
    skView.showsPhysics = YES;
    
    if(!skView.scene){
        GameScene * testScene = [[GameScene alloc] initWithSize:skView.bounds.size];
        testScene.scaleMode = SKSceneScaleModeAspectFill;
        
        [skView presentScene:testScene];
    }
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
