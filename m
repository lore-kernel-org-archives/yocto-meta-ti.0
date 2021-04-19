Received: from egress-ip4b.ess.de.barracuda.com (egress-ip4b.ess.de.barracuda.com [18.185.115.208])
 by mx.groups.io with SMTP id smtpd.web10.6022.1618820411894196695
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 19 Apr 2021 01:20:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=UWmp40Oh;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.208, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70]) by mx-outbound18-250.eu-central-1b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 19 Apr 2021 08:20:09 +0000
Received: by mail-pj1-f70.google.com with SMTP id m1-20020a17090a7f81b029014e3dc1b035so15613986pjl.0
        for <meta-ti@lists.yoctoproject.org>; Mon, 19 Apr 2021 01:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S/1pjfl6mFnC9kug4WlA69NmWORs8b3UXMs9JxXdjA8=;
        b=UWmp40OhMSW6VamBjMGQ39OFBikawISH3rlM3y6HahAW/iTrGWMxxMpCYRfhz+qaVq
         bisHH7lDcyQzJteXTkPpL6kQrBSrCrm/gzbCF2L4nHyyGdyjzZo6SC+Qyzes3iRYcjw9
         N11BPerTweuVVVqFA75HZ/b4j4kinzsfeZ3C8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S/1pjfl6mFnC9kug4WlA69NmWORs8b3UXMs9JxXdjA8=;
        b=pM/mhL5MASRK7RYnq1br93nbv/m72zJxMLudyCmrIDINOAqvnsJpArCOT7+9+XvfaF
         Jle45L8C0PeCu8aeQTBp4UZem/ncwZRtPsqZrbLRePw4ClDJC8sA7Z/tBFwp7Lp8JQxm
         SPaO12d9pLmDUmkkictIFAGp71zz3vXspUYAXNGCV0HkUo7ZsxufArSdCdItyleSuYXp
         Awlo6wBqUltguqCFYCWkqrUwmw2SHMlYA1KA2eZOzpk89cE+EeA9alqZ+wWd7uGkBg+i
         T4gBJsqIrxr7Ya3jS5YmNmOPy/Oe5S5c+LfTctWvUqv3oemEptY+sg60V2rZYjREWBxp
         hObA==
X-Gm-Message-State: AOAM530DYIW83353yczGL10AGeECwQxepjg0+OPdewBvDz3KDHIYLytg
	x0rG5tOky42SE561a/ndNDYtnDTr+Y7327z9znEejwfu6BMX4imDLj+99wNkXciqoJtQz6hyyX/
	+61sjb9FSh2JWfHY37w0T+FReWkqtSa00QHy1xSmFzzFLVOMubjy/+mQMIPmG7OA=
X-Received: by 2002:a63:df56:: with SMTP id h22mr10847189pgj.84.1618820408152;
        Mon, 19 Apr 2021 01:20:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPoQgiCJ6oIlOQoVyL/GiTywuphECrg8MUTq2XB6PU/VC3fx1B6Xai+c1lDGMYlu/hNSbJiQ==
X-Received: by 2002:a63:df56:: with SMTP id h22mr10847170pgj.84.1618820407897;
        Mon, 19 Apr 2021 01:20:07 -0700 (PDT)
Return-Path: <sinthu.raja@mistralsolutions.com>
Received: from LAP000568.mistral.in ([223.227.14.13])
        by smtp.gmail.com with ESMTPSA id m14sm13755354pgb.0.2021.04.19.01.20.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Apr 2021 01:20:07 -0700 (PDT)
From: "Sinthu Raja M" <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <x0257345@ti.com>
To: meta-ti@lists.yoctoproject.org
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Sinthu Raja <x0257345@ti.com>
Subject: [dunfell/master PATCH-V2 1/3] Remove AM64xx-SK entries
Date: Mon, 19 Apr 2021 13:49:58 +0530
Message-Id: <20210419081958.80140-1-x0257345@ti.com>
X-Mailer: git-send-email 2.19.1.windows.1
MIME-Version: 1.0
X-BESS-ID: 1618820409-304858-5705-132744-1
X-BESS-VER: 2019.1_20210414.2120
X-BESS-Apparent-Source-IP: 209.85.216.70
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.231659 [from 
	cloudscan14-14.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 MAILTO_TO_SPAM_ADDR    META: Includes a link to a likely spammer email 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=MAILTO_TO_SPAM_ADDR, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Content-Transfer-Encoding: 8bit

 Remove the AM64x SK conf files
 Remove the AM64xx-SK entries from u-boot-ti and ti-sci-fw recipes

Signed-off-by: Sinthu Raja <x0257345@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 17 -----------------
 recipes-bsp/u-boot/u-boot-ti.inc       |  7 +------
 2 files changed, 1 insertion(+), 23 deletions(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index e6fa460ca..87fdec68d 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -3,7 +3,6 @@ require recipes-bsp/ti-sci-fw/ti-sci-fw.inc
 DEPENDS = "openssl-native u-boot-mkimage-native dtc-native"
 DEPENDS_append_j7200-evm-k3r5 = " virtual/bootloader"
 DEPENDS_append_am64xx-evm-k3r5 = " virtual/bootloader"
-DEPENDS_append_am64xx-sk-k3r5 = " virtual/bootloader"
 
 CLEANBROKEN = "1"
 PR = "r1"
@@ -54,7 +53,6 @@ EXTRA_OEMAKE_append = "${@['',' ${EXTRA_OEMAKE_HS}']['${SYSFW_SUFFIX}' == 'hs']}
 
 EXTRA_OEMAKE_append_j7200-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
 EXTRA_OEMAKE_append_am64xx-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
-EXTRA_OEMAKE_append_am64xx-sk-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
 
 do_compile() {
 	cd ${WORKDIR}/imggen/
@@ -117,19 +115,4 @@ do_deploy_am64xx-evm-k3r5() {
 	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
 }
 
-do_install_am64xx-sk-k3r5() {
-	install -d ${D}/boot
-	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
-	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_SYMLINK}
-	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
-}
-
-do_deploy_am64xx-sk-k3r5() {
-	install -d ${DEPLOYDIR}
-	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
-	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
-	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
-	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
-}
-
 addtask deploy before do_build after do_compile
diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index e5f92f4bd..ca0414c06 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -66,7 +66,7 @@ SPL_UART_BINARY_k3r5 = ""
 SPL_UART_BINARY_lego-ev3 = ""
 SPL_UART_BINARY_j7200-evm-k3r5 = "u-boot-spl.bin"
 SPL_UART_BINARY_am64xx-evm-k3r5 = "u-boot-spl.bin"
-SPL_UART_BINARY_am64xx-sk-k3r5 = "u-boot-spl.bin"
+
 
 SPL_UART_IMAGE ?= "${SPL_UART_BINARY}-${MACHINE}-${PV}-${PR}"
 SPL_UART_SYMLINK ?= "${SPL_UART_BINARY}-${MACHINE}"
@@ -402,9 +402,4 @@ do_deploy_append_am64xx-evm-k3r5 () {
 	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
 }
 
-do_deploy_append_am64xx-sk-k3r5 () {
-	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
-	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
-}
-
 TOOLCHAIN = "gcc"
-- 
2.17.0

