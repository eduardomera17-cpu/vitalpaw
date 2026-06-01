# scratch/scratch_search.py
import re

with open("documentacion_proyecto.html", "r", encoding="utf-8", errors="ignore") as f:
    content = f.read()

# Let's find all headers
headers = re.findall(r'<h[1-4][^>]*>(.*?)</h[1-4]>', content, re.IGNORECASE)
for h in headers[:100]:
    print(h)
