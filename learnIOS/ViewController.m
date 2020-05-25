//
//  ViewController.m
//  learnIOS
//
//  Created by saifengzhang on 2020/5/25.
//  Copyright © 2020 saifengzhang. All rights reserved.
//

#import "ViewController.h"
#import "LRUCacheMap.h"

@interface ViewController ()

@property(nonatomic, strong) LRUCacheMap *lruCacheMap;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self lRUCacheMapTest];
}

- (void)lRUCacheMapTest{
    NSLog(@"lRUCacheMapTest 123...");
    
    for (int i = 1; i <=5; i++){
        NSString *key = [NSString stringWithFormat:@"%d",i];
        NSString *value = [NSString stringWithFormat:@"%d",i*100];
        
        [self.lruCacheMap setValue:value forKey:key];
    }
    
    [self.lruCacheMap enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"key ,value == %@, %@",key,obj);
    }];
    
    NSLog(@"-------------");
    
    [self.lruCacheMap setValue:@"600" forKey:@"6"];
    
    [self.lruCacheMap enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"key ,value == %@, %@",key,obj);
    }];
    
    NSLog(@"-------------");
    
    NSLog(@"%@",[self.lruCacheMap valueForKey:@"5"]);
    
    [self.lruCacheMap enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"key ,value == %@, %@",key,obj);
    }];
    
    NSLog(@"-------------");
    
    NSLog(@"%@",[self.lruCacheMap valueForKey:@"4"]);
    
    [self.lruCacheMap enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"key ,value == %@, %@",key,obj);
    }];
}

- (LRUCacheMap *)lruCacheMap{
    if (_lruCacheMap == nil) {
        _lruCacheMap = [[LRUCacheMap alloc] initWithCapacity:5];
    }
    
    return _lruCacheMap;
}


@end
