//
//  ChatListView.m
//  newChatDemo
//
//  Created by Linh Ho-Tuan on 6/14/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import "ChatListView.h"
#import "ALChatManager.h"
@implementation ChatListView

- (void)commonInit
{
  // do any initialization that's common to both -initWithFrame:
  // and -initWithCoder: in this method
  

 // [self loginChat];
  
}

- (id)initWithFrame:(CGRect)aRect
{
  if ((self = [super initWithFrame:aRect])) {
    [self commonInit];
  }
  return self;
}

- (id)initWithCoder:(NSCoder*)coder
{
  if ((self = [super initWithCoder:coder])) {
    [self commonInit];
  }
  return self;
}

- (id)init
{
  if ((self = [super init])) {
    
    self.backgroundColor = [UIColor redColor];
  }
  return self;
}


-(void)loginChatWithUser:(NSDictionary*)userDict{
  
//  ALUser *user = [ALUser new];
//
//  NSString * string1 = [userDict objectForKey:@"userId"];
//  NSString * string2 = [userDict objectForKey:@"password"];
//  NSString * string3 = [userDict objectForKey:@"email"];
//
//  user.userId = string1;
//  user.password = string2;
//  user.email = string3;
//
  
  ALUser * aluser =  [[ALUser alloc] initWithJSONString:[self getJsonString:userDict]];

  [ALUserDefaultsHandler setUserId:aluser.userId];
  [ALUserDefaultsHandler setPassword:aluser.password];
  [ALUserDefaultsHandler setEmailId:aluser.email];
  [ALUserDefaultsHandler setDisplayName:aluser.displayName];

  ALChatManager *manager = [[ALChatManager alloc] initWithApplicationKey:@"testchatapp36cea665aa140aaf2db"]; // SET APPLICATION ID
  [manager registerUserWithCompletion:aluser withHandler:^(ALRegistrationResponse *rResponse, NSError *error) {
    
    
   // UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Applozic" bundle:[NSBundle bundleForClass:ALChatViewController.class]];
  //  ALMessagesViewController *msgVC = [storyboard instantiateViewControllerWithIdentifier:@"ALViewController"];
    
  // [[self topMostController] presentViewController:msgVC animated:YES completion:^{
//
  //  }];
   // [self addSubview:msgVC.view];
  //  dispatch_async(dispatch_get_main_queue(), ^{
 //     [self addSubview:msgVC.view];
 //   });
    
  ALChatManager * chatManager = [[ALChatManager alloc]init];
 [chatManager launchChat:[self topMostController] orView:self ];
    
    
  }];
}


- (UIViewController*) topMostController
{
  UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
  
  while (topController.presentedViewController) {
    topController = topController.presentedViewController;
  }
  
  return topController;
}

-(void)setLoginUser:(NSDictionary *)loginUser{
 // self.loginUser = loginUser;
  [self loginChatWithUser:loginUser];
  
}


-(NSString *)getJsonString:(id) Object{
  
  NSError *error;
  NSString *jsonString;
  NSData *jsonData = [NSJSONSerialization dataWithJSONObject:Object
                                                     options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                       error:&error];
  
  if (! jsonData) {
    
    NSLog(@"Got an error: %@", error);
    
  } else {
    
    jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
  }
  return jsonString;
}
@end
