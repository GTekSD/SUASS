# Guide: Reverse Engineering .jar, .jad, and .sisx Mobile Game Files to Extract Soundtracks

This guide provides a detailed, step-by-step method to reverse engineer old Java ME (`.jar`, `.jad`) and Symbian (`.sisx`) mobile games for the purpose of extracting embedded soundtracks such as `.mid`, `.wav`, `.mp3`, and `.m4r` formats.

---

## Tools Required

### Linux Packages:

* `unzip`
* `binwalk`
* `ffmpeg`
* `ffplay`
* `timidity`
* `openjdk`
* `wget`

### Java Decompiler:

* [CFR](http://www.benf.org/other/cfr/) (Java .class decompiler)
* `jadx` (optional for GUI or CLI decompiling)

---

## Part 1: Reverse Engineering `.jar` Files

### Step 1: Unzip the JAR

```bash
mkdir jar_extracted && cd jar_extracted
unzip /path/to/game.jar
```

### Step 2: Analyze Extracted Files

Look for `.class`, `.png`, `.mid`, `.wav`, etc. You may already find audio assets.

### Step 3: Decompile `.class` Files (CFR Method)

```bash
wget https://www.benf.org/other/cfr/cfr.jar -O cfr.jar
mkdir ../decompiled
find . -name "*.class" -exec java -jar ../cfr.jar {} --outputdir ../decompiled \;
```

### Step 4: Search for Resource References

```bash
grep -ri "InputStream" ../decompiled | grep -i ".mid\|.wav\|.mp3"
```

This reveals asset paths (e.g., `/sfx/music1.mid`).

---

## Part 2: Identifying and Extracting Obfuscated Assets

### Step 1: Use `file` and `binwalk`

```bash
file *
binwalk *
```

### Step 2: Identify Sound Files

Look for headers like:

* `RIFF` (WAV)
* `ID3` (MP3)
* `4D 54 68 64` (MIDI)
* `#!AMR` (AMR)

### Step 3: Extract with `dd`

```bash
dd if=62 bs=1 skip=10481 of=output.wav
```

### Step 4: Test or Convert

```bash
ffplay output.wav
ffmpeg -i output.wav output.mp3
```

---

## Part 3: Convert `.mid` to `.wav`, `.mp3`, `.m4a`, and `.m4r`

### Step 1: Convert to WAV

```bash
timidity music1.mid -Ow -o music1.wav
```

### Step 2: Convert to MP3

```bash
ffmpeg -i music1.wav -codec:a libmp3lame -b:a 320k music1.mp3
```

### Step 3: Convert to M4A

```bash
ffmpeg -i music1.wav -c:a aac -b:a 256k music1.m4a
```

### Step 4: Convert to iPhone M4R Ringtone

```bash
ffmpeg -i music1.wav -t 30 -c:a aac -b:a 128k music1.m4r
```

---

## Part 4: Reverse Engineering `.sisx` Files (Symbian)

### Step 1: Extract with `unzip` (some `.sisx` are just zipped packages)

```bash
unzip game.sisx -d sisx_extracted
```

### Step 2: Use `binwalk` and `hexdump`

```bash
binwalk *
xxd filename | head
```

### Step 3: Extract with `dd` or `ffmpeg`

Follow the same method as above.

---

## Optional: Batch Extraction Script Example

```bash
for f in *; do
  ffmpeg -y -i "$f" "converted/$f.wav" 2>/dev/null && echo "$f might be audio"
done
```

---

## Conclusion

By combining decompilation, hex inspection, and smart conversion tools, you can reverse engineer most Java ME and Symbian mobile game files to extract their hidden or embedded soundtrack files.

Always ensure you're using these techniques legally and ethically — preferably for games you own or have explicit permission to analyze.
