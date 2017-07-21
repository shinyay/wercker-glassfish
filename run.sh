#!/bin/sh

if ! type asadmin >/dev/null 2>&1; then
	error "GlassFish is not installed"
else
	info "GlassFish is installed"
        asadmin list-commands
fi

if [ ! -n "$WERCKER_ASADMIN_SUBCOMMAND" ]; then
	fail "Please specify asadmin subcommand"
fi

run() {
  if [ -e "$WERCKER_ASADMIN_PARAMETER" ]; then
    local settings="${WERCKER_ASADMIN_PARAMETER}"
  fi

  asadmin --user admin \
          --passwordfile /tmp/gfpassword \
          --interactive=false \
          "${WERCKER_ASADMIN_SUBCOMMAND}" \
	  ${settings}
}

run;
