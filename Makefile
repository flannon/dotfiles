SETUPFILE = build.sh
CONFIGFILE = config.sh
CONFIGDELLFILE = config-dell.sh

.PHONY: config
config:
	./${CONFIGFILE}

.PHONY: setup
setup:
	./${SETUPFILE}

.PHONY: setup-dell
setup-dell:
	./${SETUPDELLFILE}

