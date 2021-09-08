# This script will install trueline on bash.
# Visit https://github.com/petobens/trueline for more information.

# If trueline is already configured in .bashrc, print a warning and exit.
grep_result=$(grep trueline ~/.bashrc | wc -l)
if [ "$grep_result" -ne "0" ]; then
    echo "Looks like trueline is already configured. Take a look and try again."
    exit 1
fi

# Get trueline source.
if [ ! -f "./trueline.sh" ]; then
wget https://raw.githubusercontent.com/dlguswo333/trueline/master/trueline.sh -P ./
fi

# Export configurations before sourcing trueline.
echo "
declare -A TRUELINE_COLORS=(
    ['deep_green']='20;140;50'
    ['blue']='30;160;220'
)

declare -a TRUELINE_SEGMENTS=(
    'venv,white,purple,normal'
    'user,white,blue,normal'
    'working_dir,white,deep_green,normal'
    'git,black,white,normal'
    'bg_jobs,black,white,bold'
)
" >> ~/.bashrc

# Source trueline.
echo "source $PWD/trueline.sh
" >> ~/.bashrc
