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
    param="${WERCKER_ASADMIN_PARAMETER}"
  fi
  echo "[WERCKER_ASADMIN_PARAMETER]"
  echo "${param}"

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
