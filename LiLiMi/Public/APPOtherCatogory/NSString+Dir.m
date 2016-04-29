

#import "NSString+Dir.h"
#import <CommonCrypto/CommonDigest.h>
@implementation NSString (Dir)

/**
 *  追加文档目录
 */
- (NSString *)appendDocumentDir
{
    return [self appendDir:[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]];
}

/**
 *  追加缓存目录
 */
- (NSString *)appendCacheDir
{
    return [self appendDir:[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]];
}

/**
 *  追加临时目录
 */
- (NSString *)appendTempDir
{
    return [self appendDir:NSTemporaryDirectory()];
}

/**
 *  将当前字符串拼接到指定目录后面
 *
 *  @param dir 指定目录
 *
 *  @return 拼接好的路径
 */
- (NSString *)appendDir:(NSString *)dir // docpath
{
    return [dir stringByAppendingPathComponent:self];
}
/**
 *  计算文本字体size
 *
 *  @param CGSize 最大Size
 *  
 *  @param fontSize 字体
 *  @return CGSize
 */
- (CGSize)sizeOfMaxSize:(CGSize)maxSize fontSize:(CGFloat)fontSize
{
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:setFont(fontSize)} context:nil].size;
}
//
- (BOOL)myContainsString:(NSString*)other {
    NSRange range = [self rangeOfString:other];
    return range.length != 0;
}
- (NSString *) md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, strlen(cStr), result );
    return [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}
@end
