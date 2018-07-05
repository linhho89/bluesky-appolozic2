//
//  ALChatManager.h
//  applozicdemo
//
//  Created by Devashish on 28/12/15.
//  Copyright © 2015 applozic Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALChatLauncher.h"
#import "ALUser.h"
#import "ALConversationService.h"
#import "ALRegisterUserClientService.h"

#define APPLICATION_ID @"testchatapp36cea665aa140aaf2db"


@interface ALChatManager : NSObject

@property(nonatomic,strong) ALChatLauncher * chatLauncher;

@property(nonatomic,strong) NSArray * permissableVCList;

-(instancetype)initWithApplicationKey:(NSString *)applicationKey;

-(void)registerUser:(ALUser * )alUser;

-(void)registerUserWithCompletion:(ALUser *)alUser withHandler:(void(^)(ALRegistrationResponse *rResponse, NSError *error))completion;

@property (nonatomic,retain) NSString * userID;

-(void)launchChat: (UIViewController *)fromViewController orView:(UIView*)fromView;

-(void)launchChatForUserWithDefaultText:(NSString * )userId andFromViewController:(UIViewController*)viewController;

-(void)registerUserAndLaunchChat:(ALUser *)alUser andFromController:(UIViewController *)viewController orView:(UIView*)view forUser:(NSString *)userId withGroupId:(NSNumber *)groupID;

-(void)launchChatForUserWithDisplayName:(NSString * )userId withGroupId:(NSNumber*)groupID andwithDisplayName:(NSString*)displayName andFromViewController:(UIViewController*)fromViewController;

-(void)createAndLaunchChatWithSellerWithConversationProxy:(ALConversationProxy*)alConversationProxy fromViewController:(UIViewController*)fromViewController;

-(void)launchListWithUserORGroup: (NSString *)userId ORWithGroupID: (NSNumber *)groupId andFromViewController:(UIViewController*)fromViewController;

-(void)launchOpenGroupWithKey:(NSNumber *)channelKey fromViewController:(UIViewController *)viewController;

-(BOOL)isUserHaveMessages:(NSString *)userId;

-(void) launchContactScreenWithMessage:(ALMessage *)alMessage andFromViewController:(UIViewController*)viewController;

-(NSString *)getApplicationKey;

-(void)launchChatListWithParentKey:(NSNumber *)parentGroupKey andFromViewController:(UIViewController *)viewController;

-(void)launchContactScreenFromViewController:(UIViewController *)viewController;
@end
