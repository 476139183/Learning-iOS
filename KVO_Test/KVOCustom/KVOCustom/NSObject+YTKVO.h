//
//  NSObject+YTKVO.h
//  KVOCustom
//
//  Created by Yutian Duan on 2020/5/5.
//  Copyright © 2020年 Lingzhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (YTKVO)

- (void)yt_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;

@end


