#test
```dataview
  TABLE without id
  dateformat(this.file.ctime, "dd.MM.yyyy HH:mm") as created,
  dateformat(this.file.mtime, "dd.MM.yyyy HH:mm") as "last modified" 
  WHERE file.name = this.file.name
```
I create with note for test Data View