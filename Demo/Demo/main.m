//
//  main.m
//  Demo
//
//  Created by Ryker Bay on 2017/8/11.
//  Copyright © 2017年 Ryker Bay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RBXMLDocument.h"
#import "RBXMLNode.h"
#import "RBXMLPrinter.h"

//  <XML version = "1.0" encoding = "utf-8">
//  <CategoryList>
//      <Category ID = 01>
//          <MainCategory>XML</MainCategory>
//          <Decription>This is a list of my XML articles.</Decription>
//          <Active>true</Active>
//      </Category>
//  </CategoryList>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        RBXMLDocument *doc = [[RBXMLDocument alloc] initWithXMLVersion:@"1.0" andEncodingFormat:RBXMLDocumentEncodingFormatUTF8];
        
        //CategoryList
        RBXMLNode *categoryListNode = [[RBXMLNode alloc] initWithName:@"CategoryList"];
        doc.rootNode = categoryListNode;
        
        //Category
        RBXMLNode *categoryNode = [[RBXMLNode alloc] initWithName:@"Category" andAttributeDictionary:@{@"ID" : @"01"}];
        [categoryListNode addChildNode:categoryNode];
        
        
        
        //MainCategory
        RBXMLNode *mainCategoryNode = [[RBXMLNode alloc] initWithName:@"MainCategory" andContent:@"XML"];
        [categoryNode addChildNode:mainCategoryNode];
        
        //Decription
        RBXMLNode *decriptionNode = [[RBXMLNode alloc] initWithName:@"Decription" andContent:@"This is a list of my XML articles."];
        [categoryNode addChildNode:decriptionNode];
        
        //Active
        RBXMLNode *activeNode = [[RBXMLNode alloc] initWithName:@"Active" andContent:@"true"];
        [categoryNode addChildNode:activeNode];
        
        NSLog(@"\nPrint out XML document:");
        [RBXMLPrinter printDocument:doc];
        
        NSLog(@"\nPrint CategoryList node's children nodes");
        [RBXMLPrinter printChildrenWithParentNode:categoryListNode];
        
        
    }
    return 0;
}


