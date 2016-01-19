//
//  ViewController.m
//  js
//
//  Created by 李艺真 on 16/1/14.
//  Copyright © 2016年 李艺真. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate,ForgotPasswordViewControllerProtocol>
@property (nonatomic, weak) UIWebView *webView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(40, 0, 320, 480)];
    webView.delegate = self;
    [self.view addSubview:webView];
    _webView = webView;
    
    
    [_webView stringByEvaluatingJavaScriptFromString:[NSString stringWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"222" withExtension:@"js"] encoding:NSUTF8StringEncoding error:nil]];
    NSURL *url = [[NSBundle mainBundle]URLForResource:@"test" withExtension:@"html"];
    
    JSContext *context = [self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    context[@"jakilllog"] = ^() {
        
        NSLog(@"Begin Log");
        NSArray *args = [JSContext currentArguments];
        
        for (JSValue *jsVal in args) {
            NSLog(@"%@", jsVal);
        }
        
        JSValue *this = [JSContext currentThis];
        NSLog(@"-------End Log-------");
        
    };
    
    __weak typeof (self) weakSelf = self;
    context[@"testObject"]=weakSelf;
    
    //同样我们也用刚才的方式模拟一下js调用方法
    NSString *jsStr1=@"jakilllog.dismiss()";
    [context evaluateScript:jsStr1];
    //
    
    _webView.scalesPageToFit=YES;
    [_webView loadRequest:[NSURLRequest requestWithURL:url]];
    
}

-(void)dismiss
{
    NSLog(@"dismiss");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType;
{
    NSString *path=[[request URL] absoluteString];
    
    NSLog(@"%@",path);
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [_webView stringByEvaluatingJavaScriptFromString:@"setImageClickFunction()"];
    
    
    //第二种情况，js是通过对象调用的，我们假设js里面有一个对象 testobject 在调用方法
    //首先创建我们新建类的对象，将他赋值给js的对象
//    JSContext *context=[webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
//    __weak typeof (self) weakSelf = self;
//    context[@"test"]=weakSelf;
//    
//    //同样我们也用刚才的方式模拟一下js调用方法
//    NSString *jsStr1=@"test.dismiss()";
//    [context evaluateScript:jsStr1];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error
{
    
}
@end
