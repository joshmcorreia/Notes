## Extract a tar file using Python
[How do I extract a tar file using python?](https://stackoverflow.com/questions/31163668/how-do-i-extract-a-tar-file-using-python-2-4)
``` python3
import tarfile

tar = tarfile.open("sample.tar.gz")
tar.extractall(path="/home/josh/")
tar.close()
```
