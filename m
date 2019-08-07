Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4C59DE00CB9; Tue,  6 Aug 2019 18:04:44 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DFE42E00BAA
	for <meta-ti@yoctoproject.org>; Tue,  6 Aug 2019 18:04:40 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 08B9C40B86;
	Wed,  7 Aug 2019 01:04:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 2m6urx8xwhIW; Wed,  7 Aug 2019 01:04:40 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E08D340BCC;
	Wed,  7 Aug 2019 01:04:38 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id E8186172308;
	Tue,  6 Aug 2019 21:04:37 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Tue,  6 Aug 2019 21:04:28 -0400
Message-Id: <1565139868-51284-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565139868-51284-1-git-send-email-denys@ti.com>
References: <1565139868-51284-1-git-send-email-denys@ti.com>
Subject: [thud/master][PATCH 2/2] pru-swuart-fw: add PRU Software UART Firmware recipe
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Aug 2019 01:04:44 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...s_uart-add-Makefile-for-building-firmware.patch | 145 +++++++++++++++++++++
 ...01-icss_uart-remove-dependency-on-PDK-CSL.patch |  54 ++++++++
 recipes-bsp/pru/pru-swuart-fw_git.bb               |  40 ++++++
 3 files changed, 239 insertions(+)
 create mode 100644 recipes-bsp/pru/pru-swuart-fw/0001-icss_uart-add-Makefile-for-building-firmware.patch
 create mode 100644 recipes-bsp/pru/pru-swuart-fw/0001-icss_uart-remove-dependency-on-PDK-CSL.patch
 create mode 100644 recipes-bsp/pru/pru-swuart-fw_git.bb

diff --git a/recipes-bsp/pru/pru-swuart-fw/0001-icss_uart-add-Makefile-for-building-firmware.patch b/recipes-bsp/pru/pru-swuart-fw/0001-icss_uart-add-Makefile-for-building-firmware.patch
new file mode 100644
index 0000000..8414d94
--- /dev/null
+++ b/recipes-bsp/pru/pru-swuart-fw/0001-icss_uart-add-Makefile-for-building-firmware.patch
@@ -0,0 +1,145 @@
+From d37359e7b2bd26da4d04fc97a94967cf457558e9 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Tue, 6 Aug 2019 19:50:59 -0400
+Subject: [PATCH] icss_uart: add Makefile for building firmware
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ firmware/icss_uart/src/Makefile | 125 ++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 125 insertions(+)
+ create mode 100644 firmware/icss_uart/src/Makefile
+
+diff --git a/firmware/icss_uart/src/Makefile b/firmware/icss_uart/src/Makefile
+new file mode 100644
+index 0000000..4764622
+--- /dev/null
++++ b/firmware/icss_uart/src/Makefile
+@@ -0,0 +1,125 @@
++# PRU_CGT environment variable must point to the TI PRU code gen tools directory. E.g.:
++#(Desktop Linux) export PRU_CGT=/path/to/pru/code/gen/tools/ti-cgt-pru_2.x.y
++#(Windows) set PRU_CGT=C:/path/to/pru/code/gen/tools/ti-cgt-pru_2.x.y
++#(ARM Linux*) export PRU_CGT=/usr/share/ti/cgt-pru
++#
++# *ARM Linux also needs to create a symbolic link to the /usr/bin/ directory in
++# order to use the same Makefile
++#(ARM Linux) ln -s /usr/bin/ /usr/share/ti/cgt-pru/bin
++
++ifndef PRU_CGT
++define ERROR_BODY
++
++*******************************************************************************
++PRU_CGT environment variable is not set. Examples given:
++(Desktop Linux) export PRU_CGT=/path/to/pru/code/gen/tools/ti-cgt-pru_2.1.2
++(Windows) set PRU_CGT=C:/path/to/pru/code/gen/tools/ti-cgt-pru_2.1.2
++(ARM Linux*) export PRU_CGT=/usr/share/ti/cgt-pru
++
++*ARM Linux also needs to create a symbolic link to the /usr/bin/ directory in
++order to use the same Makefile
++(ARM Linux) ln -s /usr/bin/ /usr/share/ti/cgt-pru/bin
++*******************************************************************************
++
++endef
++$(error $(ERROR_BODY))
++endif
++
++# PRU_SSP environment variable must point to the PRU Software Support Package. E.g.:
++#(Desktop Linux) export PRU_SSP=/path/to/pru_software_support_package
++#(Windows) set PRU_SSP=C:/path/to/pru_software_support_package
++#(ARM Linux*) export PRU_SSP=/path/to/pru_software_support_package
++
++ifndef PRU_SSP
++define ERROR_BODY
++
++*******************************************************************************
++PRU_SSP environment variable must point to the PRU Software Support Package. E.g.:
++(Desktop Linux) export PRU_SSP=/path/to/pru_software_support_package
++(Windows) set PRU_SSP=C:/path/to/pru_software_support_package
++(ARM Linux*) export PRU_SSP=/path/to/pru_software_support_package
++PRU_CGT environment variable is not set. Examples given:
++*******************************************************************************
++
++endef
++$(error $(ERROR_BODY))
++endif
++
++MKFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
++CURRENT_DIR := $(notdir $(patsubst %/,%,$(dir $(MKFILE_PATH))))
++PROJ_NAME=$(CURRENT_DIR)
++LINKER_COMMAND_FILE=./AM335x_PRU.cmd
++LIBS=--library=$(PRU_SSP)/lib/rpmsg_lib.lib
++INCLUDE=--include_path=$(PRU_SSP)/include --include_path=$(PRU_SSP)/include/am335x
++STACK_SIZE=0x100
++HEAP_SIZE=0x100
++GEN_DIR=gen
++
++#Common compiler and linker flags (Defined in 'PRU Optimizing C/C++ Compiler User's Guide)
++CFLAGS=-v3 -o2 --display_error_number --endian=little --hardware_mac=on --asm_directory=$(GEN_DIR) --obj_directory=$(GEN_DIR) --pp_directory=$(GEN_DIR) -ppd -ppa -DICSS_REV2
++#Linker flags (Defined in 'PRU Optimizing C/C++ Compiler User's Guide)
++LFLAGS=--reread_libs --warn_sections --stack_size=$(STACK_SIZE) --heap_size=$(HEAP_SIZE)
++
++TARGET=$(GEN_DIR)/$(PROJ_NAME).out
++MAP=$(GEN_DIR)/$(PROJ_NAME).map
++OBJECTS=$(patsubst %.asm,$(GEN_DIR)/%.object,$(wildcard *.asm))
++OBJECTS+=$(patsubst %.c,$(GEN_DIR)/%.object,$(wildcard *.c))
++
++
++all: printStart $(TARGET) printEnd
++
++printStart:
++	@echo ''
++	@echo '************************************************************'
++	@echo 'Building project: $(PROJ_NAME)'
++
++printEnd:
++	@echo ''
++	@echo 'Output files can be found in the "$(GEN_DIR)" directory'
++	@echo ''
++	@echo 'Finished building project: $(PROJ_NAME)'
++	@echo '************************************************************'
++	@echo ''
++
++# Invokes the linker (-z flag) to make the .out file
++$(TARGET): $(OBJECTS) $(LINKER_COMMAND_FILE)
++	@echo ''
++	@echo 'Building target: $@'
++	@echo 'Invoking: PRU Linker'
++	$(PRU_CGT)/bin/clpru $(CFLAGS) -z -i$(PRU_CGT)/lib -i$(PRU_CGT)/include $(LFLAGS) -o $(TARGET) $(OBJECTS) -m$(MAP) $(LINKER_COMMAND_FILE) --library=libc.a $(LIBS)
++	@echo 'Finished building target: $@'
++
++# Invokes the compiler on all assembly files in the directory to create the object files
++$(GEN_DIR)/%.object: %.asm
++	@mkdir -p $(GEN_DIR)
++	@echo ''
++	@echo 'Building file: $<'
++	@echo 'Invoking: PRU Compiler'
++	$(PRU_CGT)/bin/clpru --include_path=$(PRU_CGT)/include $(INCLUDE) $(CFLAGS) -fe $@ $<
++
++# Invokes the compiler on all c files in the directory to create the object files
++$(GEN_DIR)/%.object: %.c
++	@mkdir -p $(GEN_DIR)
++	@echo ''
++	@echo 'Building file: $<'
++	@echo 'Invoking: PRU Compiler'
++	$(PRU_CGT)/bin/clpru -k --include_path=$(PRU_CGT)/include $(INCLUDE) $(CFLAGS) -fe $@ $<
++
++.PHONY: all clean
++
++# Remove the $(GEN_DIR) directory
++clean:
++	@echo ''
++	@echo '************************************************************'
++	@echo 'Cleaning project: $(PROJ_NAME)'
++	@echo ''
++	@echo 'Removing files in the "$(GEN_DIR)" directory'
++	@rm -rf $(GEN_DIR)
++	@echo ''
++	@echo 'Finished cleaning project: $(PROJ_NAME)'
++	@echo '************************************************************'
++	@echo ''
++
++# Includes the dependencies that the compiler creates (-ppd and -ppa flags)
++-include $(OBJECTS:%.object=%.pp)
++
+-- 
+2.7.4
+
diff --git a/recipes-bsp/pru/pru-swuart-fw/0001-icss_uart-remove-dependency-on-PDK-CSL.patch b/recipes-bsp/pru/pru-swuart-fw/0001-icss_uart-remove-dependency-on-PDK-CSL.patch
new file mode 100644
index 0000000..b565ba0
--- /dev/null
+++ b/recipes-bsp/pru/pru-swuart-fw/0001-icss_uart-remove-dependency-on-PDK-CSL.patch
@@ -0,0 +1,54 @@
+From 1b853cfd6194d3855310f47d43cb8c9f498b6182 Mon Sep 17 00:00:00 2001
+From: Bin Liu <b-liu@ti.com>
+Date: Wed, 27 Feb 2019 14:38:43 -0600
+Subject: [PATCH] icss_uart: remove dependency on PDK/CSL
+
+Signed-off-by: Bin Liu <b-liu@ti.com>
+---
+ firmware/icss_uart/src/icss_ctrl_regs.h | 32 ++++----------------------------
+ 1 file changed, 4 insertions(+), 28 deletions(-)
+
+diff --git a/firmware/icss_uart/src/icss_ctrl_regs.h b/firmware/icss_uart/src/icss_ctrl_regs.h
+index ce640f5..99ec90d 100644
+--- a/firmware/icss_uart/src/icss_ctrl_regs.h
++++ b/firmware/icss_uart/src/icss_ctrl_regs.h
+@@ -39,32 +39,8 @@
+     .if    !$isdefed("__icss_ctrl_regs_h")
+ __icss_ctrl_regs_h    .set 1
+ 
+-    .cdecls C,NOLIST
+-%{
+-#include "cslr_icss.h"
+-%}
+-
+-    .if $defined("ICSS_REV1")
+-ICSS_PRU_CTRL_CONTROL       .set    (CSL_ICSSM_PRU_CTRL_CONTROL)
+-ICSS_PRU_CTRL_STATUS        .set    (CSL_ICSSM_PRU_CTRL_STATUS)
+-ICSS_PRU_CTRL_WAKEUP_EN     .set    (CSL_ICSSM_PRU_CTRL_WAKEUP_EN)
+-ICSS_PRU_CTRL_CYCLE         .set    (CSL_ICSSM_PRU_CTRL_CYCLE)
+-ICSS_PRU_CTRL_STALL         .set    (CSL_ICSSM_PRU_CTRL_STALL)
+-ICSS_PRU_CTRL_CTBIR0        .set    (CSL_ICSSM_PRU_CTRL_CTBIR0)
+-ICSS_PRU_CTRL_CTBIR1        .set    (CSL_ICSSM_PRU_CTRL_CTBIR1)
+-ICSS_PRU_CTRL_CTPPR0        .set    (CSL_ICSSM_PRU_CTRL_CTPPR0)
+-ICSS_PRU_CTRL_CTPPR1        .set    (CSL_ICSSM_PRU_CTRL_CTPPR1)
+-    .endif  ;ICSS_REV1
+-
+-    .if $defined("ICSS_REV2")
+-ICSS_PRU_CTRL_CONTROL       .set    (CSL_ICSSPRUCTRL_CONTROL)
+-ICSS_PRU_CTRL_STATUS        .set    (CSL_ICSSPRUCTRL_STATUS)
+-ICSS_PRU_CTRL_WAKEUP_EN     .set    (CSL_ICSSPRUCTRL_WAKEUP_EN)
+-ICSS_PRU_CTRL_CYCLE         .set    (CSL_ICSSPRUCTRL_CYCLE)
+-ICSS_PRU_CTRL_STALL         .set    (CSL_ICSSPRUCTRL_STALL)
+-ICSS_PRU_CTRL_CTBIR0        .set    (CSL_ICSSPRUCTRL_CTBIR0)
+-ICSS_PRU_CTRL_CTBIR1        .set    (CSL_ICSSPRUCTRL_CTBIR1)
+-ICSS_PRU_CTRL_CTPPR0        .set    (CSL_ICSSPRUCTRL_CTPPR0)
+-ICSS_PRU_CTRL_CTPPR1        .set    (CSL_ICSSPRUCTRL_CTPPR1)
+-    .endif  ;ICSS_REV2
++ICSS_PRU_CTRL_CONTROL       .set    (0x0U)
++ICSS_PRU_CTRL_STATUS        .set    (0x4U)
++ICSS_PRU_CTRL_WAKEUP_EN     .set    (0x8U)
++ICSS_PRU_CTRL_CYCLE         .set    (0xcU)
+     .endif
+-- 
+2.7.4
+
diff --git a/recipes-bsp/pru/pru-swuart-fw_git.bb b/recipes-bsp/pru/pru-swuart-fw_git.bb
new file mode 100644
index 0000000..e22b3be
--- /dev/null
+++ b/recipes-bsp/pru/pru-swuart-fw_git.bb
@@ -0,0 +1,40 @@
+SUMMARY = "Programmable Real-time Unit Software UART Firmware"
+LICENSE = "BSD-3-Clause"
+
+LIC_FILES_CHKSUM = "file://COPYING.txt;beginline=1;endline=31;md5=94b6a199da1caf777f6756cb70aca4a7"
+
+require recipes-ti/includes/ti-paths.inc
+
+COMPATIBLE_MACHINE = "ti33x"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+# Below commit ID corresponds to "DEV.UART_LLD.01.00.00.15"
+SRCREV = "4493f456549c85749a05b1f46bf0b75d23976db1"
+
+PV = "01.00.00.15"
+
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/keystone-rtos/uart-lld.git;protocol=git;branch=${BRANCH} \
+	file://0001-icss_uart-add-Makefile-for-building-firmware.patch \
+	file://0001-icss_uart-remove-dependency-on-PDK-CSL.patch \
+"
+
+DEPENDS = "ti-cgt-pru-native pru-icss"
+
+S = "${WORKDIR}/git"
+
+export PRU_CGT = "${TI_CGT_PRU_INSTALL_DIR}"
+export PRU_SSP = "${STAGING_DIR_TARGET}/usr"
+
+do_compile() {
+	oe_runmake -C firmware/icss_uart/src
+}
+
+do_install() {
+	install -d ${D}/lib/firmware/ti-pruss
+	install -m 0644 ${S}/firmware/icss_uart/src/gen/src.out ${D}/lib/firmware/ti-pruss/pru_swuart-fw.elf
+}
+
+FILES_${PN} = "/lib/firmware"
+
+INSANE_SKIP_${PN} = "arch"
-- 
2.7.4


