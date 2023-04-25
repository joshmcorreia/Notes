# Packer

## Get the AMI ID of a Packer build
I've found that the easiest way to get an AMI ID is to set up a [Manifest post-processor](https://developer.hashicorp.com/packer/docs/post-processors/manifest)

To do this, all you have to do is add the following block within a `build` block:
```
post-processor "manifest" {
  output     = "manifest.json"
  strip_path = true
}
```

This will tell Packer to output build info to a file, in this case `manifest.json`.

For example:
```
$ cat manifest.json
{
  "builds": [
    {
      "name": "ubuntu_focal_nvirginia",
      "builder_type": "amazon-ebs",
      "build_time": 1682456449,
      "files": null,
      "artifact_id": "us-east-1:ami-0779e31a4c61dd2ca",
      "packer_run_uuid": "e94b2455-3689-513a-7e34-27c073a98f8b"
    }
  ],
  "last_run_uuid": "e94b2455-3689-513a-7e34-27c073a98f8b"
}
```

Now that the AMI ID is inside of the `manifest.json` file, we can parse it using `jq` to get the AMI ID ([Source](https://developer.hashicorp.com/packer/docs/post-processors/manifest)):
```
$ AMI_ID=$(jq -r '.builds[-1].artifact_id' manifest.json | cut -d ":" -f2)
$ echo $AMI_ID
ami-0779e31a4c61dd2ca
```
