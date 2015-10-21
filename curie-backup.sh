#!/bin/bash

rsync -azL -P --exclude='.git/' --exclude='.private_info.dmg' --exclude='.DS_Store' ~/Documents/ curie:/workspace/backup/
