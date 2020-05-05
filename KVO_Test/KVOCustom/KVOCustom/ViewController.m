//
//  ViewController.m
//  KVOCustom
//
//  Created by Yutian Duan on 2020/5/5.
//  Copyright © 2020年 Lingzhu. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "NSObject+YTKVO.h"


@interface ViewController ()
@property (nonatomic, strong) Person *person;
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  
  
  _person = [[Person alloc] init];
  _person.name = @"UC";
  
  [_person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
  
}


@end
