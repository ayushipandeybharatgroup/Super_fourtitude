#!/bin/bash

ninja_group="ninjateam"

# Create ninja group only if not already created (basic way)
if ! grep "$ninja_group" /etc/group; then
  groupadd $ninja_group
fi

case "$1" in
  addTeam)
    groupadd "$2"
    echo "✅ Team '$2' created."
    ;;

  addUser)
    username="$2"
    team="$3"

    useradd -m -G "$team","$ninja_group" "$username"

    # Set home permissions
    chmod 751 /home/$username

    # Create shared folders
    mkdir /home/$username/team
    mkdir /home/$username/ninja

    # Team folder: full access to team members
    chown $username:$team /home/$username/team
    chmod 770 /home/$username/team

    # Ninja folder: full access to ninjateam
    chown $username:$ninja_group /home/$username/ninja
    chmod 770 /home/$username/ninja

    echo "✅ User '$username' added to team '$team'."
    ;;

  changeShell)
    chsh -s "$3" "$2"
    echo "🔁 Shell changed for '$2' to '$3'."
    ;;

  changePasswd)
    passwd "$2"
    ;;

  delUser)
    userdel -r "$2"
    echo "🗑️ User '$2' deleted."
    ;;

  delTeam)
    groupdel "$2"
    echo "🗑️ Team '$2' deleted."
    ;;

  ls)
    if [ "$2" = "User" ]; then
      echo "👥 Users:"
      cut -d: -f1 /etc/passwd
    elif [ "$2" = "Team" ]; then
      echo "👥 Teams:"
      cut -d: -f1 /etc/group
    else
      echo "❗Use 'User' or 'Team'"
    fi
    ;;

  *)
    echo "Usage: $0 {addTeam|addUser|changeShell|changePasswd|delUser|delTeam|ls}"
    ;;
esac

