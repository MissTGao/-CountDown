//
//  ViewController.m
//  yuan
//
//  Created by manman'swork on 17/2/4.
//  Copyright © 2017年 manman'swork. All rights reserved.
//

#import "ViewController.h"
#import "CircleProgressView.h"



#import "UAProgressView.h"


@interface ViewController ()

@property (nonatomic, strong) CircleProgressView * circleProgressView;

@property (nonatomic, strong) UIView *centralView;



@property (nonatomic, strong) UAProgressView *progressView;
@property (nonatomic, assign) CGFloat localProgress;



@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
   self.progressView =[[UAProgressView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:self.progressView];

    [self setupProgressView1];
    
    
    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(updateProgress:) userInfo:nil repeats:YES];

    
}
- (void)setupProgressView1 {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeInfoDark];
    [button setFrame:CGRectMake(0, 0, 32, 32)];
    [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
//    self.progressView.fillOnTouch = NO;
    self.progressView.centralView = button;
    self.progressView.tintColor = [UIColor redColor];

    
    self.progressView.fillChangedBlock = ^(UAProgressView *progressView, BOOL filled, BOOL animated){
        UIColor *color = (filled ? [UIColor whiteColor] : [UIColor redColor]);
        if (animated) {
            [UIView animateWithDuration:0.3 animations:^{
                progressView.centralView.backgroundColor = color;
            }];
        } else {
            progressView.centralView.backgroundColor = color;
        }
    };
    
}

- (void)buttonTapped:(id)sender {
    NSLog(@"Button tapped");
}

- (void)updateProgress:(NSTimer *)timer {
    _localProgress = ((int)((_localProgress * 100.0f) + 1.01) % 100) / 100.0f;
    
    [self.progressView setProgress:_localProgress];

    //	[self.progressView6 setProgress:_localProgress]; // 6 is done on tap
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
