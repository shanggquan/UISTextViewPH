//
//  UISTextView.m
//  TextViewDemo
//
//  Created by User01 on 2017/5/17.
//  Copyright © 2017年 Spring. All rights reserved.
//

#import "UISTextViewPH.h"

@interface UISTextViewPH()<UITextViewDelegate>
@property (nonatomic, retain) UIColor* realTextColor;
@property(nonatomic, retain) NSString * placeholder;
@property(nonatomic, retain) UIColor * placeholderTextColor;
@end

@implementation UISTextViewPH


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewDidBeginEditing) name:UITextViewTextDidBeginEditingNotification object:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewDidChange) name:UITextViewTextDidChangeNotification object:self];
    //self.contentInset = UIEdgeInsetsMake(0.0f, -3.0f, 0.0f, 0.0f);
    self.delegate = self;
}
- (void)setPlaceholder:(NSString *)aPlaceholder PlaceholderTextColor:(UIColor *)placeholderTextColor RealTextColor:(UIColor *)aRealTextColor{
    _placeholder = aPlaceholder;
    _placeholderTextColor = placeholderTextColor;
    _realTextColor = aRealTextColor;
    
    [self setText:aPlaceholder];
    [self setTextColor:placeholderTextColor];
}

- (void)textViewDidBeginEditing{
    [self goTopSelected];
}
- (void)textViewDidChangeSelection:(UITextView *)textView{
    [self goTopSelected];
}

- (void)textViewDidChange{
    if ([self.text isEqualToString:@""]) {
        [self setText:self.placeholder];
        [self setTextColor:[UIColor grayColor]];
    }else{
        [self setTextColor:[UIColor blackColor]];
    }
}

- (void)goTopSelected{
    if ([self.text isEqualToString:self.placeholder]) {
        NSRange range;
        range.location = 0;
        range.length  = 0;
        self.selectedRange = range;
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }else if ([text isEqualToString:@""]){
        return YES;
    }else {
        if ([textView.text isEqualToString:self.placeholder]) {
            [textView setText:@""];
        }
        return YES;
    }
}

@end
