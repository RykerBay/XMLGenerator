//
//  RBXMLPrinter.h
//  XMLGenerator
//
//  Created by Ryker Bay on 2017/7/27.
//  Copyright © 2017年 Ryker Bay. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RBXMLNode;
@class RBXMLDocument;


@interface RBXMLPrinter : NSObject


/**
 打印XML文档
 
 @param doc XML文档
 */
+ (void)printDocument:(RBXMLDocument *)doc;


/**
 打印当前节点的子节点
 
 @param node 当前节点
 */
+ (void)printChildrenWithParentNode:(RBXMLNode *)node;

@end
