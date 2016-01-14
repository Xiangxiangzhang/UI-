//
//  ViewController.m
//  UIWebView
//
//  Created by qingyun on 15/12/5.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //加载请求
    [self loadTextFieldRequest];
    
    //允许缩放（前提是访问的网页允许图片缩放）
    _webView.scalesPageToFit = YES;
    
}

//加载请求
- (void)loadTextFieldRequest
{
    //加载网络请求
    
    NSURL *url = [NSURL URLWithString:_textField.text];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    
}

#pragma mark -UIWebViewDelegate
//已经开始加载网址
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}
//加载成功
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}
//加载失败
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    NSString *string = @"<html><marquee><h1>对不起，你输入的网址有误</h1></marquee></html>";
    
    //加载html
    [webView loadHTMLString:string baseURL:nil];
    
}

#pragma mark -UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    [self loadTextFieldRequest];
    
    return YES;
}



@end
