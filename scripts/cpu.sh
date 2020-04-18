#! /bin/bash
mostUsedCPU=$(ps -axCo args,pcpu -r | head -n 2 | tail -n1 | tail -c 40)
echo "☷ $mostUsedCPU%"
