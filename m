Received: from egress-ip4b.ess.de.barracuda.com (egress-ip4b.ess.de.barracuda.com [18.185.115.208])
 by mx.groups.io with SMTP id smtpd.web10.6024.1618820434007611780
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 19 Apr 2021 01:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=HYxG6Pu3;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.208, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199]) by mx-outbound18-250.eu-central-1b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 19 Apr 2021 08:20:31 +0000
Received: by mail-pg1-f199.google.com with SMTP id x12-20020a63f70c0000b0290202e04d4af8so5777376pgh.1
        for <meta-ti@lists.yoctoproject.org>; Mon, 19 Apr 2021 01:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2ZYTftfGUypiKbPXQwtmsJJ6P1ic16MdO1/UpinXZXk=;
        b=HYxG6Pu36AIp7TeaXgc+/6zJBMfhfomqsC7iMvaWeb0gYU5MovaeT72Ugs0a+4/cKJ
         5i3AXYTdgxJ3hRtPs1M+bHweEORIQ/5tMJndXbGNK5zsDRfSOPRQEx7r56mHI36jhkJl
         ao5xlWjsdVPTYehk2eQydvNI9vgs/DHDyvsp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2ZYTftfGUypiKbPXQwtmsJJ6P1ic16MdO1/UpinXZXk=;
        b=lvaLRReiq44ZX30fRGlDgFNXKQe8kx08UHtvw88obZmxeI6nqYp4IV2DXU0lLEezoB
         tbUedVdUJ0ZwHHejQE2bh+JhibkYgIPxVRfZFnKUOZd2qOccHZr+cTZ3ik1AuGvQuB1j
         1PDuAzOmmPeMQQtRFfMWFAdEhrPcgjJGNhOj8IibEzHczQubPT0aeAyF6YlZl2DZIBz3
         NEZ+wtbAvo8cl7zHSDMsrzPPTPGqjIiwM9imyst7QHPf02dP32MTA0ac08oZavc+iX5H
         4IF3bKp+xpBltDe4a/co+mgpsYlNjKhj5c9/jSu/Nq3pWPcFwgAFeNRpEuz0k0cD0cq3
         C8Rg==
X-Gm-Message-State: AOAM531QpWGvpvrUJy76sPErjMkGHEkilFfg1g7Nx48ZvfHRTWj/KhTg
	jvUVDyta8GrhMht3732HKt5KJ698qwGS2/LkGGLytQ6+W/g56D6Hb8lesHAWkjOaGoPd3IbZac+
	Raf2mC5o1hEBmoSEOdMFuQPUYGU/GOeCjqN/LcWETii3wLLu0KXSWyFTQ2mDfULk=
X-Received: by 2002:a05:6a00:158b:b029:241:a969:4da6 with SMTP id u11-20020a056a00158bb0290241a9694da6mr18901127pfk.27.1618820430321;
        Mon, 19 Apr 2021 01:20:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAQujQav3h2WdTdsthg0AUHRymUtgrktgwXnDKePqC9fkb5kQ99Iu+ELDP/mPZX9Go9EoLBg==
X-Received: by 2002:a05:6a00:158b:b029:241:a969:4da6 with SMTP id u11-20020a056a00158bb0290241a9694da6mr18901109pfk.27.1618820430084;
        Mon, 19 Apr 2021 01:20:30 -0700 (PDT)
Return-Path: <sinthu.raja@mistralsolutions.com>
Received: from LAP000568.mistral.in ([223.227.14.13])
        by smtp.gmail.com with ESMTPSA id r6sm11871298pgp.64.2021.04.19.01.20.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Apr 2021 01:20:29 -0700 (PDT)
From: "Sinthu Raja M" <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <x0257345@ti.com>
To: meta-ti@lists.yoctoproject.org
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Sinthu Raja <x0257345@ti.com>
Subject: [dunfell/master PATCH-V2 2/3] AM64x Unification: Update u-boot conf
Date: Mon, 19 Apr 2021 13:50:20 +0530
Message-Id: <20210419082020.100200-1-x0257345@ti.com>
X-Mailer: git-send-email 2.19.1.windows.1
MIME-Version: 1.0
X-BESS-ID: 1618820431-304858-5706-132778-1
X-BESS-VER: 2019.1_20210414.2120
X-BESS-Apparent-Source-IP: 209.85.215.199
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.231659 [from 
	cloudscan23-62.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 MAILTO_TO_SPAM_ADDR    META: Includes a link to a likely spammer email 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=MAILTO_TO_SPAM_ADDR, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Content-Transfer-Encoding: 8bit

 Update u-boot recipe to build for both SK and EVM compilation and
 installation through one machine name
 Update AM64x config file to add both defconfig files for SK and EVM

Signed-off-by: Sinthu Raja <x0257345@ti.com>
---
 conf/machine/am64xx-evm-k3r5.conf | 10 +++++-
 conf/machine/am64xx-evm.conf      | 14 +++++++-
 conf/machine/include/am64xx.inc   |  1 +
 recipes-bsp/u-boot/u-boot-ti.inc  | 55 +++++++++++++++++++++++++++++--
 4 files changed, 76 insertions(+), 4 deletions(-)

diff --git a/conf/machine/am64xx-evm-k3r5.conf b/conf/machine/am64xx-evm-k3r5.conf
index afd36b72e..6fb693791 100644
--- a/conf/machine/am64xx-evm-k3r5.conf
+++ b/conf/machine/am64xx-evm-k3r5.conf
@@ -8,4 +8,12 @@ SYSFW_SOC = "am64x"
 SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "gp"
 
-UBOOT_MACHINE = "am64x_evm_r5_defconfig"
+UBOOT_CONFIG ??= "evm sk"
+UBOOT_CONFIG[evm] = "am64x_evm_r5_defconfig"
+UBOOT_CONFIG[sk] = "am64x_sk_r5_defconfig"
+
+UBOOT_MACHINE = ""
+
+UBOOT_BINARY = "tiboot3.${UBOOT_SUFFIX}"
+UBOOT_IMAGE = "tiboot3-am64x-${PV}-${PR}.${UBOOT_SUFFIX}"
+UBOOT_SYMLINK = "tiboot3-am64x.${UBOOT_SUFFIX}"
diff --git a/conf/machine/am64xx-evm.conf b/conf/machine/am64xx-evm.conf
index c6ba2a873..53837ad19 100644
--- a/conf/machine/am64xx-evm.conf
+++ b/conf/machine/am64xx-evm.conf
@@ -4,4 +4,16 @@
 
 require conf/machine/include/am64xx.inc
 
-UBOOT_MACHINE = "am64x_evm_a53_defconfig"
+IMAGE_BOOT_FILES = "tispl.bin u-boot.img"
+
+UBOOT_MACHINE = ""
+
+UBOOT_CONFIG ??= "evm sk"
+UBOOT_CONFIG[evm] = "am64x_evm_a53_defconfig"
+UBOOT_CONFIG[sk] = "am64x_sk_a53_defconfig"
+
+do_image_wic[depends] += "trusted-firmware-a:do_deploy"
+do_image_tar[depends] += "trusted-firmware-a:do_deploy"
+
+do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
diff --git a/conf/machine/include/am64xx.inc b/conf/machine/include/am64xx.inc
index 641bddd00..a46a50ed2 100644
--- a/conf/machine/include/am64xx.inc
+++ b/conf/machine/include/am64xx.inc
@@ -8,6 +8,7 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 KERNEL_DEVICETREE = " \
     ti/k3-am642-evm.dtb \
+    ti/k3-am642-sk.dtb \
 "
 
 # AM64 supports multi-certificate images, use the same
diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index ca0414c06..f65703c9a 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -398,8 +398,59 @@ do_deploy_append_j7200-evm-k3r5 () {
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
 
+do_deploy_append_am64xx-evm () {
+	if [ -n "${UBOOT_CONFIG}" ]
+	then
+		for config in ${UBOOT_MACHINE}; do
+			i=$(expr $i + 1);
+			for type in ${UBOOT_CONFIG}; do
+				j=$(expr $j + 1);
+				if [ $j -eq $i ]
+				then
+					install -d ${DEPLOYDIR}/${type}
+					install -D -m 644 ${B}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/${type}/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
+					cd ${DEPLOYDIR}/${type}
+					ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}-${type}
+					ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}
+					ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_BINARY}-${type}
+					ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_BINARY}
+					if [ -n "${SPL_BINARY}" ]
+					then
+						install -m 644 ${B}/${config}/${SPL_BINARY} ${DEPLOYDIR}/${type}/${SPL_IMAGE}-${type}-${PV}-${PR}
+						cd ${DEPLOYDIR}/${type}
+						ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${SPL_BINARYNAME}-${type}
+						ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${SPL_BINARYNAME}
+						ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${SPL_SYMLINK}-${type}
+						ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${SPL_SYMLINK}
+					fi
+				fi
+			done
+			unset j
+		done
+		unset i
+	fi
+}
+
+
 TOOLCHAIN = "gcc"
-- 
2.17.0

