# Brute Force SSH Detector

This project contains a Bash script designed to detect SSH brute-force attacks in PCAP files.

## Description

The script, `detect_ssh_bruteforce.sh`, processes a PCAP file and extracts SYN packets to port 22. It analyzes the source and destination IPs and counts how many times each source IP attempts to connect. If a source IP attempts more than 5 times, it is considered a potential brute-force attack.

## Usage

1. Download the `detect_ssh_bruteforce.sh` script.
2. Place your PCAP file in the same directory.
3. Run the script:

```bash
./detect_ssh_bruteforce.sh
The script will generate a summary of potential SSH brute-force attempts in a file named brute_force_summary.txt.

Requirements
tshark (part of Wireshark)

A PCAP file to analyze

License
This project is open-source and available under the MIT License.


