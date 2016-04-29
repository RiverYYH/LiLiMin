

#import <Foundation/Foundation.h>

@interface NSString (Dir)

/**
 *  追加文档目录
 */
- (NSString *)appendDocumentDir;

/**
 *  追加缓存目录
 */
- (NSString *)appendCacheDir;

/**
 *  追加临时目录
 */
- (NSString *)appendTempDir;
/**
 *  计算文本字体size
 *
 *  @param CGSize 最大Size
 *
 *  @param fontSize 字体
 *  @return CGSize
 */
- (CGSize)sizeOfMaxSize:(CGSize)maxSize fontSize:(CGFloat)fontSize;

- (BOOL)myContainsString:(NSString*)other;


- (NSString *) md5:(NSString *)str;
@end
