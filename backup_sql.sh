#!/bin/bash
mysqldump -u api -p'S7dy89%r' admin_api_production | ssh ramsy@dcgs.nl -p 222 mysql -u verhoeven-logs -p'aotN%513' admin_verhoeven-logs

