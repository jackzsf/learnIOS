//
//  AlgrorithmTools.m
//  learnIOS
//
//  Created by saifengzhang on 2020/6/5.
//  Copyright © 2020 saifengzhang. All rights reserved.
//

#import "AlgrorithmTools.h"

@implementation AlgrorithmTools

//交换array的i和j的内容
+ (NSMutableArray *)swap:(NSMutableArray *)array i:(NSInteger)i j:(NSInteger)j
{
    if (!array || [array count] == 0 || i >= [array count] || j >= [array count]) {
        return array;
    }
    
    id tempValue = array[i];
    array[i] = array[j];
    array[j] = tempValue;
    
    return array;
}

@end
