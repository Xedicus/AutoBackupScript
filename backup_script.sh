
#!/bin/sh

cat <<"EOF"

                                                                     
 ad88888ba        db  8b           d8 88   ,ad8888ba,   88888888ba   
d8"     "8b      d88b `8b         d8' 88  d8"'    `"8b  88      "8b  
Y8,             d8'`8b `8b       d8'  88 d8'        `8b 88      ,8P  
`Y8aaaaa,      d8'  `8b `8b     d8'   88 88          88 88aaaaaa8P'  
  `"""""8b,   d8YaaaaY8b `8b   d8'    88 88          88 88""""88'    
        `8b  d8""""""""8b `8b d8'     88 Y8,        ,8P 88    `8b    
Y8a     a8P d8'        `8b `888'      88  Y8a.    .a8P  88     `8b   
 "Y88888P" d8'          `8b `8'       88   `"Y8888Y"'   88      `8b 

                       By X3d1cu$
EOF

###########  Backup Folder

backup_dir=backup
mkdir -p $backup_dir

##########  Fonction for selecting files to be saved

select_files(){
echo "Select files to be saved separated by space please"
read -r files 
}

######### Fonction for creating multiple backups

manage_backups(){

echo "Multiple backups program"
echo "1.Create a new backup"
echo "2.Backup list"
echo "3.Backup Restore"
read -p "Select a number" number

case $number in
1)
 create_backup;;
2)
 list_backups;;
3)
 restore_backup;;
*)
 echo "Invalid Option"
 ;;
 esac
 }
 
 ########       Fonction to create a new backup
 create_backup(){
 timestamp=$(date +"%Y%m%d%H%M%S")
 backup_name="backup_$timestamp"
 tar -cvf "$backup_dir/$backup_name.tar" $files
 echo "Backup created with success: $backup_name"
 }
 
 
 ########       Fonction to list backups
 list_backups(){
 
 echo "This is the backup list"
 ls -lh $backup_dir
 }
 
 #######        Fonction to restore backup
 restore_backup(){
 list_backups
 read -r restore_name
 tar -xvf "$backup_dir/$restore_name"
 echo "Backup restored with success:$restore_name"
 }
 
 #######       Main
 
 select_files
 manage_backups

