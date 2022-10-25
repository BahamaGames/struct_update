# struct_update
Copy/Replace keys from source struct to target struct.

### Example
```
var src = {
  text: "Hello World",
  nest: {
    arr: [0, 1, 2],
    str: {
      0: 0,
      1: 1
    }
  }
}

var tar = {
  text: "Hello World!!!",
  nest: {
    test: 123,
    arr: [9],
    str: {
      1: 1
    }
  }
}

struct_update(src, tar);
show_debug_message(tar);
```
Will return:
```
{text:"Hello World!!!", nest: {test: 123, arr: [9, 1, 2], str: {0: 0, 1: 1}}}
```
Can also optionally set replace to true to overwrite existing keys.
