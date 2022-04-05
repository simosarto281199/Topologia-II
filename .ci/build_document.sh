set -e
echo "Building document"
make pdf
mkdir public
mv build/2022_Topology_II.pdf public
mv build/2022_Topology_II.log public
cd public/
if ! command -v tree &> /dev/null
then
  echo "No tree utility found, skipping making tree"
else
  tree -H '.' -I "index.html" -D --charset utf-8 -T "Topology II" > index.html
fi
