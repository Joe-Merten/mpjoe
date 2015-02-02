#!/bin/bash -e
########################################################################################################################
# CI Server Buildskript
#-----------------------------------------------------------------------------------------------------------------------
# \project    Mpjoe
# \file       travis-test.sh
# \creation   2015-01-30, Joe Merten
#-----------------------------------------------------------------------------------------------------------------------
# Dieses Buildskript wird via travis-ci.org angeworfen
########################################################################################################################

cd ../Swing
mvn -q surefire:test
cd ..

# TODO: Android Tests
