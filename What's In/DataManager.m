//
//  DataManager.m
//  What's In
//
//  Created by roborock on 2021/12/10.
//

#import "DataManager.h"

@interface DataManager()
@end

@implementation DataManager

+ (instancetype)sharedManager {
    static DataManager *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

- (id)init {
  if (self = [super init]) {
      
  }
  return self;
}

- (void)loadAllWithKey:(NSString *)key {
    
}

- (void)loadRoot {
    [self loadCategoryWithKey: ROOT_KEY];
}

- (void)loadCategoryWithKey: (NSString *)key {
    
}

- (void)loadObjectWithKey: (NSString *)key {
    
}

@end
