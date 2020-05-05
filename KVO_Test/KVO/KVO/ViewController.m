//
//  ViewController.m
//  KVO
//
//  Created by Yutian Duan on 2020/5/2.
//  Copyright © 2020年 Lingzhu. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/runtime.h>

@interface ViewController ()
@property (nonatomic, strong) Person *person;
@end


@implementation ViewController

///! 打印类的方法列表
- (void)printMethodNameOfClass:(Class)cls {
  unsigned int count;
  Method *methodList = class_copyMethodList(cls, &count);
  NSLog(@"%@:\n",NSStringFromClass(cls));
  for (int i = 0; i < count; i++) {
    Method method = methodList[i];
    NSString *selStr = NSStringFromSelector(method_getName(method));
    NSLog(@"%@",selStr);
  }
  free(methodList);
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  _person = [[Person alloc] init];
  
  _person.age = 10;

  [_person addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:NULL];
  
  IMP setAge = [_person methodForSelector:@selector(setAge:)];
  
  [_person class];
  _person.age += 10;

  
  
  //  _person.colors = [[NSMutableArray alloc] init];
//  [_person addObserver:self forKeyPath:@"colors" options:NSKeyValueObservingOptionNew context:NULL];
//  [_person addObserver:self forKeyPath:@"colors" options:NSKeyValueObservingOptionNew context:NULL];
//  [_person addObserver:self forKeyPath:@"colors" options:NSKeyValueObservingOptionNew context:NULL];
//  [_person addObserver:self forKeyPath:@"colors" options:NSKeyValueObservingOptionNew context:NULL];

  //! 这段代码不会触发的kvo
//  [_person.colors addObject:@"1"];
  ///! 这段代码会触发
//  NSMutableArray *tempArray = [_person mutableArrayValueForKey:@"colors"];
//  [tempArray insertObject:@"2" atIndex:0];
  
  
//  NSLog(@"%@",_person.observationInfo);
  
//  [self printMethodNameOfClass:object_getClass(_person)];
  
  
//  _person.student = [[Student alloc] init];
  
//  [_person setValue:@"200" forKeyPath:@"student.weight"];
  
//  [_person removeObserver:self forKeyPath:@"age"];


  
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  
  _person->name = @"newName";
  _person.age += 10;
//  _person->_age += 10;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
  NSLog(@"change=%@",change);
}


@end
