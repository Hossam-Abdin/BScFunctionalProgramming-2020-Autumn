# Start Guide
## This is a guide to installing the Clean programming language on your machine and writing your first program.

## Feel to contact us if this did not work for you.

## Windows
- Download the aprropiate package for your machine ([32bit](https://ftp.cs.ru.nl/Clean/Clean30/windows/Clean_3.0_32.zip) or [64bit](https://ftp.cs.ru.nl/Clean/Clean30/windows/Clean_3.0_64.zip)).
- Unzip the package to your top level `C:/` directory.
- Click and run `CleanIDE.exe`
- Create a new file from the `File` menu *(on the top left of the screen)*.
  - You must type in the `.icl` extension manually.
- Create a new project from the `File` menu *(on the top left of the screen)*.
  - The extension should be `.prj`
  - *(note : the names of the project and the file should be the same)*
- Write the following in the file to test your enviroment:
```
module your_filename
import StdEnv
Start = "Hello World!"
```
- Run the program via the top left menu via `Project` -> `Update and Run` or with the shortcut `Ctrl + R`
## Linux and Mac
- Download the aprropiate package for your machine
  - [Linux(32bit)](https://ftp.cs.ru.nl/Clean/Clean30/linux/clean3.0_32.tar.gz)
  - [Linux(64bit)](https://ftp.cs.ru.nl/Clean/Clean30/linux/clean3.0_64.tar.gz)
  - [Mac](https://ftp.cs.ru.nl/Clean/Clean30/macosx/clean3.0.zip)
- Unzip it inside the "Documents" folder.
  - In Linux, use the command:
```
tar -xzvf ~/Documents/clean3.0_32.tar.gz
```
- Open the terminal and execute following commands:
```
echo 'alias clm="~/Documents/clean/bin/clm" ' >> ~/.bashrc && cd Documents/clean && make && source ~/.bashrc
```
 - Open your preferred text editor and write:
```
module your_filename
import StdEnv
Start = "Hello World!"
```
 - You can compile and run your file by writing this command to the terminal
   - Keep in mind that the `clm` command requires only the module name. Do not include the `.icl` extension.
```
clm your_filename && ./a.out
```
