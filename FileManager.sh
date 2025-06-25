#!/bin/bash

# Function to show help
showHelp() {
    echo "Usage:"
    echo "./FileManager.sh addDir /path dirname         # Create a directory"
    echo "./FileManager.sh deleteDir /path dirname      # Delete a directory"
    echo "./FileManager.sh listFiles /path              # List only files"
    echo "./FileManager.sh listDirs /path               # List only directories"
    echo "./FileManager.sh listAll /path                # List all contents"
    echo "./FileManager.sh help                         # Show this help message"
}

# Function to create directory
addDir() {
    local path="$1"
    local name="$2"
    mkdir -p "$path/$name" && echo "Directory $name created at $path"
}

# Function to delete directory
deleteDir() {
    local path="$1"
    local name="$2"
    rm -r "$path/$name" && echo "Directory $name deleted from $path"
}

# Function to list only files
listFiles() {
    local path="$1"
    find "$path" -maxdepth 1 -type f
}

# Function to list only directories
listDirs() {
    local path="$1"
    find "$path" -maxdepth 1 -type d
}

# Function to list all contents
listAll() {
    local path="$1"
    ls -l "$path"
}

# Main command handler
case "$1" in
    addDir)
        addDir "$2" "$3"
        ;;
    deleteDir)
        deleteDir "$2" "$3"
        ;;
    listFiles)
        listFiles "$2"
        ;;
    listDirs)
        listDirs "$2"
        ;;
    listAll)
        listAll "$2"
        ;;
    help)
        showHelp
        ;;
    *)
        echo "❌ Invalid command."
        showHelp
        ;;
esac

