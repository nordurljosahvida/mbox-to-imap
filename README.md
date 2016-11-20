# mbox-to-imap
A truly recursive mbox to imap uploader

# Background
You might have figured out by now that there's absolutely no straightforward way to move all of your old emails to your brand new IMAP account. You might have tons of Apple Mail local folders from the old days, or some left over stuff from your old POP mailserver configuration, or whatever export you did before y2k. Now is the time to migrate everything to your new mailserver. Do so with mbox-to-imap and enjoy the rest of your day.

# History
mbox-to-imap is an expansion of [imap_upload](https://github.com/rgladwell/imap-upload) that scans for a standard mbox structure on your local computer and uploads your entire email collection to IMAP recreating the same folder hierarchy on the server. It is written for Mac but will be tested on linux in the near future.

# Requirements
## Structure
The structure should be like the following:

```
export/
  Folder A.mbox
  Folder B/
    SubFolder B1.mbox
  Folder B.mbox
  Folder C/
    SubFolder C1/
      SubSubFolder C1-1.mbox
    SubFolder C1.mbox
```

The export from very many mail clients can be done via [Emailchemy](http://weirdkid.com/emailchemy/) [not affiliated with me and not free software] and must be done in a standard mbox export format. All exported data must be placed inside the export/ subdirectory inside the mbox-to-imap directory.

## Mailboxes

The individual mailboxes' names must meet these requirements:

  – Must include only these characters: A-Z letters, numbers, periods, dashes, and spaces
  
  – Must not end with a period

## Imap server

The imap server must meet these requirements:

  – Must support TLS [SSL]

  – Must use the period [.] character as the separator

# Limitations

  — The mailboxes names must not contain the period [.] character

  – Only works until 4 levels of subdirectories as in this diagram:
  
```
export/
  Folder.mbox                 # this is ok
  SubFolder/
    SubFolder.mbox            # this is ok
    Sub2Folder/
      Sub2Folder.mbox         # this is ok
      Sub3Folder/
        Sub3Folder.mbox       # this is ok
        Sub4Folder/
          Sub4Folder.mbox     # this is ok
          Sub5Folder/
            Sub5Folder.mbox   # this is NOT ok
```

# Usage

1] Place all of your standard mbox data inside the export/ subdirectory inside the mbox-to-imap directory

2] Edit the config file with your IMAP server details and account credentials

3] Open the terminal and execute the mbox-to-imap.sh script

4] Have fun and take care of your email! :)
