//
//  Task.h
//  ToDo List
//
//  Created by Muhannad Sayed Abdullah on 2020-01-23.
//  Copyright © 2020 Muhannad. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Task : NSObject

@property (nonatomic) NSString * description;
@property (nonatomic) NSString * dateAndTime;
@property (nonatomic) NSString * place;
@property (nonatomic) BOOL * clear;

@end

NS_ASSUME_NONNULL_END
