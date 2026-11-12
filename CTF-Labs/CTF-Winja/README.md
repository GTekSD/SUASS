# CTF-Winja Challenges

Challenge descriptions, point values, hints, and resources are organized below by category. Select a challenge title to open its description file.

## Android

### [My First Camera App](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/Android/My%20First%20Camera%20App.txt) — 350 points

I tasked Jarvis with designing a camera app, and it seems to have excelled at the job. It's impressively intuitive and doesn't overwhelm users with unnecessary features. As simple as click and upload.

- **Hint:** Did you know that the app clicks the image and uploads it? You will find your destination in the code.
- **File:** [cameraApp.apk](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/Android/cameraApp.apk)

### [Unmask the Hidden](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/Android/Unmask%20the%20Hidden.txt) — 550 points

Uncover the secrets concealed within the app's architecture. Navigate through the code, exploit what's not supposed to be called.

- **File:** [unmaskTheHidden.apk](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/Android/unmaskTheHidden.apk)

## Boot2Root

### [Foto (user)](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/Boot2Root/Foto%20%28user%29.txt) — 349 points

Embark on a quest to unveil secrets in FotoMystery, a photography website shrouded in mystery.

- **Challenge:** [TryHackMe room](https://tryhackme.com/jr/fotofbebfjkwbefwnke)
- **Hint:** We hired a German intern to create our photosec website but apparently his English is week.

### [Gitted (user)](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/Boot2Root/Gitted%20%28user%29.txt) — 350 points

Gitted takes you on an extraordinary journey where you'll navigate Git repositories, unearth vulnerabilities, and harness the power of traversing. Your mission is to infiltrate the system, escalate privileges, and ultimately conquer the root.

- **Challenge:** [TryHackMe room](https://tryhackme.com/jr/gittedwinjactfnullcon2023c5)
- **Hint:** Use a large wordlist to uncover an endpoint.

## Cloud

### [Linkfinder](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/Cloud/Linkfinder.txt) — 350 points

Hmmm 🤔, A site that can access any URL and find out links. This looks very useful, I wonder if someone can do something malicious with it. We asked an AI to fix this site but it left some loopholes, can you go deep into the cloud to find that magical flag?

- **Challenge:** [http://43.205.192.198/](http://43.205.192.198/)

### [The JavaScript Master](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/Cloud/The%20JavaScript%20Master.txt) — 600 points

Even ChatGPT wasn't able to solve this challenge. can you decode the code and figure out how to retrieve the hidden flag. Figure out the logic and search up to beat the AI!!

- **File:** [JScode.zip](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/Cloud/JScode.zip)

## Cryptography

### [Fernet Frenzy](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/Cryptography/Fernet%20Frenzy.txt) — 100 points

"Fernet Frenzy" is a cryptography challenge that delves deep into the world of the Fernet symmetric encryption algorithm. Your mission, should you choose to accept it, is to decipher a mysterious ciphertext that guards a treasure trove of knowledge. As you navigate this cryptic labyrinth, you'll explore the intricacies of Fernet encryption, unravel its secrets, and decode the enigmatic message within.

- **Files:** [encrypted_file.enc](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/Cryptography/encrypted_file.enc), [encryptor](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/Cryptography/encryptor)

### [RTC](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/Cryptography/RTC.txt) — 164 points

Jarvis AI has encrypted this message using its advanced encryption. Are you smart enough to reverse this whole new RTC cipher.

- **Files:** [ciphertext.txt](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/Cryptography/ciphertext.txt), [messages.txt](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/Cryptography/messages.txt)

## Forensics

### [AI Volume Quest](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/Forensics/AI%20Volume%20Quest.txt) — 200 points

Step into the world of GPT-4.5's encrypted volume, shielded by a dual-layer security system. The challenge? Crack the code that guards it. First, unravel a complex PIN code, and then navigate the labyrinth of characters to unveil the passphrase that unveils the digital treasure within. Are you up for the task of breaching this virtual vault's defenses?

- **Hint:** Think outside the box: Classic encryption methods can provide various clues for breaking into modern locks.
- **File:** [challenge](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/Forensics/challenge)

### [AmuseAudio](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/Forensics/AmuseAudio.txt) — 100 points

Unlock the Irresistible Secrets: Join our audio steganography challenge and decode the symphonic riddles hidden in plain 'ear' sight!

- **File:** [chall.mp3](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/Forensics/chall.mp3)

## Misc

### [Pong Puddle Procrastinator](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/Misc/Pong%20Puddle%20Procrastinator.txt) — 200 points

Step into the Cyber Intelligence Quest, where one of the contestants, caretaker, must skillfully identify and acquire specific information within a dynamic digital ecosystem, vying for top honors and prizes in the arena of information analysis.

- **Challenge:** `pongpuddle.winja.org` — port `24881`

### [Ransomware](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/Misc/Ransomware.txt) — 296 points

Our Intern ran a malware on his system. Are you smart enough to use your AI skills and reverse the encrypted files to get the flag.

- **Files:** [ransomware.zip](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/Misc/ransomware.zip), [ransomware.z01](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/Misc/ransomware.z01), [ransomware.z02](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/Misc/ransomware.z02)

## OSINT

### [Crawlwise](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/OSINT/Crawlwise.txt) — 136 points

I decided to delve deeper into AI and ML implementations, and Python seemed like the ideal language for the task. As part of my learning journey, I've curated this repository as a collection of personal notes and code snippets. Since I believe in the value of sharing knowledge, I've made the source code publicly accessible. I hope it helps others discover something new and valuable today.

- **Resource:** [CrawlWise repository](https://github.com/Winja-Events/CrawlWise)

### [Disguised Source Control](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/OSINT/Disguised%20Source%20Control.txt) — 200 points

The AI has started hiding public repositories to hide its secrets however there is still a way to access them, put your investigative skills to the test by uncovering hidden secrets within a GitHub repository using some clever Git maneuvers.

- **Resource:** [GitHub repository](https://github.com/iam-pyro/CTF)

### [Lifestyle](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/OSINT/Lifestyle.txt) — 119 points

With the arrival of the New Year comes a fresh beginning, and it is considered an excellent time for making purchases. Numerous websites offer discounts, gifts, and exchange offers. Can you provide me with the tagline used for the kid’s cloth section on the website having motto “When it comes to great style and personal expression, there should never be any regrets” on that day?

Flag format is `flag{}`. Character case will be same as obtained and have space in between.

- **Hint:** It's time to travel back.

### [Memento](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/OSINT/Memento.txt) — 100 points

Megan, who tends to be forgetful, embarked on a journey to an unfamiliar destination. While capturing memories through photographs, she encountered an unfortunate incident where one of her pictures became distorted. Now, she is eager to share this particular picture with a friend, but alas, she has completely forgotten the name of the place she visited. Would you be kind enough to assist her in recalling the forgotten location?

Flag format is `flag{NAME_OF_THE_PLACE}`. All words in caps separated by underscores.

- **File:** [challenge_picture.png](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/OSINT/challenge_picture.png)

### [TimeTrek](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/OSINT/TimeTrek.txt) — 196 points

I've written an article about AI, and I believe that the more reviewers I can engage, the richer the insights I can gather. Would you be willing to review it?

- **Article:** [View the Google Doc](https://docs.google.com/document/d/1wThMjs8Ro2IMY8K026kso5Fqtk4RsPH6rEYsESN1b8g/edit)

## PWN

### [AI Build Chain](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/PWN/AI%20Build%20Chain.txt) — 200 points

Discover the cutting-edge world of AI through our challenge centered around an AI building its own AI through a binary program. Your mission is to unravel the program's inner workings, grasp its underlying logic, and unveil the concealed output it produces. Are you up for the task of decoding the workflow within the AI Build Chain?

- **Challenge:** `aibuildchain.winja.org` — port `53782`
- **Files:** [aibuildchain](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/PWN/aibuildchain), [libc](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/PWN/libc)

### [GPT-1](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/PWN/GPT-1.txt) — 100 points

Stark Industries has started to build its own version of J.A.R.V.I.S. J.A.R.V.I.S is a noob and will give you the flag if you ask for it.

- **Challenge:** `gpt1.winja.org` — port `38576`
- **File:** [gpt](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/PWN/gpt)

## Reversing

### [Bigtactoe](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/Reversing/Bigtactoe.txt) — 184 points

A glorified tictactoe experience for you beautiful people. If you can't win against the computer Intelligence, fish a flag out of it. Good Luck!

- **Hint:** Instead of winning, you could get the flag. Positions and the encrypted sequence is all in your hands.
- **Challenge files:** [Bigtactoechall](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/Reversing/Bigtactoechall), [Bigtactoechall_arm64](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/Reversing/Bigtactoechall_arm64)
- **Challenge:** `bigtactoe.winja.org` — port `30555`

### [sl__eep](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/Reversing/sl__eep.txt) — 130 points

SL (Steam Locomotive) runs across your terminal when you type "sl" as you meant to type "ls". It's just a joke, and not useful at all but you could fish out a flag I planted somewhere in there.

- **Hint:** There might be some fun parameters to look for.
- **File:** [chall](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/Reversing/chall)

## Source Code Review

### [Black and White](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/Source%20Code%20Review/Black%20and%20White.txt) — 350 points

GenAI is now developing full fledged apps, although it doesn't care much for UI/UX. The intern seemingly used code as is they got from their AI model for their training bootcamp about java and spring concepts about collections, expressions and controllers.

- **Challenge:** [http://blackandwhite.winja.org/](http://blackandwhite.winja.org/)

### [Secure the Future](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/Source%20Code%20Review/Secure%20the%20Future.txt) — 600 points

Navigate through the intricate lines of code, uncover vulnerabilities, and enhance security. Your mission is to Secure the Future of Electron. Are you up for the challenge?

- **Source code:** [Electron Odyssey](https://github.com/p3n7a90n/Winja-Nullcon-2023/tree/main/Electron%20Odyssey)
- **Executable:** [Google Drive folder](https://drive.google.com/drive/folders/1TCFUK42amAAccZkDUMRTEG184_jDVd7N)
- **Flag instance:** [provision.winja.org](https://provision.winja.org/)

### [Unlocking Boundaries](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/Source%20Code%20Review/Unlocking%20Boundaries.txt) — 200 points

Navigate through the source code, analyze, and uncover secrets concealed within. Are you up to the task of revealing what lies beneath the surface?

- **Source code:** [Electron Scripting Adventure](https://github.com/p3n7a90n/Winja-Nullcon-2023/tree/main/Electron%20Scripting%20Adventure)
- **Executable:** [Google Drive folder](https://drive.google.com/drive/folders/1TCFUK42amAAccZkDUMRTEG184_jDVd7N)
- **Flag instance:** [provision.winja.org](https://provision.winja.org/)

## Web

### [Faulty Portal](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/Web/Faulty%20Portal.txt) — 350 points

I'm aware of a bug within the present website configuration, but unfortunately, the developers aren't available to address it. Can you find the flag before they fix it

- **Challenge:** [http://faultyportal.winja.org](http://faultyportal.winja.org)
- **Hint:** Are you trying to bruteforce Please dont because your answer lies in the documentation )

### [SculptAI](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/Web/SculptAI.txt) — 350 points

Discover the magic of real-time interactions as you construct a webpage that effortlessly fetches and presents data from a dynamic database. Unleash your creativity using HTML, CSS, and JavaScript to craft an engaging user interface that comes to life with information. Are you ready to view a seamless and interactive web experience

- **Challenge:** [http://sculptai.winja.org](http://sculptai.winja.org)
- **Hint:** Why does the page load and wait for 3 seconds after opening the page does it connect to the backend

### [Trailblazer](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/Web/Trailblazer.txt) — 175 points

Immerse yourself in a web application born from the brilliance of AI. This digital realm is a playground of challenges, meticulously woven by machine intelligence. Your mission: outsmart the very AI that birthed this intricate virtual environment.

- **Challenge:** [http://trailblazer.winja.org/](http://trailblazer.winja.org/)

### [Woodcutter](https://github.com/GTekSD/SUASS/blob/main/CTF-Labs/CTF-Winja/Web/Woodcutter.txt) — 251 points

Once upon a time in a quiet forest village, lived a woodcutter named Tom known for his exceptional axe skills. A stranger named Mr. Smith, a software engineer, approached Tom, seeking wood for his Java project, unknowingly sparking an unlikely adventure at the intersection of nature and technology.

- **Challenge:** [httpswoodcutter.winja.org](https://httpswoodcutter.winja.org)
