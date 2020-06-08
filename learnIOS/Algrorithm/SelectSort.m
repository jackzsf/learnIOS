//
//  SelectSort.m
//  learnIOS
//
//  Created by saifengzhang on 2020/6/5.
//  Copyright © 2020 saifengzhang. All rights reserved.
//

#import "SelectSort.h"
#import "AlgrorithmTools.h"

@implementation SelectSort

+ (NSMutableArray *)selectSort1:(NSArray *)array
{
    NSLog(@"选择排序...");
    NSMutableArray *result = [NSMutableArray arrayWithArray:array];
    if (!array || [array count] == 0) {
        return result;
    }
    
    for (int i = 0; i < [array count]; i++) {
        int min = i;
        for (int j = i+1; j < [array count]; j++) {
            if ([result[j] intValue] < [result[min] intValue]) {
                min = j;
            }
        }
        
        if (min != i) {
            [AlgrorithmTools swap:result i:i j:min];
        }
        NSLog(@"temp array is %@",[result jsonStringEncoded]);
    }
    return result;
}

@end
