//
//  ViewController.m
//  gravityDynamic
//
//  Created by 李超 on 16/4/9.
//  Copyright © 2016年 李超. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong,nonatomic) NSMutableArray<UIDynamicAnimator *> *animations;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.animations = [[NSMutableArray alloc] init];
    
    UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width*0.5-100, [UIScreen mainScreen].bounds.size.height-100, 100, 100)];
    
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width*0.5, [UIScreen mainScreen].bounds.size.height*0.5-100, 100, 100)];
    
    redView.transform = CGAffineTransformMakeRotation(M_PI_4*0.5);
    
    redView.backgroundColor = [UIColor redColor];
    
    blueView.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:redView];
    
    [self.view addSubview:blueView];
    
    [self addGravityAnimator:@[redView,blueView]];
    
    
}

- (void)addGravityAnimator:(NSArray *)animationViews
{
    
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:animationViews];
    
    [animator addBehavior:gravity];
    
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:animationViews];
    
    collision.translatesReferenceBoundsIntoBoundary = YES;
    
    [animator addBehavior:collision];
    
    [self.animations addObject:animator];
}

- (void)addCollisionAnimator:(UIView *)view
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
