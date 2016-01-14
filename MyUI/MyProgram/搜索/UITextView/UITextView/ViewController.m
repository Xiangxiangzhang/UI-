//
//  ViewController.m
//  UITextView
//
//  Created by qingyun on 15/12/5.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _textView.backgroundColor = [UIColor lightGrayColor];
    
    [self configTextView];
    
    //注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardHandle:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardHandle:) name:UIKeyboardWillHideNotification object:nil];
    
}

//键盘处理
- (void) keyBoardHandle:(NSNotification *)notification
{
    //开始rect
    CGRect beginRect = [notification.userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    //结束rect
    CGRect endRect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    CGFloat detalY = endRect.origin.y - beginRect.origin.y;
    
    CGRect textViewFrame = _textView.frame;
    textViewFrame.size.height += detalY;
    
    
    //键盘动画事件间隔
    CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey]floatValue];
    [UIView animateWithDuration:duration animations:^{
        _textView.frame = textViewFrame;
    }];
}


- (void)configTextView
{
    //黑体
    NSRange boldRange = [_textView.text rangeOfString:@"pariatur"];
    
    //背景颜色
    NSRange bgRange = [_textView.text rangeOfString:@"conscient "];
    
    //下划线
    NSRange underLineRange = [_textView.text rangeOfString:@"nulla"];
    
    //字体颜色
    NSRange tintedRange = [_textView.text rangeOfString:@" minim"];
    
    //创建一个属性文本
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:_textView.attributedText];
    
    //添加属性
    [attributedString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:25] range:boldRange];
    
    [attributedString addAttribute:NSBackgroundColorAttributeName value:[UIColor purpleColor] range:bgRange];
    
    [attributedString addAttribute:NSUnderlineStyleAttributeName value:@1 range:underLineRange];
    
    [attributedString addAttribute:NSForegroundColorAttributeName  value:[UIColor whiteColor] range:tintedRange];
    
    //添加图片
    NSTextAttachment *attcchMent = [[NSTextAttachment alloc] init];
    attcchMent.image = [UIImage imageNamed:@"text_view_attachment.png"];
    
    NSAttributedString *attachString = [NSAttributedString attributedStringWithAttachment:attcchMent];
                                        
    [attributedString appendAttributedString:attachString];
                                        
    _textView.attributedText = attributedString;
    
    
}


#pragma mark -UITextViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    UIBarButtonItem *barBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarBtnItemClick:)];
    self.navigationItem.rightBarButtonItem = barBtnItem;
    
}

- (void)rightBarBtnItemClick:(UIBarButtonItem *)item
{
    //取消第一响应
    [_textView resignFirstResponder];
    
    self.navigationItem.rightBarButtonItem = nil;
}

//移除通知
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

@end
