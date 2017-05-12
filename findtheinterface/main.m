//
//  main.m
//  findtheinterface
//
//  Created by 张超 on 2017/5/12.
//  Copyright © 2017年 orzer. All rights reserved.
//

#import <Foundation/Foundation.h>
NSArray* findInterface (NSString* text);
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        if(argc<=1) return 0;
        NSString* filePath = [[NSString alloc] initWithCString:argv[1] encoding:NSUTF8StringEncoding];
//        NSLog(@"%@",filePath);
        if(![[NSFileManager defaultManager] fileExistsAtPath:filePath])
        {
            NSLog(@"文件不存在");
            return 0;
        }
        NSString* s = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
        NSString* f = [[findInterface(s) componentsJoinedByString:@";\n"] stringByAppendingString:@";"];
        NSLog(@"result:\n%@",f);
    }
    return 0;
}


NSArray* findInterface (NSString* text)
{
    @autoreleasepool {
        //复制代码
        NSString *regex = @"-\\s?\\(.*?\\).*?(?=\\n|$|\\{)";
        NSString *str = text;
        NSError *error;
        NSRegularExpression *regular = [NSRegularExpression regularExpressionWithPattern:regex
                                                                                 options:NSRegularExpressionCaseInsensitive
                                                                                   error:&error];
        // 对str字符串进行匹配
        NSArray *matches = [regular matchesInString:str
                                            options:0
                                              range:NSMakeRange(0, str.length)];
        
        NSMutableArray* result = [NSMutableArray arrayWithCapacity:matches.count];
        // 遍历匹配后的每一条记录
        for (NSTextCheckingResult *match in matches) {
            NSRange range = [match range];
            NSString *mStr = [str substringWithRange:range];
            [result addObject:mStr];
        }
        
        return [result copy];
    }
}
