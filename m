Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.20758.1643238548156613241
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 26 Jan 2022 15:09:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1199240CC4;
	Wed, 26 Jan 2022 23:09:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bHJBUKvTTT1p; Wed, 26 Jan 2022 23:09:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E46CB40CB6;
	Wed, 26 Jan 2022 23:09:05 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 03F1117472A;
	Wed, 26 Jan 2022 18:09:04 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [RFC][master][PATCH 02/19] x-load: remove deprecated first stage X-Loader bootloader
Date: Wed, 26 Jan 2022 18:08:42 -0500
Message-Id: <1643238539-20686-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643238539-20686-1-git-send-email-denis@denix.org>
References: <1643238539-20686-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@konsulko.com>

X-Loader was originally used on OMAP3/4 platforms, but eventually got
replaced by U-boot SPL.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-bsp/x-load/signgp.bb                       |  20 ---
 recipes-bsp/x-load/signgp/signGP.c                 | 108 ------------
 recipes-bsp/x-load/x-load.inc                      |  58 -------
 .../x-load/x-load/0001-Beagle-Rev-C5-support.patch |  60 -------
 recipes-bsp/x-load/x-load/panda-frefclk.patch      | 193 ---------------------
 recipes-bsp/x-load/x-load_1.46-psp.bb              |  38 ----
 recipes-bsp/x-load/x-load_git.bb                   |  22 ---
 7 files changed, 499 deletions(-)
 delete mode 100644 recipes-bsp/x-load/signgp.bb
 delete mode 100644 recipes-bsp/x-load/signgp/signGP.c
 delete mode 100644 recipes-bsp/x-load/x-load.inc
 delete mode 100644 recipes-bsp/x-load/x-load/0001-Beagle-Rev-C5-support.patch
 delete mode 100644 recipes-bsp/x-load/x-load/panda-frefclk.patch
 delete mode 100644 recipes-bsp/x-load/x-load_1.46-psp.bb
 delete mode 100644 recipes-bsp/x-load/x-load_git.bb

diff --git a/recipes-bsp/x-load/signgp.bb b/recipes-bsp/x-load/signgp.bb
deleted file mode 100644
index 479e6f8..0000000
--- a/recipes-bsp/x-load/signgp.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-LICENSE = "BSD-3-Clause"
-DESCRIPTION = "Tool to sign omap3 x-loader images"
-LIC_FILES_CHKSUM = "file://signGP.c;md5=960f484fea13941ca88821366f9dade0"
-
-SRC_URI = "file://signGP.c"
-
-do_compile() {
-	${CC} ${CFLAGS} ${LDFLAGS} ${WORKDIR}/signGP.c -o signGP
-}
-
-do_install() {
-	install -d ${D}${bindir}
-	install -m 0755 signGP ${D}${bindir}
-}
-
-S = "${WORKDIR}"
-
-NATIVE_INSTALL_WORKS = "1"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/recipes-bsp/x-load/signgp/signGP.c b/recipes-bsp/x-load/signgp/signGP.c
deleted file mode 100644
index 9325064..0000000
--- a/recipes-bsp/x-load/signgp/signGP.c
+++ /dev/null
@@ -1,108 +0,0 @@
-/*
- * Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com/
- *
- *
- *  Redistribution and use in source and binary forms, with or without
- *  modification, are permitted provided that the following conditions
- *  are met:
- *
- *    Redistributions of source code must retain the above copyright
- *    notice, this list of conditions and the following disclaimer.
- *
- *    Redistributions in binary form must reproduce the above copyright
- *    notice, this list of conditions and the following disclaimer in the
- *    documentation and/or other materials provided with the
- *    distribution.
- *
- *    Neither the name of Texas Instruments Incorporated nor the names of
- *    its contributors may be used to endorse or promote products derived
- *    from this software without specific prior written permission.
- *
- *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
- *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
- *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
- *  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
- *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
- *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
- *  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
- *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
- *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
- *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
- *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- *
-*/
-
-
-//
-// signGP.c
-// Read the x-load.bin file and write out the x-load.bin.ift file.
-// The signed image is the original pre-pended with the size of the image
-// and the load address.  If not entered on command line, file name is
-// assumed to be x-load.bin in current directory and load address is
-// 0x40200800.
-
-#include <stdio.h>
-#include <stdlib.h>
-#include <fcntl.h>
-#include <sys/stat.h>
-#include <string.h>
-#include <malloc.h>
-
-
-main(int argc, char *argv[])
-{
-	int	i;
-	char	ifname[FILENAME_MAX], ofname[FILENAME_MAX], ch;
-	FILE	*ifile, *ofile;
-	unsigned long	loadaddr, len;
-	struct stat	sinfo;
-
-
-	// Default to x-load.bin and 0x40200800.
-	strcpy(ifname, "x-load.bin");
-	loadaddr = 0x40200800;
-
-	if ((argc == 2) || (argc == 3))
-		strcpy(ifname, argv[1]);
-
-	if (argc == 3)
-		loadaddr = strtol(argv[2], NULL, 16);
-
-	// Form the output file name.
-	strcpy(ofname, ifname);
-	strcat(ofname, ".ift");
-
-	// Open the input file.
-	ifile = fopen(ifname, "rb");
-	if (ifile == NULL) {
-		printf("Cannot open %s\n", ifname);
-		exit(0);
-	}
-
-	// Get file length.
-	stat(ifname, &sinfo);
-	len = sinfo.st_size;
-
-	// Open the output file and write it.
-	ofile = fopen(ofname, "wb");
-	if (ofile == NULL) {
-		printf("Cannot open %s\n", ofname);
-		fclose(ifile);
-		exit(0);
-	}
-
-	// Pad 1 sector of zeroes.
-	//ch = 0x00;
-	//for (i=0; i<0x200; i++)
-	//	fwrite(&ch, 1, 1, ofile);
-
-	fwrite(&len, 1, 4, ofile);
-	fwrite(&loadaddr, 1, 4, ofile);
-	for (i=0; i<len; i++) {
-		fread(&ch, 1, 1, ifile);
-		fwrite(&ch, 1, 1, ofile);
-	}
-
-	fclose(ifile);
-	fclose(ofile);
-}
diff --git a/recipes-bsp/x-load/x-load.inc b/recipes-bsp/x-load/x-load.inc
deleted file mode 100644
index bb700e4..0000000
--- a/recipes-bsp/x-load/x-load.inc
+++ /dev/null
@@ -1,58 +0,0 @@
-DESCRIPTION = "x-load bootloader loader"
-SECTION = "bootloaders"
-LICENSE = "GPLv2+"
-
-LIC_FILES_CHKSUM = "file://common/cmd_load.c;beginline=4;endline=22;md5=14420d7cc8dfb427d17ad407ddf8dc89"
-
-PARALLEL_MAKE = ""
-
-EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} CONFIG_HEADER=${CONFIG_HEADER}"
-
-XLOAD_MACHINE ?= "${MACHINE}_config"
-
-XLOAD_IMAGE ?= "x-load-${MACHINE}-${PV}-${PR}.bin.ift"
-XLOAD_SYMLINK ?= "x-load-${MACHINE}.bin.ift"
-XLOAD_USB_IMAGE ?= "x-load-usb-${MACHINE}-${PV}-${PR}.bin"
-XLOAD_USB_SYMLINK ?= "x-load-usb-${MACHINE}.bin"
-MLO_IMAGE ?= "MLO-${MACHINE}-${PV}-${PR}"
-MLO_SYMLINK ?= "MLO-${MACHINE}"
-MLO_SYMLINK_NOMACHINE ?= "MLO"
-XLOAD_LOAD_ADDRESS ?= "0x40200800"
-
-do_compile () {
-	unset LDFLAGS
-	unset CFLAGS
-	unset CPPFLAGS
-	oe_runmake distclean
-	oe_runmake ${XLOAD_MACHINE}
-	oe_runmake ift
-}
-
-do_install () {
-	install -d ${D}/boot
-	install ${S}/x-load.bin.ift ${D}/boot/${MLO_IMAGE}
-	ln -sf ${MLO_IMAGE} ${D}/boot/${MLO_SYMLINK_NOMACHINE} 
-}
-
-FILES:${PN} = "/boot"
-
-inherit deploy
-
-addtask deploy before do_package after do_install
-
-do_deploy () {
-	install -d ${DEPLOY_DIR_IMAGE}
-	install ${S}/x-load.bin.ift ${DEPLOY_DIR_IMAGE}/${XLOAD_IMAGE}
-	install ${S}/x-load.bin ${DEPLOY_DIR_IMAGE}/${XLOAD_USB_IMAGE}	
-	install ${S}/x-load.bin.ift ${DEPLOY_DIR_IMAGE}/${MLO_IMAGE}
-
-	cd ${DEPLOY_DIR_IMAGE}
-	rm -f ${XLOAD_SYMLINK}
-	ln -sf ${XLOAD_IMAGE} ${XLOAD_SYMLINK}
-	rm -f ${XLOAD_USB_SYMLINK}
-	ln -sf ${XLOAD_USB_IMAGE} ${XLOAD_USB_SYMLINK}	
-	rm -f ${MLO_SYMLINK}
-	ln -sf ${MLO_IMAGE} ${MLO_SYMLINK}
-	rm -f ${MLO_SYMLINK_NOMACHINE}
-	ln -sf ${MLO_IMAGE} ${MLO_SYMLINK_NOMACHINE}
-}
diff --git a/recipes-bsp/x-load/x-load/0001-Beagle-Rev-C5-support.patch b/recipes-bsp/x-load/x-load/0001-Beagle-Rev-C5-support.patch
deleted file mode 100644
index 1c67bd3..0000000
--- a/recipes-bsp/x-load/x-load/0001-Beagle-Rev-C5-support.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 992eb6ff881792f5c753ef6c85be0ceb2d162c78 Mon Sep 17 00:00:00 2001
-From: Joel Fernandes <agnel.joel@gmail.com>
-Date: Tue, 7 Jun 2011 09:50:03 +0200
-Subject: [PATCH] Beagle Rev C5 support
-
----
- board/omap3530beagle/omap3530beagle.c |   16 ++++++++++++++++
- 1 files changed, 16 insertions(+), 0 deletions(-)
-
-diff --git a/board/omap3530beagle/omap3530beagle.c b/board/omap3530beagle/omap3530beagle.c
-index 15943f5..2b8c3c0 100644
---- a/board/omap3530beagle/omap3530beagle.c
-+++ b/board/omap3530beagle/omap3530beagle.c
-@@ -281,6 +281,7 @@ u32 wait_on_value(u32 read_bit_mask, u32 match_value, u32 read_addr, u32 bound)
- 
- #define MICRON_DDR	0
- #define NUMONYX_MCP	1
-+#define MICRON_MCP	2
- int identify_xm_ddr()
- {
- 	int	mfr, id;
-@@ -303,6 +304,8 @@ int identify_xm_ddr()
- 		return MICRON_DDR;
- 	if ((mfr == 0x20) && (id == 0xba))
- 		return NUMONYX_MCP;
-+	if ((mfr == 0x2c) && (id == 0xbc))
-+		return MICRON_MCP;
- }
- /*********************************************************************
-  * config_3430sdram_ddr() - Init DDR on 3430SDP dev board.
-@@ -329,6 +332,17 @@ void config_3430sdram_ddr(void)
- 			__raw_writel(NUMONYX_V_ACTIMB_165, SDRC_ACTIM_CTRLB_1);
- 			__raw_writel(SDP_3430_SDRC_RFR_CTRL_165MHz, SDRC_RFR_CTRL_0);
- 			__raw_writel(SDP_3430_SDRC_RFR_CTRL_165MHz, SDRC_RFR_CTRL_1);
-+		} else if (identify_xm_ddr() == MICRON_MCP) {
-+			/* Beagleboard Rev C5 */
-+			__raw_writel(0x2, SDRC_CS_CFG); /* 256MB/bank */
-+			__raw_writel(SDP_SDRC_MDCFG_0_DDR_MICRON_XM, SDRC_MCFG_0);
-+			__raw_writel(SDP_SDRC_MDCFG_0_DDR_MICRON_XM, SDRC_MCFG_1);
-+			__raw_writel(MICRON_V_ACTIMA_200, SDRC_ACTIM_CTRLA_0);
-+			__raw_writel(MICRON_V_ACTIMB_200, SDRC_ACTIM_CTRLB_0);
-+			__raw_writel(MICRON_V_ACTIMA_200, SDRC_ACTIM_CTRLA_1);
-+			__raw_writel(MICRON_V_ACTIMB_200, SDRC_ACTIM_CTRLB_1);
-+			__raw_writel(SDP_3430_SDRC_RFR_CTRL_200MHz, SDRC_RFR_CTRL_0);
-+			__raw_writel(SDP_3430_SDRC_RFR_CTRL_200MHz, SDRC_RFR_CTRL_1);
- 		} else {
- 			__raw_writel(0x1, SDRC_CS_CFG); /* 128MB/bank */
- 			__raw_writel(SDP_SDRC_MDCFG_0_DDR, SDRC_MCFG_0);
-@@ -699,6 +713,8 @@ int misc_init_r(void)
- 	case REVISION_C4:
- 		if (identify_xm_ddr() == NUMONYX_MCP)
- 			printf("Beagle Rev C4 from Special Computing\n");
-+		else if(identify_xm_ddr() == MICRON_MCP)
-+			printf("Beagle Rev C5\n");
- 		else
- 			printf("Beagle Rev C4\n");
- 		break;
--- 
-1.6.6.1
-
diff --git a/recipes-bsp/x-load/x-load/panda-frefclk.patch b/recipes-bsp/x-load/x-load/panda-frefclk.patch
deleted file mode 100644
index a893376..0000000
--- a/recipes-bsp/x-load/x-load/panda-frefclk.patch
+++ /dev/null
@@ -1,193 +0,0 @@
-Delivered-To: koen@dominion.thruhere.net
-Received: by 10.236.61.2 with SMTP id v2cs463572yhc;
-        Mon, 11 Jul 2011 00:39:44 -0700 (PDT)
-Received: by 10.236.79.69 with SMTP id h45mr4010171yhe.342.1310369983896;
-        Mon, 11 Jul 2011 00:39:43 -0700 (PDT)
-Return-Path: <x-loader+bncCKvc3d-lHRC70erwBBoEmZF8Og@googlegroups.com>
-Received: from mail-gx0-f189.google.com (mail-gx0-f189.google.com [209.85.161.189])
-        by mx.google.com with ESMTPS id u61si41782290yhm.15.2011.07.11.00.39.43
-        (version=TLSv1/SSLv3 cipher=OTHER);
-        Mon, 11 Jul 2011 00:39:43 -0700 (PDT)
-Received-SPF: pass (google.com: domain of x-loader+bncCKvc3d-lHRC70erwBBoEmZF8Og@googlegroups.com designates 209.85.161.189 as permitted sender) client-ip=209.85.161.189;
-Authentication-Results: mx.google.com; spf=pass (google.com: domain of x-loader+bncCKvc3d-lHRC70erwBBoEmZF8Og@googlegroups.com designates 209.85.161.189 as permitted sender) smtp.mail=x-loader+bncCKvc3d-lHRC70erwBBoEmZF8Og@googlegroups.com; dkim=pass (test mode) header.i=@googlegroups.com
-Received: by gxk3 with SMTP id 3sf9821900gxk.6
-        for <koen@dominion.thruhere.net>; Mon, 11 Jul 2011 00:39:43 -0700 (PDT)
-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
-        d=googlegroups.com; s=beta;
-        h=mime-version:x-beenthere:received-spf:from:to:cc:subject:date
-         :message-id:x-mailer:in-reply-to:references:x-original-sender
-         :x-original-authentication-results:reply-to:precedence:mailing-list
-         :list-id:x-google-group-id:list-post:list-help:list-archive:sender
-         :list-subscribe:list-unsubscribe:content-type;
-        bh=knz/OIehyS1eNPnUO3PKelxTOdkGPG+fRW2FJ4AriF0=;
-        b=cjz/o/2YFMmEgHKdtY7SmdxjqN+uxnJluh9MGSOmA+kVKkPYzbv4SXQQEcjFMBrXXw
-         pCUO8G8BylJJLTBTeRDAcji73YDd65OKsc6UoAyrSUtxtj4sgKXBVwaLu0eS+1Efsyl3
-         +5g8sPqNFFG3tcvYD30FjtHZwLFyCTAtU2g18=
-Received: by 10.101.142.10 with SMTP id u10mr495069ann.24.1310369979330;
-        Mon, 11 Jul 2011 00:39:39 -0700 (PDT)
-MIME-Version: 1.0
-X-BeenThere: x-loader@googlegroups.com
-Received: by 10.101.164.36 with SMTP id r36ls170737ano.5.gmail; Mon, 11 Jul
- 2011 00:39:38 -0700 (PDT)
-Received: by 10.101.126.20 with SMTP id d20mr158105ann.0.1310369978730;
-        Mon, 11 Jul 2011 00:39:38 -0700 (PDT)
-Received: by 10.101.126.20 with SMTP id d20mr158104ann.0.1310369978718;
-        Mon, 11 Jul 2011 00:39:38 -0700 (PDT)
-Received: from mail-yx0-f181.google.com (mail-yx0-f181.google.com [209.85.213.181])
-        by gmr-mx.google.com with ESMTPS id i19si12624205anq.3.2011.07.11.00.39.37
-        (version=TLSv1/SSLv3 cipher=OTHER);
-        Mon, 11 Jul 2011 00:39:37 -0700 (PDT)
-Received-SPF: neutral (google.com: 209.85.213.181 is neither permitted nor denied by best guess record for domain of ricardo.salveti@linaro.org) client-ip=209.85.213.181;
-Received: by mail-yx0-f181.google.com with SMTP id 13so1644271yxi.12
-        for <x-loader@googlegroups.com>; Mon, 11 Jul 2011 00:39:37 -0700 (PDT)
-Received: by 10.150.53.14 with SMTP id b14mr3957102yba.181.1310369977490;
-        Mon, 11 Jul 2011 00:39:37 -0700 (PDT)
-Received: from localhost.localdomain ([201.82.65.93])
-        by mx.google.com with ESMTPS id s21sm510693ybm.15.2011.07.11.00.39.34
-        (version=TLSv1/SSLv3 cipher=OTHER);
-        Mon, 11 Jul 2011 00:39:35 -0700 (PDT)
-From: Ricardo Salveti de Araujo <ricardo.salveti@linaro.org>
-To: x-loader@googlegroups.com
-Cc: patches@linaro.org,
-	Ricardo Salveti de Araujo <ricardo.salveti@linaro.org>
-Subject: [x-loader] [PATCH v2] omap4: pandaboard: ehci fref_clkout per board revision
-Date: Mon, 11 Jul 2011 04:39:17 -0300
-Message-Id: <1310369957-28444-1-git-send-email-ricardo.salveti@linaro.org>
-X-Mailer: git-send-email 1.7.4.1
-In-Reply-To: <1305973002-28352-1-git-send-email-ricardo.salveti@linaro.org>
-References: <1305973002-28352-1-git-send-email-ricardo.salveti@linaro.org>
-X-Original-Sender: ricardo.salveti@linaro.org
-X-Original-Authentication-Results: gmr-mx.google.com; spf=neutral (google.com:
- 209.85.213.181 is neither permitted nor denied by best guess record for
- domain of ricardo.salveti@linaro.org) smtp.mail=ricardo.salveti@linaro.org
-Reply-To: x-loader@googlegroups.com
-Precedence: list
-Mailing-list: list x-loader@googlegroups.com; contact x-loader+owners@googlegroups.com
-List-ID: <x-loader.googlegroups.com>
-X-Google-Group-Id: 243713986749
-List-Post: <http://groups.google.com/group/x-loader/post?hl=en_US>, <mailto:x-loader@googlegroups.com>
-List-Help: <http://groups.google.com/support/?hl=en_US>, <mailto:x-loader+help@googlegroups.com>
-List-Archive: <http://groups.google.com/group/x-loader?hl=en_US>
-Sender: x-loader@googlegroups.com
-List-Subscribe: <http://groups.google.com/group/x-loader/subscribe?hl=en_US>, <mailto:x-loader+subscribe@googlegroups.com>
-List-Unsubscribe: <http://groups.google.com/group/x-loader/subscribe?hl=en_US>,
- <mailto:x-loader+unsubscribe@googlegroups.com>
-Content-Type: text/plain; charset=ISO-8859-1
-
-Add support for correctly configuring the fref_clkout depending on the
-board revision of the pandaboard. This patch is necessary to make u-boot
-work with the smsc usb+ethernet driver.
-
-Tested USB+Eth with TFTP and PXE using linaro u-boot:
-http://git.linaro.org/gitweb?p=boot/u-boot-linaro-stable.git;a=summary
-
-Based on patch from David Anders <x0132446@ti.com> from
-omap4_panda_L24.9 branch at gitorious.org/pandaboard x-loader tree.
-
-Changes since v1:
- * Moving the code from s_init instead of adding a new block
-
-Signed-off-by: Ricardo Salveti de Araujo <ricardo.salveti@linaro.org>
----
- board/omap4430panda/omap4430panda.c |   58 +++++++++++++++-------------------
- 1 files changed, 26 insertions(+), 32 deletions(-)
-
-diff --git a/board/omap4430panda/omap4430panda.c b/board/omap4430panda/omap4430panda.c
-index 9b4e457..bcee6fe 100644
---- a/board/omap4430panda/omap4430panda.c
-+++ b/board/omap4430panda/omap4430panda.c
-@@ -531,6 +531,7 @@ static void ddr_init(void)
-  *****************************************/
- int board_init(void)
- {
-+	unsigned int rev = omap_revision();
- 	unsigned int v;
- 
- 	/*
-@@ -546,10 +547,32 @@ int board_init(void)
- 	v = __raw_readl(OMAP44XX_GPIO_BASE2 + __GPIO_DATAOUT);
- 	__raw_writel((v & ~(1 << 30)), OMAP44XX_GPIO_BASE2 + __GPIO_DATAOUT);
- 
--	/* kill USB PLL */
-+	if (rev == OMAP4430_ES1_0)
-+		return 0;
- 
--	v = __raw_readl(CM_CLKMODE_DPLL_USB);
--	__raw_writel((v & ~7) | 1, CM_CLKMODE_DPLL_USB);
-+	if (__raw_readl(OMAP44XX_GPIO_BASE6 + __GPIO_DATAIN) & (1 << 22)) {
-+		/* enable software ioreq */
-+		sr32(OMAP44XX_SCRM_AUXCLK3, 8, 1, 0x1);
-+		/* set for sys_clk (38.4MHz) */
-+		sr32(OMAP44XX_SCRM_AUXCLK3, 1, 2, 0x0);
-+		/* set divisor to 2 */
-+		sr32(OMAP44XX_SCRM_AUXCLK3, 16, 4, 0x1);
-+		/* set the clock source to active */
-+		sr32(OMAP44XX_SCRM_ALTCLKSRC, 0, 1, 0x1);
-+		/* enable clocks */
-+		sr32(OMAP44XX_SCRM_ALTCLKSRC, 2, 2, 0x3);
-+	} else {
-+		/* enable software ioreq */
-+		sr32(OMAP44XX_SCRM_AUXCLK1, 8, 1, 0x1);
-+		/* set for PER_DPLL */
-+		sr32(OMAP44XX_SCRM_AUXCLK1, 1, 2, 0x2);
-+		/* set divisor to 16 */
-+		sr32(OMAP44XX_SCRM_AUXCLK1, 16, 4, 0xf);
-+		/* set the clock source to active */
-+		sr32(OMAP44XX_SCRM_ALTCLKSRC, 0, 1, 0x1);
-+		/* enable clocks */
-+		sr32(OMAP44XX_SCRM_ALTCLKSRC, 2, 2, 0x3);
-+	}
- 
- 	return 0;
- }
-@@ -683,8 +706,6 @@ static int scale_vcores(void)
- 
- void s_init(void)
- {
--	unsigned int rev = omap_revision();
--
- 	/*
- 	 * this is required to survive the muxconf in the case the ROM
- 	 * started up USB OTG
-@@ -707,33 +728,6 @@ void s_init(void)
- 	/* setup_auxcr(get_device_type(), external_boot); */
- 
- 	ddr_init();
--
--	if (rev == OMAP4430_ES1_0)
--		return;
--
--	if (__raw_readl(OMAP44XX_GPIO_BASE6 + __GPIO_DATAIN) & (1 << 22)) {
--		/* enable software ioreq */
--		sr32(OMAP44XX_SCRM_AUXCLK3, 8, 1, 0x1);
--		/* set for sys_clk (38.4MHz) */
--		sr32(OMAP44XX_SCRM_AUXCLK3, 1, 2, 0x0);
--		/* set divisor to 2 */
--		sr32(OMAP44XX_SCRM_AUXCLK3, 16, 4, 0x1);
--		/* set the clock source to active */
--		sr32(OMAP44XX_SCRM_ALTCLKSRC, 0, 1, 0x1);
--		/* enable clocks */
--		sr32(OMAP44XX_SCRM_ALTCLKSRC, 2, 2, 0x3);
--	} else {
--		/* enable software ioreq */
--		sr32(OMAP44XX_SCRM_AUXCLK1, 8, 1, 0x1);
--		/* set for PER_DPLL */
--		sr32(OMAP44XX_SCRM_AUXCLK1, 1, 2, 0x2);
--		/* set divisor to 16 */
--		sr32(OMAP44XX_SCRM_AUXCLK1, 16, 4, 0xf);
--		/* set the clock source to active */
--		sr32(OMAP44XX_SCRM_ALTCLKSRC, 0, 1, 0x1);
--		/* enable clocks */
--		sr32(OMAP44XX_SCRM_ALTCLKSRC, 2, 2, 0x3);
--	}
- }
- 
- /*******************************************************
--- 
-1.7.4.1
-
--- 
---
-To unsubscribe from this group, email: x-loader+unsubscribe@googlegroups.com
-For more options: http://groups.google.com/group/x-loader?hl=en?hl=en
-Home Page: http://gitorious.org/x-loader
diff --git a/recipes-bsp/x-load/x-load_1.46-psp.bb b/recipes-bsp/x-load/x-load_1.46-psp.bb
deleted file mode 100644
index cc9ad3f..0000000
--- a/recipes-bsp/x-load/x-load_1.46-psp.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-require x-load.inc
-
-DEPENDS += "signgp-native"
-
-LIC_FILES_CHKSUM = "file://README;md5=fb7a7e60aceaa99c529b6c667dfcf474"
-
-COMPATIBLE_MACHINE = "am3517-evm"
-
-PV = "1.46+${PR}+gitr${SRCREV}"
-PR ="r0"
-PE = "1"
-
-# TI PSP v1.46_OMAPPSP_03.00.01.06 (Tag is one commit different)
-SRCREV:pn-${PN} = "fc6d5be15c703d21aef0ae0b8c02177721f0445f"
-SRC_URI = "git://arago-project.org/git/projects/x-load-omap3.git;protocol=git"
-
-S = "${WORKDIR}/git"
-
-do_compile () {
-	unset LDFLAGS
-	unset CFLAGS
-	unset CPPFLAGS
-	oe_runmake distclean
-	oe_runmake ${XLOAD_MACHINE}
-	oe_runmake
-}
-
-do_install () {
-	signGP x-load.bin ${XLOAD_LOAD_ADDRESS}
-
-	install -d ${D}/boot
-	install x-load.bin.ift ${D}/boot/${MLO_IMAGE}
-	ln -sf ${MLO_IMAGE} ${D}/boot/${MLO_SYMLINK_NOMACHINE}
-}
-
-FILES:${PN} = "/boot"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/recipes-bsp/x-load/x-load_git.bb b/recipes-bsp/x-load/x-load_git.bb
deleted file mode 100644
index 0234c57..0000000
--- a/recipes-bsp/x-load/x-load_git.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-require x-load.inc
-
-#FILESPATHPKG_prepend = "x-load-git:x-load-git/${MACHINE}"
-
-PV = "1.5.1"
-PR ="r3"
-PE = "1"
-
-SRCREV:pn-${PN} = "c4289f1bee035dea41536c5ba5e1bc36c7d493c4"
-SRC_URI = "git://gitorious.org/x-loader/x-loader.git;branch=master;protocol=git \
-"
-
-S = "${WORKDIR}/git"
-
-XLOAD_MACHINE:beagleboard = "omap3530beagle_config"
-CONFIG_HEADER:beagleboard = "1"
-XLOAD_MACHINE:omap3-touchbook = "omap3530beagle_config"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-COMPATIBLE_HOST ?= "null"
-COMPATIBLE_HOST:ti-soc = "(.*)"
-- 
2.7.4

