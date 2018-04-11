
tmp_dirs = \
	tmp/SCRIPTS/iNAVTX \
	tmp/SCRIPTS/TELEMETRY

$(tmp_dirs):
	mkdir -p $(tmp_dirs)

VERSION = `git describe --tags --long`

.PHONY: tmp_install
tmp_install: $(tmp_dirs)
	cp common/*.lua tmp/SCRIPTS/iNAVTX

.PHONY: all
all: X7 X9 Horus

.PHONY: X7
X7: tmp_install
	cp X7.lua tmp/SCRIPTS/TELEMETRY/iNAVTX.lua
	cd tmp && zip ../iNAVTXSetup-X7-$(VERSION).zip SCRIPTS/iNAVTX/ui.lua SCRIPTS/iNAVTX/msp_sp.lua SCRIPTS/TELEMETRY/iNAVTX.lua

.PHONY: X9
X9: tmp_install
	cp X9.lua tmp/SCRIPTS/TELEMETRY/iNAVTX.lua
	cd tmp && zip ../iNAVTXSetup-X9-$(VERSION).zip SCRIPTS/iNAVTX/ui.lua SCRIPTS/iNAVTX/msp_sp.lua SCRIPTS/TELEMETRY/iNAVTX.lua

.PHONY: Horus
Horus: tmp_install
	cp Horus.lua tmp/SCRIPTS/iNAVTX.lua
	cd tmp && zip ../iNAVTXSetup-Horus-$(VERSION).zip SCRIPTS/iNAVTX/ui.lua SCRIPTS/iNAVTX/msp_sp.lua SCRIPTS/iNAVTX.lua
