# Compress files:

### Should you use `.tar.gz` or `.zip`?
Relevant post [here](https://superuser.com/questions/146754/on-linux-unix-does-tar-gz-versus-zip-matter)

`.tar.gz`
- More common on Linux distributions, but can be opened with 7Zip on Windows
- Slightly smaller file size
- Files cannot be accessed individually, so the entire file must be decompressed before accessing a file

`.zip`:
- More common on Windows distributions
- Slightly larger file size
- Allows files to be accessed individually without decompressing the entire file

### Tar a folder:
```bash
tar -czvf output_file.tar.gz /home/josh/folder_to_tar
```

### Untar a folder:
```bash
tar -xvf compressed_folder.tar.gz

tar -xvf compressed_folder.tar.gz -C /home/josh/output_folder
```

### Zip a folder:
```bash
zip -r output_file.zip /home/josh/folder_to_zip
```

### Unzip a folder:
```bash
unzip compressed_folder.zip

unzip compressed_folder.zip -d /home/josh/output_folder
```
