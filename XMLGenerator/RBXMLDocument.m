//
//  RBXMLDocument.m
//  XMLGenerator
//
//  Created by Ryker Bay on 2017/7/27.
//  Copyright © 2017年 Ryker Bay. All rights reserved.
//

#import "RBXMLDocument.h"
#import "RBXMLNode.h"

@interface RBXMLDocument()

@end


@implementation RBXMLDocument

- (instancetype)initWithXMLVersion:(NSString *)version andEncodingFormat:(RBXMLDocumentEncodingFormat)encodingFormat {
    
    if ((self = [super init])) {
        _version = version;
        _encodingFormat = encodingFormat;
        _rootNode = [RBXMLNode new];
    }
    
    return self;
}


@end
