if [[ $1 == "set"  ]]; then
    echo "set dns for $2 to $3"
    nmcli conn modify "$2" ipv4.ignore-auto-dns yes
    if [[ $3 == "shecan" ]]; then
	first=178.22.122.100
	second=185.51.200.2
    elif [[ $3 == "radar" ]] then 
	first=10.202.10.10
	second=10.202.10.11
    elif [[ $3 == "google" ]] then
	first=8.8.8.8
    elif [[ $3 == "electro" ]] then 
	first=78.157.42.100
	second=78.157.42.101
    fi
    echo "connect to $first,$second"
    nmcli conn modify "$2" ipv4.dns "$first $second"

elif [[ $1 == "down" ]] then
    echo "change dns to default"
    nmcli conn modify "$2" ipv4.dns ""
fi
nmcli conn down "$2"
nmcli conn up "$2"
nmcli conn show "$2" | grep dns

