import pandas as pd

def main():
    # files: dim_branch.csv, dim_user.csv, fct_credit_pack_purchases.csv, fct_membership_purchases.csv, fct_client_conversion_events_part_2.csv
    input_file_path = "data/dim_branch.csv"  # Update this path as necessary

    try:
        df = pd.read_csv(input_file_path)

    except Exception as e:
        print(f"An unexpected error occurred: {e}")

if __name__ == "__main__":
    main()