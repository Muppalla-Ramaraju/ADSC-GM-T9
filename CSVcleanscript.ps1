# Load the CSV file into a PowerShell variable
$data = Import-Csv 'D:\ADSCGM\mergedcsv.csv'

# Create an empty list to store unique values of the specified column
$uniqueValues = @()

# Iterate over each row in the CSV data
foreach ($row in $data) {
    # Check if the value in the specified column is not in the list of unique values
    if (-not $uniqueValues.Contains($row.column_name)) {
        # Add the value to the list of unique values
        $uniqueValues += $row.column_name
    }
}

# Create a new array to store rows where the value in the specified column is unique
$cleanedData = @()

# Iterate over each row in the CSV data
foreach ($row in $data) {
    # Check if the value in the specified column is unique
    if ($uniqueValues -contains $row.column_name) {
        # Add the row to the cleaned data array
        $cleanedData += $row
    }
}

# Convert the cleaned data array back to CSV format and save it to a new file
$cleanedData | Export-Csv 'D:\ADSCGM\final_cleaned_file.csv' -NoTypeInformation
