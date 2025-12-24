import nbformat
import glob
import sys
import argparse
from nbconvert.preprocessors import ExecutePreprocessor
import os

def verify_notebooks(execute=False, timeout=60, target_notebooks=None):
    failed = []
    if target_notebooks:
        notebooks = target_notebooks
    else:
        notebooks = sorted(glob.glob('*/*.ipynb'))
    
    if not notebooks:
        print("No notebooks found.")
        return

    message = "Testing and executing notebooks..." if execute else "Testing notebooks (integrity check)..."
    print(message)
    
    for nb_path in notebooks:
        try:
            with open(nb_path, 'r', encoding='utf-8') as f:
                nb = nbformat.read(f, as_version=4)
            
            if execute:
                relative_dir = os.path.dirname(nb_path)
                ep = ExecutePreprocessor(timeout=timeout, kernel_name='python3')
                ep.preprocess(nb, {'metadata': {'path': relative_dir}})
                
            print(f"✓ {nb_path}")
        except Exception as e:
            failed.append((nb_path, e))
            print(f"✗ {nb_path}: {e}")

    print('\n' + '='*60)
    print(f"Summary of Results:")
    print(f"Total Notebooks: {len(notebooks)}")
    print(f"Passed: {len(notebooks) - len(failed)}")
    print(f"Failed: {len(failed)}")
    
    if failed:
        print("\nFailed Notebooks:")
        for path, error in failed:
            print(f"- {path}")
        sys.exit(1)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Verify and optionally execute Jupyter notebooks.')
    parser.add_argument('notebooks', nargs='*', help='Specific notebooks to verify (default: all).')
    parser.add_argument('--execute', action='store_true', help='Execute notebooks and check for runtime errors.')
    parser.add_argument('--timeout', type=int, default=120, help='Timeout for each notebook execution in seconds.')
    
    args = parser.parse_args()
    
    target_notebooks = args.notebooks if args.notebooks else None
    verify_notebooks(execute=args.execute, timeout=args.timeout, target_notebooks=target_notebooks)
