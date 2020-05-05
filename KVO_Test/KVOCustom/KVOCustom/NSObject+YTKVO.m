//
//  NSObject+YTKVO.m
//  KVOCustom
//
//  Created by Yutian Duan on 2020/5/5.
//  Copyright © 2020年 Lingzhu. All rights reserved.
//

#import "NSObject+YTKVO.h"
#import <objc/message.h>


static NSString *const kKCKVOPrefix = @"KCKVO_";
static NSString *const kKCKVOAssioKey = @"kKVOAssociatedKey";


@implementation NSObject (YTKVO)

- (void)yt_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context {
  
  
  
}



#pragma mark - prive func


static Class KCKVO_Class(id self,SEL _cmd) {
  return class_getSuperclass(object_getClass(self));
}

//name ===>> setName:
static NSString * setterfromGetter(NSString * getter) {
  
  if (getter.length <= 0) { return nil;}
  //name
  NSString *firtString = [[getter substringToIndex:1] uppercaseString];
  NSString *leaveString = [getter substringFromIndex:1]; //ame
  
  return [NSString stringWithFormat:@"set%@%@:",firtString,leaveString];
  
}

//setName: ===>>> name
static NSString * getterfromSetter(NSString * setter) {
  
  if (setter.length <= 0 || ![setter hasPrefix:@"set"] || ![setter hasSuffix:@":"]) { return nil;}
  
  //setName:  ===>> Name:  ====> Name ==> name
  NSRange range = NSMakeRange(3, setter.length-4);
  NSString *getter = [setter substringWithRange:range];
  NSString *firstString = [[getter substringToIndex:1] lowercaseString]; //n
  getter = [getter stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:firstString];
  
  return getter;
}


@end
