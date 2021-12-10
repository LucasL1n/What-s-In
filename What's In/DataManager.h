//
//  DataManager.h
//  What's In
//
//  Created by roborock on 2021/12/10.
//

#import <Foundation/Foundation.h>
#define ROOT_KEY @"root.categories"
#define USR_ID @"usr.id"
NS_ASSUME_NONNULL_BEGIN

@interface DataManager : NSObject
+ (instancetype)sharedManager;
@end

NS_ASSUME_NONNULL_END
