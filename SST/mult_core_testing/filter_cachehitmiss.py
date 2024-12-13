import os
import glob

'''
Helper function to filter out cache hit asnd miss statistics from SST log output files.
'''
def extract_cache_stats():
    # Define keywords to filter
    keywords = ["CacheMisses", "CacheHits", "streamCPU", "Completed", "simulated time"]
    
    output_dir = "~/scratch/src/sst-elements-library-14.0.0/src/sst/elements/memHierarchy/tests"
    output_dir = os.path.expanduser(output_dir)
    os.makedirs(output_dir, exist_ok=True)

    output_file = os.path.join(output_dir, "filtered_output.txt")

    with open(output_file, "w") as outfile:
        for log_file in glob.glob(os.path.join(output_dir, "*.log")):
            with open(log_file, "r") as infile:
                matching_lines = []
                for line in infile:
                    if any(keyword in line for keyword in keywords):
                        matching_lines.append(line)

                if matching_lines:
                    outfile.write(f"--- {log_file} ---\n")
                    outfile.writelines(matching_lines)
                    outfile.write("\n")
                    outfile.write("-------------------------------")
                    outfile.write("\n\n")

    print(f"Filtered lines with 'CacheMisses' and 'CacheHits' have been saved to '{output_file}'.")



extract_cache_stats()
