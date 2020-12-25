#!/bin/sh

# Discover test suite
suite=`find . -type f -name *.test.sh | sort`

# Begin
echo "Running test suite: (`echo "$suite" | wc -l` found)"
echo "===="

# Run tests (fail fast)
for test in $suite; do
  dir=`dirname "$test"`
  file=`basename "$test"`
  (cd "$dir" && echo -n "$dir: " && . "$file" && echo " ✔")
  if [ "$?" != 0 ]; then
    echo " ❌" && exit 1
  fi
done

# Done
echo "===="
echo "Test suite complete. 👌"
