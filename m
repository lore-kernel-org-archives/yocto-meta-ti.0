Received: from egress-ip33b.ess.de.barracuda.com (egress-ip33b.ess.de.barracuda.com [18.185.115.237])
 by mx.groups.io with SMTP id smtpd.web11.4687.1617866182786415155
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 08 Apr 2021 00:16:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=Bkg6CvoG;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.237, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70]) by mx-outbound17-127.eu-central-1b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Thu, 08 Apr 2021 07:16:20 +0000
Received: by mail-pj1-f70.google.com with SMTP id nv16so779709pjb.6
        for <meta-ti@lists.yoctoproject.org>; Thu, 08 Apr 2021 00:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GzJNUBz+m3tq9jRQJENhqCJbZuqfJkhCNLdnqoJIsy0=;
        b=Bkg6CvoGhoktEj7UhuxbPT47NgtS+jSm4X64VvojM/coGnMFpyCFDLjf1eD1fDUF0q
         vOK4v5buMImThohstifTqJhbiZ9cvJDha4NiOn/Q4t9pf9J/euV1UHaCGhG/XObnLSax
         NttbhEc6YLtpAc+cFyFuYJfADoo3iPrHqkU+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GzJNUBz+m3tq9jRQJENhqCJbZuqfJkhCNLdnqoJIsy0=;
        b=DAjmQoeX77z2MfiFVF5xKX36T4Zg/uVK9aqj9CAOy0jBHVhkGhCkxf+0KZGZq0e+Y0
         qVaBW2V3w0rO4dV2ALSP1kiC38gokplg50RgI1DhE0w6ZwIxSB/icdka/xbNILUjTz27
         Lj/64XN5swuah5JCQiVOqlJw2gswKQ7M/6rmgL4AQj/2whYHgxKVecYMQyj2iiaK386l
         HEuxuW5oYx+eJ/TtXFwkvtJMio/zxHh5ftgED6GVdhGWEX1o5Vmo5L/BHWdFhclx+UAk
         4OjWX3dfRGlNFlMe3Zhy/+va1nfj+VD2JEmTteT/gdjFQdwCNrqxU7V2afIjogisE9kG
         +71w==
X-Gm-Message-State: AOAM530i1Nc1NXuoELDOfJnVI7I8uFG/G18K6HtF2aCH+wErn4rkDVpw
	SLsduuGLbvsptGL3Ehkc65zhgpGmNeNxY1cGJwlbziHYxkNiJm8wDKT1xA/md9Ew8eIE1zIJ6pz
	PUsp2LF6nGbnza2MBuONFN8cKsyMOotzvJjClPPq8JGFljfHcCg/LVkYxMwkyMBI=
X-Received: by 2002:a63:d714:: with SMTP id d20mr6838148pgg.285.1617866179305;
        Thu, 08 Apr 2021 00:16:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6N1vVPJ4tB6wuVh5aiOFgLHQG6RemjtONEKP/iMdqeYNpyUH5IwuYQXjqj4Hka14H5mrcHg==
X-Received: by 2002:a63:d714:: with SMTP id d20mr6838132pgg.285.1617866179131;
        Thu, 08 Apr 2021 00:16:19 -0700 (PDT)
Return-Path: <sinthu.raja@mistralsolutions.com>
Received: from LAP000568.mistral.in ([106.51.69.35])
        by smtp.gmail.com with ESMTPSA id b6sm6726188pfa.185.2021.04.08.00.16.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Apr 2021 00:16:18 -0700 (PDT)
From: "Sinthu Raja M" <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja M <sinthu.raja@mistral.in>
To: meta-ti@lists.yoctoproject.org
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Sinthu Raja <x0257345@ti.com>
Subject: [dunfell/master PATCH 2/3] AM64x Unification: Update u-boot conf
Date: Thu,  8 Apr 2021 12:46:08 +0530
Message-Id: <20210408071608.80232-1-sinthu.raja@mistral.in>
X-Mailer: git-send-email 2.19.1.windows.1
MIME-Version: 1.0
X-BESS-ID: 1617866180-304479-5586-2855-1
X-BESS-VER: 2019.1_20210407.1623
X-BESS-Apparent-Source-IP: 209.85.216.70
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.231405 [from 
	cloudscan12-48.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 MAILTO_TO_SPAM_ADDR    META: Includes a link to a likely spammer email 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=MAILTO_TO_SPAM_ADDR, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Content-Transfer-Encoding: 8bit

From: Sinthu Raja <x0257345@ti.com>

 Updtae u-boot recipe to build for both SK and EVM compilation and
installation through one machine name
 Update AM64x config file to add both defconfig files for SK and EVM

Signed-off-by: Sinthu Raja <x0257345@ti.com>
---
 conf/machine/am64xx-evm-k3r5.conf | 11 ++++++++---
 conf/machine/am64xx-evm.conf      |  6 +++++-
 conf/machine/include/am64xx.inc   |  1 +
 recipes-bsp/u-boot/u-boot-ti.inc  | 21 +++++++++++++++++++--
 4 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/conf/machine/am64xx-evm-k3r5.conf b/conf/machine/am64xx-evm-k3r5.conf
index dfeaeb570..50a941aef 100644
--- a/conf/machine/am64xx-evm-k3r5.conf
+++ b/conf/machine/am64xx-evm-k3r5.conf
@@ -8,7 +8,12 @@ SYSFW_SOC = "am64x"
 SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "gp"
 
-UBOOT_MACHINE = "am64x_evm_r5_defconfig"
+UBOOT_CONFIG ??= "evm sk"
+UBOOT_CONFIG[evm] = "am64x_evm_a53_defconfig"
+UBOOT_CONFIG[sk] = "am64x_sk_a53_defconfig"
+
+UBOOT_MACHINE = ""
+
 UBOOT_BINARY = "tiboot3.${UBOOT_SUFFIX}"
-UBOOT_IMAGE = "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
-UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
+UBOOT_IMAGE = "tiboot3-am64x-${PV}-${PR}.${UBOOT_SUFFIX}"
+UBOOT_SYMLINK = "tiboot3-am64x.${UBOOT_SUFFIX}"
diff --git a/conf/machine/am64xx-evm.conf b/conf/machine/am64xx-evm.conf
index eda310a32..53837ad19 100644
--- a/conf/machine/am64xx-evm.conf
+++ b/conf/machine/am64xx-evm.conf
@@ -6,7 +6,11 @@ require conf/machine/include/am64xx.inc
 
 IMAGE_BOOT_FILES = "tispl.bin u-boot.img"
 
-UBOOT_MACHINE = "am64x_evm_a53_defconfig"
+UBOOT_MACHINE = ""
+
+UBOOT_CONFIG ??= "evm sk"
+UBOOT_CONFIG[evm] = "am64x_evm_a53_defconfig"
+UBOOT_CONFIG[sk] = "am64x_sk_a53_defconfig"
 
 do_image_wic[depends] += "trusted-firmware-a:do_deploy"
 do_image_tar[depends] += "trusted-firmware-a:do_deploy"
diff --git a/conf/machine/include/am64xx.inc b/conf/machine/include/am64xx.inc
index 20441d8a7..9bc9ddae2 100644
--- a/conf/machine/include/am64xx.inc
+++ b/conf/machine/include/am64xx.inc
@@ -8,6 +8,7 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 KERNEL_DEVICETREE = " \
     ti/k3-am642-evm.dtb \
+    ti/k3-am642-sk.dtb \
 "
 
 TFA_BOARD = "lite"
diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index ca0414c06..edfe27a18 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -398,8 +398,25 @@ do_deploy_append_j7200-evm-k3r5 () {
 }
 
 do_deploy_append_am64xx-evm-k3r5 () {
-	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
-	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
+	if [ -n "${UBOOT_CONFIG}" ]
+	then
+		for config in ${UBOOT_MACHINE}; do
+			i=$(expr $i + 1);
+			for type in ${UBOOT_CONFIG}; do
+				j=$(expr $j + 1);
+				if [ $j -eq $i ]
+				then
+					mv ${DEPLOYDIR}/${type}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl-${type}.bin || true
+					mv ${DEPLOYDIR}/${type}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl-${type}.bin || true
+				fi
+			done
+			unset j
+		done
+		unset i
+	else
+		mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
+		mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
+	fi
 }
 
 TOOLCHAIN = "gcc"
-- 
2.17.0

