//
//  BubbleSort.m
//  learnIOS
//
//  Created by saifengzhang on 2020/6/5.
//  Copyright © 2020 saifengzhang. All rights reserved.
//

#import "BubbleSort.h"
#import "AlgrorithmTools.h"

@implementation BubbleSort

+ (NSMutableArray *)bubbleSort1:(NSArray *)array
{
    NSMutableArray *result = [NSMutableArray arrayWithArray:array];
    if (!array || [array count] == 0) {
        return result;
    }
    
    for (int i = 0; i < [array count]; i++) {
        for (int j = i+1; j < [array count]; j++) {
            if ([result[i] intValue] > [result[j] intValue]) {
                result = [AlgrorithmTools swap:result i:i j:j];
//                NSLog(@"temp array is %@,i is %d,j is %d",[result jsonStringEncoded],i,j);
            }
        }
    }
    return result;
}

//较小的数字从后面开始冒到最前面
+ (NSMutableArray *)bubbleSort2:(NSArray *)array
{
    NSMutableArray *result = [NSMutableArray arrayWithArray:array];
    if (!array || [array count] == 0) {
       return result;
    }
    NSInteger loopCount = 0;
    
    for (int i = 0; i < [array count]; i++) {
        loopCount++;
        BOOL flag = false; //表明这一轮是否有数据交换
        for (NSUInteger j = ([array count] - 1); j>=1; j--) {
            loopCount++;
            if ([result[j-1] intValue] > [result[j] intValue]) {
                result = [AlgrorithmTools swap:result i:(j-1) j:j];
//                NSLog(@"temp array is %@,i is %d,j is %lu",[result jsonStringEncoded],i,j);
                flag = true;
            }
        }
        if (!flag) {
            break;
        }
    }
    NSLog(@"loopCount is %ld",loopCount);
    return result;
}



@end
