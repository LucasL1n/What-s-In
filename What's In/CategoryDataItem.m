//
//  CategoryDataItem.m
//  What's In
//
//  Created by roborock on 2021/12/10.
//

#import "CategoryDataItem.h"

@implementation CategoryDataItem

- (instancetype)init {
    if (self = [super init]) {
        self.uuid = NSUUID.UUID;
    }
    return self;
}

@end
