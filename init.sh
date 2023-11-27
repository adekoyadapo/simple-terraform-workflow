#!/bin/bash

bucket_name=${2:-bk-tf-12345-tfstate}

if [ $# -ne 1 ]; then
   echo "Usage: $0 <create | destroy>"
   exit 1
fi

if ! gsutil ls -b gs://$bucket_name > /dev/null 2>&1 && [ "$1" = "create" ]; then
     echo "Creating backend bucket $bucket_name..."
     gsutil mb gs://$bucket_name
     echo "Backend bucket $bucket_name created successfully."
elif [ "$1" = "destroy" ]; then
      if ! gsutil ls -b gs://$bucket_name > /dev/null 2>&1; then 
         echo "Backend bucket $bucket_name does not exist."
      else
        echo "Deleting backend bucket $bucket_name..."
        gsutil -m rm -r gs://$bucket_name > /dev/null 2>&1
        echo "Backend bucket $bucket_name deleted successfully."
      fi
else
   echo "Backend bucket $bucket_name already exists."
fi
