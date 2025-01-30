#!/bin/bash
# author = Everton Tenorio

directory=$1

# Compress logs
date_log=$(date '+%Y%m%d_%HH%MM%SS')
tar -czvf logs_archive_$date_log.tar.gz $directory

# Create or move the compressed archive to a log directory
mkdir -p log-dir
mv logs_archive_$date_log.tar.gz log-dir/

# Log the archive operation
echo -e "[$(date '+%Y-%m-%d %H:%M:%S')] Logs archived($directory): logs_archive_$date_log.tar.gz" >> log-dir/arquive.log