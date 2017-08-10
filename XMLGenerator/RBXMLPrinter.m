//
//  RBXMLPrinter.m
//  XMLGenerator
//
//  Created by Ryker Bay on 2017/7/27.
//  Copyright © 2017年 Ryker Bay. All rights reserved.
//

#import "RBXMLPrinter.h"
#import "RBXMLNode.h"
#import "RBXMLDocument.h"

@implementation RBXMLPrinter


+ (void)printDocument:(RBXMLDocument *)doc {
    NSMutableString *finalString = [NSMutableString new];
    
    NSString *XMLEncodingFormat;
    switch (doc.encodingFormat) {
        case RBXMLDocumentEncodingFormatUTF8:
            [finalString dataUsingEncoding:NSUTF8StringEncoding];
            XMLEncodingFormat = @"utf-8";
            break;
        case RBXMLDocumentEncodingFormatUTF16:
            [finalString dataUsingEncoding:NSUTF16StringEncoding];
            XMLEncodingFormat = @"utf-16";
            break;
        case RBXMLDocumentEncodingFormatUnicode:
            [finalString dataUsingEncoding:NSUnicodeStringEncoding];
            XMLEncodingFormat = @"unicode";
            break;
        case RBXMLDocumentEncodingFormatNonlossyACSII:
            [finalString dataUsingEncoding:NSNonLossyASCIIStringEncoding];
            XMLEncodingFormat = @"nonlossy";
        default:
            break;
    }
    
    
    [finalString appendFormat:@"\n<XML version = \"%@\" encoding = \"%@\">\n",doc.version, XMLEncodingFormat];
    
    if (doc.rootNode) {
        [self appendNodesDecription:doc.rootNode toString:finalString];
    }
    NSLog(@"\n%@",finalString);
}

+ (void)printChildrenWithParentNode:(RBXMLNode *)node {
    NSMutableString *finalString = [[NSMutableString alloc] initWithString:@"\n"];
    [self appendNodesDecription:node toString:finalString];
    NSLog(@"\n%@",finalString);
}


/**
 将子节点的内容添加到将要输出的字符串中
 
 @param node 当前节点
 @param finalString 要输出的字符串
 */
+ (void)appendNodesDecription:(RBXMLNode *)node toString:(NSMutableString *)finalString {
    
    [finalString appendFormat:@"<%@",node.name];
    
    //遍历输出属性
    if (node.attributesDic.count > 0) {
        for (NSString *key in node.attributesDic) {
            [finalString appendFormat:@"%@ = %@",key, node.attributesDic[key]];
        }
    }
    
    //遍历输出子节点
    if (node.childNodes.count > 0) {
        //有子节点的先输出『>』并换行，再开始输出子节点
        [finalString appendFormat:@">\n"];
        for(int i = 0; i < node.childNodes.count; i++ ) {
            [self appendNodesDecription:node.childNodes[i] toString:finalString];
        }
    } else {
        [finalString appendFormat:@">"];
    }
    
    [finalString appendFormat:@"%@"@"</%@>\n",node.content,node.name];
}


@end
