import nbformat
import glob
import sys

def verify_notebooks():
    failed = []
    notebooks = glob.glob('*/*.ipynb')
    
    if not notebooks:
        print("No notebooks found.")
        return

    print("Testing notebooks...")
    for nb_path in notebooks:
        try:
            with open(nb_path, 'r', encoding='utf-8') as f:
                nbformat.read(f, as_version=4)
            print(f"✓ {nb_path}")
        except Exception as e:
            failed.append((nb_path, e))
            print(f"✗ {nb_path}: {e}")

    print('\n' + '='*60)
    print(f"Passed: {len(notebooks) - len(failed)}")
    print(f"Failed: {len(failed)}")
    
    if failed:
        sys.exit(1)

if __name__ == "__main__":
    verify_notebooks()
