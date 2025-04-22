import re
import numpy as np
import matplotlib.pyplot as plt
import sys
import os


def collection_decision(file_path):
    lv_decision_counts_based_on_VF = {}
    the_final_decision = {}

    with open(file_path, 'r') as file:
        for line in file:
            match_final_selecting_VF = re.search(
                r'LV: Selecting VF: (vscale x \d+|\d+)', line)

            # Process decisions
            match = re.search(r'LV: Decision: (.+)', line)
            if match:
                decision = match.group(1).strip()
                next_line = next(file, None)
                if next_line is not None:
                    match_VF = re.search(
                        r'Found an estimated cost of (\d+) for VF (vscale x \d+|\d+) For instruction:', next_line)
                    if match_VF:
                        VF = match_VF.group(2)
                        if decision not in lv_decision_counts_based_on_VF:
                            lv_decision_counts_based_on_VF[decision] = {}
                        if VF not in lv_decision_counts_based_on_VF[decision]:
                            lv_decision_counts_based_on_VF[decision][VF] = 0
                        lv_decision_counts_based_on_VF[decision][VF] += 1

            # Process final VF selection
            if match_final_selecting_VF:
                selecting_VF = match_final_selecting_VF.group(1).strip()
                print(f"Found selecting VF: {selecting_VF}")
                print(f"Current decisions: {lv_decision_counts_based_on_VF}")

                for decision, vf_counts in lv_decision_counts_based_on_VF.items():
                    print(
                        f"Checking decision {decision} with VFs: {vf_counts}")
                    for vf, count in vf_counts.items():
                        if selecting_VF == vf:
                            if decision not in the_final_decision:
                                the_final_decision[decision] = 0
                            the_final_decision[decision] += count
                            print(
                                f"Matched! Adding {decision}: {count}, Total: {the_final_decision[decision]}")

                lv_decision_counts_based_on_VF.clear()

    # Debug prints for verification
    print(f"\nSummary for {file_path}:")
    print(f"Final decisions: {the_final_decision}\n")

    return the_final_decision


def plot_decisions(all_results, output_file):
    # Get unique decisions across all files
    all_decisions = set()
    for result in all_results.values():
        all_decisions.update(result.keys())

    # Check if there are any decisions to plot
    if not all_decisions:
        print("Warning: No decisions found in any of the files!")
        return

    # Convert to sorted list for consistent ordering
    decisions_list = sorted(list(all_decisions))
    files_list = sorted(list(all_results.keys()))

    # Prepare data for plotting
    x = np.arange(len(files_list))
    width = 0.5 / len(decisions_list)

    # Create figure with appropriate size
    plt.figure(figsize=(15, 8))

    # For each file, track the maximum value and its position
    max_values = {}    # Store max value for each x position
    max_positions = {}  # Store the bar position of max value

    # Plot bars for each decision
    for idx, decision in enumerate(decisions_list):
        counts = [all_results[file].get(decision, 0) for file in files_list]
        bars = plt.bar(x + idx * width, counts, width, label=decision, alpha=1)

        # Track maximum values
        for i, value in enumerate(counts):
            if i not in max_values or value > max_values[i]:
                max_values[i] = value
                max_positions[i] = bars[i].get_x() + bars[i].get_width()/2

    # Add only the maximum value labels
    for i, max_val in max_values.items():
        if max_val > 0:    # Only show label if value is greater than 0
            plt.text(max_positions[i], max_val, int(max_val),
                     ha='center', va='bottom')

    plt.xlabel('Files')
    plt.ylabel('Count')
    plt.title('Decision Counts Across Files')
    plt.xticks(x + width * len(decisions_list) / 2,
               [f.split('_')[1] if f.startswith('riscv_') else f.split('/')[-1].split('_')[0] for f in files_list], rotation=45)
    plt.legend(bbox_to_anchor=(1.05, 1), loc='upper left')
    plt.tight_layout()

    # Save the plot
    plt.savefig(f"{output_file}_histogram.png", bbox_inches='tight', dpi=300)
    plt.close()


if __name__ == '__main__':
    if len(sys.argv) != 3:
        print("Usage: python collect_decision.py <directory_path> <output_file>")
        sys.exit(1)

    # Get the directory path from command line argument
    directory_path = sys.argv[1]
    # Get the output file path from command line argument
    output_file = sys.argv[2]

    # Store results for all files
    all_results = {}

    # Iterate over all files in the specified directory
    for filename in os.listdir(directory_path):
        file_path = os.path.join(directory_path, filename)
        if os.path.isfile(file_path) and filename.endswith('.log'):
            print(f"Processing file: {filename}")
            # Collect results for this file
            all_results[file_path] = collection_decision(file_path)

    # Write results to text file
    with open(output_file, 'w') as out_file:
        for file_path, results in all_results.items():
            out_file.write(f"Results for {file_path}:\n")
            for decision, count in results.items():
                out_file.write(f"{decision}: {count}\n")
            out_file.write("\n")

    # Create histogram plot
    plot_decisions(all_results, output_file)
    plot_decisions(all_results, output_file)
