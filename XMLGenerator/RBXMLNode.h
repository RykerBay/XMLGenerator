//
//  RBXMLNode.h
//  XMLGenerator
//
//  Created by Ryker Bay on 2017/7/26.
//  Copyright © 2017年 Ryker Bay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RBXMLNode : NSObject

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *content;
@property (copy, nonatomic) NSArray<RBXMLNode *> *childNodes;
@property (copy, nonatomic) NSDictionary *attributesDic;

//初始化方法
- (instancetype)initWithName:(NSString *)name;

- (instancetype)initWithName:(NSString *)name andContent:(NSString *)content;

- (instancetype)initWithName:(NSString *)name andAttributeDictionary:(NSDictionary *)attributesDic;

- (instancetype)initWithName:(NSString *)name andAttributeDictionary:(NSDictionary *)attributesDic andContent:(NSString *)content;


/**
 给节点元素添加属性
 
 @param attributeName 属性名称
 @param value 属性值
 */
- (void)addAttributeWithName:(NSString *)attributeName andValue:(NSString *)value;


/**
 给当前节点添加子节点
 
 @param childNode 子节点
 */
- (void)addChildNode:(RBXMLNode *)childNode;
@end
