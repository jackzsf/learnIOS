//
//  MergeSort.h
//  learnIOS
//
//  Created by saifengzhang on 2020/6/8.
//  Copyright © 2020 saifengzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MergeSort : NSObject

//将两个排序好的arr合并 [@10,@30,@50,@70,@90] [@20,@40,@60,@80] -> [@10,@20,@30,@40,@50,@60,@70,@80,@90]
+ (NSMutableArray *)mergeTwoArr:(NSArray *)arr1 arr2:(NSArray *)arr2;

@end

NS_ASSUME_NONNULL_END
