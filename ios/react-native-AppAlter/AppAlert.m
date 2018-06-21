//
//  AppAlert.m
//  YiGoRN
//
//  Created by 龙丰 on 2018/5/17.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "AppAlert.h"
#import "MBProgressHUD.h"
#import <SVProgressHUD.h>
@implementation AppAlert
RCT_EXPORT_MODULE();
- (dispatch_queue_t)methodQueue
{
  return dispatch_get_main_queue();
}

RCT_EXPORT_METHOD(showLoading){//显示加载提示，禁止页面交互
  [SVProgressHUD show];
}

RCT_EXPORT_METHOD(hideLoading){//隐藏加载提示
  [SVProgressHUD dismiss];
}

RCT_EXPORT_METHOD(showToast:(NSString*)msg){//显示文字提示
  static BOOL isShowing  = NO;
  if (isShowing) {
    return;
  }
  isShowing = YES;
  UIWindow* window = [UIApplication sharedApplication].keyWindow;
  MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
  hud.mode = MBProgressHUDModeText;
  hud.label.text = msg;
  hud.label.textColor = [UIColor whiteColor];
  hud.label.font = [UIFont systemFontOfSize:15.0];
  hud.userInteractionEnabled = NO;
  hud.removeFromSuperViewOnHide = YES;
  hud.bezelView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.95];
  dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 1.5 * NSEC_PER_SEC);
  dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
    [MBProgressHUD hideHUDForView:window animated:YES];
    isShowing = NO;
  });
  
}

@end
