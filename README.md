# HW5-Text-Processing-Automation
Automated text processing pipeline using Make, gawk, and shell scripting.

[![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github)](https://github.com/SE-Spring2025-G2/HW5-Text-Processing)
![Make](https://img.shields.io/badge/Make-4.3-blue?logo=cmake&logoColor=white)
[![License: MIT](https://img.shields.io/badge/License-MIT-green)](/LICENSE)
[![DOI](https://zenodo.org/badge/931263483.svg)](https://doi.org/10.5281/zenodo.14863060)

## Table of Contents
- [Project Structure](#project-structure)
- [Installation](#installation)
- [Usage](#usage)
- [Processing Steps](#processing-steps)
- [Makefile Targets](#makefile-targets)
- [Implementation Details](#key-implementation-details)
- [Contributing](#contributing)
- [Authors](#authors)
- [License](#license)
- [Q&A](#qa)

---

## Project Structure
```
HW5-Text-Processing/
├── handin/
│ ├── Makefile # automation file
│ ├── ZZZ.awk
│ ├── cleaned.txt # Step 1 output (cleaned data)
│ ├── data.txt # Original text data
│ ├── killstopXXX.awk # Stop word removal script
│ ├── stop.txt # Step 2 output (stop words removed)
│ ├── table.txt
│ ├── top.txt # Top 10 frequent words
│ └── word_counts.txt # Frequency table generator
├── README.md
└── LICENSE
```


## Installation
1. Clone the repository:
- git clone https://github.com/SE-Spring2025-G2/HW5-Text-Processing.git
cd HW5-Text-Processing


2. Ensure required tools are installed:

### Debian/Ubuntu
sudo apt install make gawk sed grep

### macOS
brew install make gawk

---

## Usage
### Full Pipeline Execution
make all

### Individual Processing Steps
- make step1 # Clean text (output: cleaned.txt)
- make step2 # Remove stop words (output: stop.txt)
- make step3 # Identify top 10 words (output: top.txt)
- make step4 # Generate frequency table (output: table.txt)


### Clean Intermediate Files
make clean


---

## Processing Steps
1. **Text Cleaning** (`cleaned.txt`)
   - Removes punctuation
   - Converts to lowercase
   - Retains only alphabetical characters and spaces

2. **Stop Word Removal** (`stop.txt`)
   - Filters common English stop words:
     ```
     (is|the|in|but|can|a|of|to|that|it|for|on|with|as|this|was|at|by|an|be|from|or|are)
     ```

3. **Frequency Analysis** (`word_counts.txt`)
   - Counts word frequencies
   - Identifies top 10 most frequent words

4. **Frequency Table Generation** (`table.txt`)
   - Creates CSV-style table showing word counts per paragraph
   - Example output:
     ```
     challenging,do,key,and,data,example,aspect,engineering,we,
     1,0,0,0,3,0,1,0,0,
     0,1,1,2,1,1,0,0,1,
     ```

---

## Makefile Targets
| Target    | Description                          | Dependencies       |
|-----------|--------------------------------------|--------------------|
| `all`     | Run complete pipeline                | table.txt          |
| `cleaned` | Generate cleaned text                | data.txt           |
| `stop`    | Remove stop words                    | cleaned.txt        |
| `top`     | Extract top 10 words                 | word_counts.txt    |
| `table`   | Create frequency table               | cleaned.txt top.txt|
| `clean`   | Remove generated files               | N/A                |

---

## Key Implementation Details
### Automatic Variables
- `$@`: Target filename
- `$<`: First prerequisite
- `$^`: All prerequisites

### Wildcard Processing

Process all text files in dataset/
DATAFILES := $(wildcard dataset/*.txt)


### Parallel Execution
experiment:
$(foreach f, $(wildcard data/*.txt),
gawk -f process.awk $f &)


---

## Contributing
1. Fork the repository
2. Create feature branch:
- git checkout -b feature/improvement
3. Commit changes:
git commit -m "Add new feature"
4. Push to branch:
git push origin feature/improvement
5. Open a pull request

Join our [Discord Server](https://discord.gg/auXqC4gj) for discussions.

---

## Authors
- **Ayush Pathak** 
- **Keyur Gondhalekar**
- **Ayush Gala**

---

## License
This work is dual-licensed under:
- [MIT License](/LICENSE)





