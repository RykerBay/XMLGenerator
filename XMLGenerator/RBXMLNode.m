//
//  RBXMLNode.m
//  XMLGenerator
//
//  Created by Ryker Bay on 2017/7/26.
//  Copyright © 2017年 Ryker Bay. All rights reserved.
//

#import "RBXMLNode.h"

@interface RBXMLNode()

@property (weak, nonatomic) RBXMLNode *parentNode;

@end


@implementation RBXMLNode

#pragma MARK - 初始化方法
- (instancetype)initWithName:(NSString *)name {
    return [self initWithName:name andAttributeDictionary:nil andContent:@""];
}
- (instancetype)initWithName:(NSString *)name andContent:(NSString *)content {
    return [self initWithName:name andAttributeDictionary:nil andContent:content];
}

- (instancetype)initWithName:(NSString *)name andAttributeDictionary:(NSDictionary *)attributesDic {
    return [self initWithName:name andAttributeDictionary:attributesDic andContent:@""];
}

- (instancetype)initWithName:(NSString *)name andAttributeDictionary:(NSDictionary *)attributesDic andContent:(NSString *)content {
    
    if ((self = [super init])) {
        _name = name;
        _content = content;
        _childNodes = [NSArray new];
        
        if (attributesDic) {
            _attributesDic = [attributesDic copy];
        }else {
            _attributesDic = [NSDictionary new];
        }
        
    }
    return self;
}

#pragma MARK - 定制

- (void)addAttributeWithName:(NSString *)attributeName andValue:(NSString *)value {
    
    NSMutableDictionary *mutableAttubuteDic = [self.attributesDic mutableCopy];
    [mutableAttubuteDic setValue:value forKey:attributeName];
    self.attributesDic = [mutableAttubuteDic copy];
    
}

- (void)addChildNode:(RBXMLNode *)childNode {
    //每个节点只可以从属于一个父节点
    //只有当节点的父节点不存在时，才能添加到一个父节点
    if (!childNode.parentNode) {
        NSMutableArray *mutableChildNodesArray = [self.childNodes mutableCopy];
        childNode.parentNode = self;
        [mutableChildNodesArray addObject:childNode];
        self.childNodes = [mutableChildNodesArray copy];
    }
    
    
}

@end
