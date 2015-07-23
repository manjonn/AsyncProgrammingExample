//
//  FactorialOperation.h
//  NSOperationsExample
//
//  Created by Manjula Jonnalagadda on 7/23/15.
//  Copyright (c) 2015 Manjula Jonnalagadda. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FactorialOperationDelegate <NSObject>

-(void)factorialIs:(NSInteger)integer;

@end

@interface FactorialOperation : NSOperation

-(id)initWithInt:(NSInteger)integer;
@property(nonatomic,weak)id<FactorialOperationDelegate> delegate;

@end
