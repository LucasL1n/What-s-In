//
//  CategoryDataItem.h
//  What's In
//
//  Created by roborock on 2021/12/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol Category <NSObject>
@property (strong, nonatomic) NSUUID *uuid;
@property (strong, nonatomic) NSString *name;
@end

@interface CategoryDataItem : NSObject<Category>
@property (strong, nonatomic) NSUUID *uuid;
@property (strong, nonatomic) NSString *name;
@end

NS_ASSUME_NONNULL_END
