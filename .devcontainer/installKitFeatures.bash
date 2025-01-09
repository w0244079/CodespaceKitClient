#!/bin/bash

# If the folder that was opened is a kit (.kit exists) install the kit features.
if [ -d .kit ] && [ "$(pwd)" != "/home/$USER" ]; then
  echo ".kit folder found"
  .kit/install-features-into-client/run.sh
else
  echo ".kit folder not found"
fi

# Run a new shell to pickup the changes.
exec /bin/bash
