//
//  RBXMLDocument.h
//  XMLGenerator
//
//  Created by Ryker Bay on 2017/7/27.
//  Copyright © 2017年 Ryker Bay. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RBXMLNode;

typedef NS_ENUM(NSInteger, RBXMLDocumentEncodingFormat) {
    RBXMLDocumentEncodingFormatUTF8,
    RBXMLDocumentEncodingFormatUTF16,
    RBXMLDocumentEncodingFormatUnicode,
    RBXMLDocumentEncodingFormatNonlossyACSII,
};

@interface RBXMLDocument : NSObject

@property (copy, nonatomic) NSString *version;
@property RBXMLDocumentEncodingFormat encodingFormat;
@property (strong, nonatomic) RBXMLNode *rootNode;


/**
 XML文档初始化
 
 @param version XML版本
 @param encodingFormat XML编码格式
 @return RBXMLDocument
 */
- (instancetype)initWithXMLVersion:(NSString *)version andEncodingFormat:(RBXMLDocumentEncodingFormat)encodingFormat;

@end
