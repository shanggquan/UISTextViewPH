//
//  ViewController.m
//  TextViewDemo
//
//  Created by User01 on 2017/5/17.
//  Copyright © 2017年 Spring. All rights reserved.
//

#import "ViewController.h"
#import "UISTextViewPH.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISTextViewPH *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.textView setPlaceholder:@"我是默认文字" PlaceholderTextColor:[UIColor grayColor] RealTextColor:self.textView.textColor];
//    [self.textView setPlaceholder:@"我是默认文字" PlaceholderTextColor:[UIColor grayColor] RealTextColor:[UIColor greenColor]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
