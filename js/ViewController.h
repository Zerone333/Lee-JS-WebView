//
//  ViewController.h
//  js
//
//  Created by Lee on 16/1/14.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <javascriptcore/javascriptcore.h>
@protocol ForgotPasswordViewControllerProtocol <JSExport>
-(void)dismiss;
@end
@interface ViewController : UIViewController


@end

