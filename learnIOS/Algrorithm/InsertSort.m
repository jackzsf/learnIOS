//
//  InsertSort.m
//  learnIOS
//
//  Created by saifengzhang on 2020/6/8.
//  Copyright © 2020 saifengzhang. All rights reserved.
//

#import "InsertSort.h"
#import "AlgrorithmTools.h"

@implementation InsertSort

+ (NSMutableArray *)insertSort1:(NSArray *)array
{
    NSLog(@"插入排序...");
    NSMutableArray *result = [NSMutableArray array];
    if (!array || [array count] == 0) {
        return result;
    }
    
    for (int i = 0; i < [array count]; i++) {
        NSInteger indexVal = [array[i] intValue];
        BOOL hasInserted = false;
        for (int j = 0; j<[result count]; j++) {
            if (indexVal < [result[j] intValue]) {
                [result insertObject:array[i] atIndex:j];
                hasInserted = true;
                break;
            }
        }
        if (!hasInserted) {
            [result insertObject:array[i] atIndex:[result count]];
        }
        NSLog(@"temp array is %@",[result jsonStringEncoded]);
    }
    return result;
}

@end
