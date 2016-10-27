//
//  ViewController.m
//  活动指示器
//
//  Created by liuxingchen on 16/10/27.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *lightView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CAReplicatorLayer *rep = [CAReplicatorLayer layer];
    rep.frame = self.lightView.bounds;
    [self.lightView.layer addSublayer:rep];
    
    CALayer *layer = [CALayer layer];
    layer.transform = CATransform3DMakeScale(0, 0, 0);
    layer.position = CGPointMake(self.lightView.bounds.size.width /2, 10);
    layer.bounds = CGRectMake(0, 0, 10, 10);
    layer.backgroundColor = [UIColor orangeColor].CGColor;
    [rep addSublayer:layer];
    
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"transform.scale";
    //所改变属性的结束时的值
    anim.fromValue = @1;
    anim.toValue = @0;
    anim.repeatCount = MAXFLOAT;
    CGFloat duration = 1;
    anim.duration = duration;
    [layer addAnimation:anim forKey:nil];
    
    int count = 30;
    CGFloat angle = M_PI *2 /count;
    rep.instanceCount = count;
    rep.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1);
    rep.instanceDelay = duration / count;
}
@end
