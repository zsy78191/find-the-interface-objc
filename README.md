# find-the-interface-objc

A shell tool for auto create .h file with .m
This program can be used on Mac OS.

##Add to bin

Copy the `fti` program to `/usr/local/bin/`

When use, use terminal :

```
fti PWFileController.m 
```

Result:

```
-(NSString *)bytesToAvaiUnit:(long long)bytes;
- (long long) fileSizeAtPath:(NSString*) filePath;
- (long long) folderSizeAtPath:(NSString*) folderPath;
- (void) clearFolderAtPath:(NSString*) folderPath;
- (float)getTotalDiskSpace;
- (NSString *)getHomeDirectory;
```


