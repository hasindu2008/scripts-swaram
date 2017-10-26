#!/bin/bash

ansible allNoself -m shell -a "reboot" -K --become
sudo reboot

