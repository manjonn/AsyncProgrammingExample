//
//  FactorialOperation.m
//  NSOperationsExample
//
//  Created by Manjula Jonnalagadda on 7/23/15.
//  Copyright (c) 2015 Manjula Jonnalagadda. All rights reserved.
//

#import "FactorialOperation.h"

@interface FactorialOperation()

@property(nonatomic,assign)NSInteger num;

@end

@implementation FactorialOperation

-(id)initWithInt:(NSInteger)integer{
    self=[super init];
    if (self) {
        self.num=integer;
    }
    return self;
}

-(void)main{
    NSInteger factorial=1;
    for (int i=1; i<=_num; i++) {
        factorial =factorial*i;
    }
    __weak typeof(self) weakself=self;
    dispatch_sync(dispatch_get_main_queue(), ^{
        [weakself.delegate factorialIs:factorial];
        
    });
    
    
}


@end
