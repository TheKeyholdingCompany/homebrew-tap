# Homebrew Tap
TKC's tap for Homebrew recipes

## Usage
```bash
brew tap TheKeyholdingCompany/tap
```

## Developing
Each application should have its own `.rb` file.

Examples:
* [./lasagna.rb](./lasagna.rb) ([Repository](https://github.com/TheKeyholdingCompany/lasagna))

### How to get the SHA256 hash
After you download the source tar.gz file, run the following command to get the SHA256 hash:
```bash
openssl dgst -sha256 your-file.tar.gz
```
