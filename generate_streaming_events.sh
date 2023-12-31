echo "Generating synthetic users"
# Generate 10 fake web site users
python user_generator.py --n=10

echo "Generating synthetic events"
use_lag=$1

if [ "$use_lag" = true ] ; then
    echo "Using lag"
    python streaming_event_generator.py --project_id=$(gcloud config get-value project) -t=my_topic
else
    echo "Not using lag"
    python streaming_event_generator.py --project_id=$(gcloud config get-value project) -t=my_topic -off=1. -on=0. -l=0
fi