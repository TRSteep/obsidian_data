#windows

## Виды контекстного меню
- Desktop - рабочий стол
- Drive - меню диска
- Directory - ПКМ в дереве каталогов или на самой папке
- Folder - ПКМ внутри папки по свободному месту
- File and Folder - Общее меню для папок и файлов
- File - для всех файлов
- Есть отдельное меню для каждого расширения

# System
## Menu for file
- `HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers\`
- `HKEY_CLASSES_ROOT\*\shell`
- `HKEY_CLASSES_ROOT\AllFilesystemObjects\shell`
- `HKEY_CLASSES_ROOT\AllFileSystemObjects\ShellEx\ContextMenuHandlers`

## Menu for folders
- `HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\`
- `HKEY_CLASSES_ROOT\Directory\shell`

## Menu for desktop
- `HKEY_CLASSES_ROOT\Directory\Background\shell`
- `HKEY_CLASSES_ROOT\Directory\Background\shellex\ContextMenuHandlers`

## Open With
- `Computer\HKEY_CLASSES_ROOT\*\OpenWithList`

# User
## Menu for directory USER
- `Computer\HKEY_USERS\ID\SOFTWARE\Classes\Directory\Background\shell`


---
## Software
- [ShellMenuView](https://www.nirsoft.net/utils/shell_menu_view.html) and [ShellExView](https://www.nirsoft.net/utils/shexview.html) from the NirSoft
- Easy Context Menu v1.6 (File - Clean)