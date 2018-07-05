//
//  ChatListViewManager.m
//  newChatDemo
//
//  Created by Linh Ho-Tuan on 6/13/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import "ChatListViewManager.h"
#import "ChatListView.h"
#import "ALGroupCreationViewController.h"


@implementation ChatListViewManager{
  
  ChatListView * myView;
 // ALGroupCreationViewController * controller;

}


RCT_EXPORT_MODULE()

- (UIView *)view
{
    myView =[[ChatListView alloc] initWithFrame:CGRectMake(0, 0,  [UIApplication sharedApplication].keyWindow.rootViewController.view.frame.size.width,  [UIApplication sharedApplication].keyWindow.rootViewController.view.frame.size.height)];
  

//  UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Applozic" bundle:[NSBundle bundleForClass:[ALGroupCreationViewController class]]];
//
//  controller = (ALGroupCreationViewController *)[storyboard instantiateViewControllerWithIdentifier:@"ALGroupCreationViewController"];
//  [controller.view setFrame:CGRectMake(0, 0, [UIApplication sharedApplication].keyWindow.rootViewController.view.frame.size.width, [UIApplication sharedApplication].keyWindow.rootViewController.view.frame.size.height)];
//
  
  return myView;
  
}
//
//- (void)tapOnButton:(UIButton *)sender
//{
//  test.onchangeBackGroundColor(@{@"color":@ "redColor"});
//}
//
//
//
//RCT_EXPORT_VIEW_PROPERTY(onchangeBackGroundColor, RCTBubblingEventBlock)
//
//
//
RCT_EXPORT_VIEW_PROPERTY(loginUser, NSDictionary)

@end
