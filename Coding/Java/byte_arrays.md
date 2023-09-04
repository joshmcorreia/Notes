# Byte Arrays

## Print the contents of a byte array
[How to print the data in byte array as characters?](https://stackoverflow.com/a/6463665)
```java
byte[] byteArray = new byte[] { -1, 0, 1, 2, 3 };
System.out.println(Arrays.toString(byteArray));
// prints "[-1, 0, 1, 2, 3]"
```

## Print the contents of a byte array in hex
[How can I convert a byte array to hexadecimal in Java?](https://stackoverflow.com/a/2817883)
```java
byte[] bytes = { -1, 0, 1, 2, 3 };
StringBuilder sb = new StringBuilder();
for (byte b : bytes) {
    sb.append(String.format("%02X ", b));
}
System.out.println(sb.toString());
// prints "FF 00 01 02 03 "
```
