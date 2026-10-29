
#!/bin/bash

set -e

echo "Starting Android bug report analysis..."

# Create a directory for the bug report

echo "Creating a directory for the bug report..."

folder="bugreport"

if [ ! -d "$folder" ]; then
    mkdir "$folder"
else
    echo "Directory '$folder' already exists. Please remove it or choose a different name."
    exit 1
fi

cd bugreport

# Generate the Android bug report

echo "Generating the Android bug report..."
adb bugreport bugreport.zip

# Download Indicators of Compromise (IOCs)

echo "Downloading Indicators of Compromise (IOCs)...)"
mvt-android download-iocs

# Analyze the bug report and save results
mkdir -p results
mvt-android check-bugreport --output results bugreport.zip

echo "Analysis complete. Results saved in the 'results' directory."





