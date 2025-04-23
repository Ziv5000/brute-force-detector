#!/bin/bash
detect_ssh_bruteforce.sh                                                                   

# Set file names
PCAP_FILE="092120.pcap"
OUTPUT_FILE="brute_force_summary.txt"

# Clear output file
> "$OUTPUT_FILE"

# Header
echo "Brute-Force SSH Attack Summary Report" >> "$OUTPUT_FILE"
echo "=====================================" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Extract and analyze SYN packets to port 22
tshark -r "$PCAP_FILE" -Y "tcp.flags.syn == 1 and tcp.dstport == 22" -T fields -e ip.src -e ip.dst | \
sort | uniq -c | sort -nr | \
awk '{ if ($1 > 5) printf "Source IP: %s\nTarget IP: %s\nSSH Attempt Count: %s\n\n", $2, $3, $1; }' >> "$OUTPUT_FILE"

echo "Analysis complete. Summary saved in $OUTPUT_FILE"
