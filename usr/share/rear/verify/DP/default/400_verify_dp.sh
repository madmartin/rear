# 400_verify_dp.sh
# read Data Protector vars from config file

CELL_SERVER="`cat /etc/opt/omni/client/cell_server`"
OMNICHECK=/opt/omni/bin/omnicheck

# the Cell Manager must be configured on the client
[ "${CELL_SERVER}" ]
StopIfError "Data Protector Cell Manager TCPSERVERADDRESS not set in /etc/opt/omni/client/cell_server"

# check that the Cell Manager is responding on the INET port
${OMNICHECK} -patches -host ${CELL_SERVER}
StopIfError "Data Protector Cell Manager is not responding, error code $?.
See $RUNTIME_LOGFILE for more details."
