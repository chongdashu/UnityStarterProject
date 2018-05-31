#!/bin/sh

UNITY_SDK_ROOT=$1

if [ -z "$UNITY_SDK_ROOT" ]
then
  echo "\${UNITY_SDK_ROOT} is not set."
  echo "Please set it either by passing it as an argument or modify the \${UNITY_SDK_ROOT} variable in this file."
  exit 1
fi

if [ ! -d "$UNITY_SDK_ROOT" ]
then 
  echo "The path for \${UNITY_SDK_ROOT}=${UNITY_SDK_ROOT} is invalid or does not exist."
  exit 1
fi

UNITY_SDK_ASSETS_ROOT=$1\/Assets
UNITY_SDK_IMPROBABLE_ROOT=$1\/Improbable

if [ ! -d "$UNITY_SDK_ASSETS_ROOT" ]
then
  echo "Was not able to find 'Assets' folder in location for Unity SDK."
  exit 1
fi

if [ ! -d "$UNITY_SDK_IMPROBABLE_ROOT" ]
then 
  echo "Was not able to find 'Improbable' folder in location for Unity SDK."
  exit 1
fi

echo "Copying contents of Unity SDK's 'Assets' folder..."
cp -r ${UNITY_SDK_ASSETS_ROOT}/. workers/unity/Assets/

echo "Copying contents of Unity SDK's 'Improbable' folder..."
cp -r ${UNITY_SDK_IMPROBABLE_ROOT} workers/unity

