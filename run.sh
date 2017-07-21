#!/bin/sh

if ! type asadmin >/dev/null 2>&1; then
	error "GlassFish is not installed"
else
	info "GlassFish is installed"
fi

if [ ! -n "$WERCKER_ASADMIN_SUBCOMMAND" ]; then
	fail "Please specify asadmin subcommand"
fi

run() {
  if [ -e "$WERCKER_ASADMIN_PARAMETER" ]; then
    local param="${WERCKER_ASADMIN_PARAMETER}"
  fi
  echo "[env]"
  env
  echo "[pwd]"
  pwd
  echo "[ls -l]"
  ls -l
  echo "[ls -l /]"
  ls -l /

  echo "asadmin --user admin \
                --passwordfile /tmp/gfpassword \
                --interactive=false \
                ${WERCKER_ASADMIN_SUBCOMMAND} \
                ${param}"
  
  asadmin --user admin \
          --passwordfile /tmp/gfpassword \
          --interactive=false \
          "${WERCKER_ASADMIN_SUBCOMMAND}" \
	  "${param}"
}

run;
