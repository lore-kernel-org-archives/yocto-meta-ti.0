Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 323E0C3DA4A
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 19:26:40 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.68354.1723145193382248872
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 08 Aug 2024 12:26:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Dzyyp8+8;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 478JQVVh049251;
	Thu, 8 Aug 2024 14:26:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1723145191;
	bh=uITrEgGPSX5R3nFAc8WZya/9O6J7tm/3T6Sna2C3uko=;
	h=From:To:Subject:Date;
	b=Dzyyp8+8SJ2WJmr/AB+9tQxt7laib03hcekS5K0nlzF4kKL9LZyW4aDzWWxqlhPca
	 eyIgsepASwT/gl8XyERXwcbkp2GXcLXIH7LgNsSRK0gt5gaiYQ16ENhSZfEEWnSvQX
	 ziEd3zV/bcWVw2ozkgDutE6OzcdYI2c1U4SORjB0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 478JQVPn027884
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Aug 2024 14:26:31 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Aug 2024 14:26:30 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Aug 2024 14:26:30 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 478JQU9v073055;
	Thu, 8 Aug 2024 14:26:30 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sc8mM-0003eD-HF; Thu, 08 Aug 2024 14:26:30 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH] u-boot-ti.inc: Refactor overrides to match changes in oe-core
Date: Thu, 8 Aug 2024 14:26:30 -0500
Message-ID: <20240808192630.13981-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 08 Aug 2024 19:26:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17930

A recent change in oe-core [1] to refactor the uboot flow allows for a more
targeted refactoring of our override code as well.

Additionally, fix the UBOOT_CONFIG code to work correctly for k3r5
builds.

[1] https://git.openembedded.org/openembedded-core/commit/?id=e29d006a118643b276c6977cb70b0fb56635fc33

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 392 +++++++++----------
 1 file changed, 192 insertions(+), 200 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index 4e6825a8..bb50e1e9 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -115,104 +115,115 @@ UBOOT_HS_2ND_BINARY = "u-boot-spl_HS_2ND"
 UBOOT_HS_2ND_IMAGE = "u-boot-spl_HS_2ND-${MACHINE}-${PV}-${PR}"
 UBOOT_HS_2ND_SYMLINK = "u-boot-spl_HS_2ND-${MACHINE}"
 
-do_compile:append:k3r5 () {
-	if [ -n "${UBOOT_CONFIG}" ];
-	then
-		for config in ${UBOOT_MACHINE}; do
-			i=$(expr $i + 1);
-			for type in ${UBOOT_CONFIG}; do
-				j=$(expr $j + 1);
-				if [ $j -eq $i ];
-				then
-					if ! [ -L ${B}/${config}/${UBOOT_BINARY} ] && ! [ -f ${B}/${config}/${UBOOT_BINARY} ]; then
-						ln -s ${B}/${config}/spl/u-boot-spl.${UBOOT_SUFFIX} ${B}/${config}/${UBOOT_BINARY}
-					fi
-				fi
-			done
-			unset  j
-		done
-		unset  i
-	else
-		if ! [ -f ${B}/${UBOOT_BINARY} ]; then
-			ln -s spl/u-boot-spl.${UBOOT_SUFFIX} ${B}/${UBOOT_BINARY}
-		fi
-	fi
+uboot_compile:append () {
+    if ! [ -f ${B}/${UBOOT_BINARY} ]; then
+        ln -s spl/u-boot-spl.${UBOOT_SUFFIX} ${B}/${UBOOT_BINARY}
+    fi
 }
 
-do_install:append () {
-	if [ -n "${UBOOT_CONFIG}" ]
-	then
-		for config in ${UBOOT_MACHINE}; do
-			i=$(expr $i + 1);
-			for type in ${UBOOT_CONFIG}; do
-				j=$(expr $j + 1);
-				if [ $j -eq $i ]
-				then
-					if [ "x${SPL_UART_BINARY}" != "x" ]; then
-						install ${B}/${config}/spl/${SPL_UART_BINARY} ${D}/boot/${SPL_UART_IMAGE}-${type}
-						ln -sf ${SPL_UART_IMAGE}-${type} ${D}/boot/${SPL_UART_BINARY}-${type}
-						ln -sf ${SPL_UART_IMAGE}-${type} ${D}/boot/${SPL_UART_BINARY}
-					fi
-					if [ -f ${B}/${config}/${SPL_HS_MLO_BINARY} ]; then
-						install ${B}/${config}/${SPL_HS_MLO_BINARY} ${D}/boot/${SPL_HS_MLO_IMAGE}-${type}
-						ln -sf ${SPL_HS_MLO_IMAGE}-${type} ${D}/boot/${SPL_HS_MLO_BINARY}-${type}
-						ln -sf ${SPL_HS_MLO_IMAGE}-${type} ${D}/boot/${SPL_HS_MLO_BINARY}
-					fi
-					if [ -f ${B}/${config}/${UBOOT_HS_XLD_BINARY} ]; then
-						install ${B}/${config}/${UBOOT_HS_XLD_BINARY} ${D}/boot/${UBOOT_HS_XLD_IMAGE}-${type}
-						ln -sf ${UBOOT_HS_XLD_IMAGE}-${type} ${D}/boot/${UBOOT_HS_XLD_BINARY}-${type}
-						ln -sf ${UBOOT_HS_XLD_IMAGE}-${type} ${D}/boot/${UBOOT_HS_XLD_BINARY}
-					fi
-					if [ -f ${B}/${config}/${UBOOT_HS_MLO_BINARY} ]; then
-						install ${B}/${config}/${UBOOT_HS_MLO_BINARY} ${D}/boot/${UBOOT_HS_MLO_IMAGE}-${type}
-						ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${D}/boot/${UBOOT_HS_MLO_BINARY}-${type}
-						ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${D}/boot/${UBOOT_HS_MLO_BINARY}
-					fi
-					if [ -f ${B}/${config}/${UBOOT_HS_ISSW_BINARY} ]; then
-						install ${B}/${config}/${UBOOT_HS_ISSW_BINARY} ${D}/boot/${UBOOT_HS_ISSW_IMAGE}-${type}
-						ln -sf ${UBOOT_HS_ISSW_IMAGE}-${type} ${D}/boot/${UBOOT_HS_ISSW_BINARY}-${type}
-						ln -sf ${UBOOT_HS_ISSW_IMAGE}-${type} ${D}/boot/${UBOOT_HS_ISSW_BINARY}
-					fi
-					if [ -f ${B}/${config}/${UBOOT_HS_2ND_BINARY} ]; then
-						install ${B}/${config}/${UBOOT_HS_2ND_BINARY} ${D}/boot/${UBOOT_HS_2ND_IMAGE}-${type}
-						ln -sf ${UBOOT_HS_2ND_IMAGE}-${type} ${D}/boot/${UBOOT_HS_2ND_BINARY}-${type}
-						ln -sf ${UBOOT_HS_2ND_IMAGE}-${type} ${D}/boot/${UBOOT_HS_2ND_BINARY}
-					fi
-				fi
-			done
-			unset  j
-		done
-		unset  i
-	else
-		if [ "x${SPL_UART_BINARY}" != "x" ]; then
-			install ${B}/spl/${SPL_UART_BINARY} ${D}/boot/${SPL_UART_IMAGE}
-			ln -sf ${SPL_UART_IMAGE} ${D}/boot/${SPL_UART_BINARY}
-		fi
-		if [ -f ${B}/${SPL_HS_MLO_BINARY} ]; then
-			install ${B}/${SPL_HS_MLO_BINARY} ${D}/boot/${SPL_HS_MLO_IMAGE}
-			ln -sf ${SPL_HS_MLO_IMAGE} ${D}/boot/${SPL_HS_MLO_BINARY}
-		fi
-		if [ -f ${B}/${UBOOT_HS_XLD_BINARY} ]; then
-			install ${B}/${UBOOT_HS_XLD_BINARY} ${D}/boot/${UBOOT_HS_XLD_IMAGE}
-			ln -sf ${UBOOT_HS_XLD_IMAGE} ${D}/boot/${UBOOT_HS_XLD_BINARY}
-		fi
-		if [ -f ${B}/${UBOOT_HS_MLO_BINARY} ]; then
-			install ${B}/${UBOOT_HS_MLO_BINARY} ${D}/boot/${UBOOT_HS_MLO_IMAGE}
-			ln -sf ${UBOOT_HS_MLO_IMAGE} ${D}/boot/${UBOOT_HS_MLO_BINARY}
-		fi
-		if [ -f ${B}/${UBOOT_HS_ISSW_BINARY} ]; then
-			install ${B}/${UBOOT_HS_ISSW_BINARY} ${D}/boot/${UBOOT_HS_ISSW_IMAGE}
-			ln -sf ${UBOOT_HS_ISSW_IMAGE} ${D}/boot/${UBOOT_HS_ISSW_BINARY}
+uboot_compile_config_copy_binary:k3r5 () {
+    config=$1
+    type=$2
+    binary=$3
+
+    if ! [ -L ${B}/${config}/${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX} ] && ! [ -f ${B}/${config}/${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX} ]; then
+        ln -s ${B}/${config}/spl/u-boot-spl.${UBOOT_SUFFIX} ${B}/${config}/${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX}
+    fi
+
+    if ! [ -L ${B}/${config}/${binary} ] && ! [ -f ${B}/${config}/${binary} ]; then
+        ln -s ${B}/${config}/spl/u-boot-spl.${UBOOT_SUFFIX} ${B}/${config}/${binary}
+    fi
+}
+
+uboot_install_config:append () {
+    if [ "x${SPL_UART_BINARY}" != "x" ]; then
+        install ${B}/${config}/spl/${SPL_UART_BINARY} ${D}/boot/${SPL_UART_IMAGE}-${type}
+        ln -sf ${SPL_UART_IMAGE}-${type} ${D}/boot/${SPL_UART_BINARY}-${type}
+        ln -sf ${SPL_UART_IMAGE}-${type} ${D}/boot/${SPL_UART_BINARY}
+    fi
+    if [ -f ${B}/${config}/${SPL_HS_MLO_BINARY} ]; then
+        install ${B}/${config}/${SPL_HS_MLO_BINARY} ${D}/boot/${SPL_HS_MLO_IMAGE}-${type}
+        ln -sf ${SPL_HS_MLO_IMAGE}-${type} ${D}/boot/${SPL_HS_MLO_BINARY}-${type}
+        ln -sf ${SPL_HS_MLO_IMAGE}-${type} ${D}/boot/${SPL_HS_MLO_BINARY}
+    fi
+    if [ -f ${B}/${config}/${UBOOT_HS_XLD_BINARY} ]; then
+        install ${B}/${config}/${UBOOT_HS_XLD_BINARY} ${D}/boot/${UBOOT_HS_XLD_IMAGE}-${type}
+        ln -sf ${UBOOT_HS_XLD_IMAGE}-${type} ${D}/boot/${UBOOT_HS_XLD_BINARY}-${type}
+        ln -sf ${UBOOT_HS_XLD_IMAGE}-${type} ${D}/boot/${UBOOT_HS_XLD_BINARY}
+    fi
+    if [ -f ${B}/${config}/${UBOOT_HS_MLO_BINARY} ]; then
+        install ${B}/${config}/${UBOOT_HS_MLO_BINARY} ${D}/boot/${UBOOT_HS_MLO_IMAGE}-${type}
+        ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${D}/boot/${UBOOT_HS_MLO_BINARY}-${type}
+        ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${D}/boot/${UBOOT_HS_MLO_BINARY}
+    fi
+    if [ -f ${B}/${config}/${UBOOT_HS_ISSW_BINARY} ]; then
+        install ${B}/${config}/${UBOOT_HS_ISSW_BINARY} ${D}/boot/${UBOOT_HS_ISSW_IMAGE}-${type}
+        ln -sf ${UBOOT_HS_ISSW_IMAGE}-${type} ${D}/boot/${UBOOT_HS_ISSW_BINARY}-${type}
+        ln -sf ${UBOOT_HS_ISSW_IMAGE}-${type} ${D}/boot/${UBOOT_HS_ISSW_BINARY}
+    fi
+    if [ -f ${B}/${config}/${UBOOT_HS_2ND_BINARY} ]; then
+        install ${B}/${config}/${UBOOT_HS_2ND_BINARY} ${D}/boot/${UBOOT_HS_2ND_IMAGE}-${type}
+        ln -sf ${UBOOT_HS_2ND_IMAGE}-${type} ${D}/boot/${UBOOT_HS_2ND_BINARY}-${type}
+        ln -sf ${UBOOT_HS_2ND_IMAGE}-${type} ${D}/boot/${UBOOT_HS_2ND_BINARY}
+    fi
+}
+
+uboot_install:append () {
+    if [ "x${SPL_UART_BINARY}" != "x" ]; then
+        install ${B}/spl/${SPL_UART_BINARY} ${D}/boot/${SPL_UART_IMAGE}
+        ln -sf ${SPL_UART_IMAGE} ${D}/boot/${SPL_UART_BINARY}
+    fi
+    if [ -f ${B}/${SPL_HS_MLO_BINARY} ]; then
+        install ${B}/${SPL_HS_MLO_BINARY} ${D}/boot/${SPL_HS_MLO_IMAGE}
+        ln -sf ${SPL_HS_MLO_IMAGE} ${D}/boot/${SPL_HS_MLO_BINARY}
+    fi
+    if [ -f ${B}/${UBOOT_HS_XLD_BINARY} ]; then
+        install ${B}/${UBOOT_HS_XLD_BINARY} ${D}/boot/${UBOOT_HS_XLD_IMAGE}
+        ln -sf ${UBOOT_HS_XLD_IMAGE} ${D}/boot/${UBOOT_HS_XLD_BINARY}
+    fi
+    if [ -f ${B}/${UBOOT_HS_MLO_BINARY} ]; then
+        install ${B}/${UBOOT_HS_MLO_BINARY} ${D}/boot/${UBOOT_HS_MLO_IMAGE}
+        ln -sf ${UBOOT_HS_MLO_IMAGE} ${D}/boot/${UBOOT_HS_MLO_BINARY}
+    fi
+    if [ -f ${B}/${UBOOT_HS_ISSW_BINARY} ]; then
+        install ${B}/${UBOOT_HS_ISSW_BINARY} ${D}/boot/${UBOOT_HS_ISSW_IMAGE}
+        ln -sf ${UBOOT_HS_ISSW_IMAGE} ${D}/boot/${UBOOT_HS_ISSW_BINARY}
+    fi
+    if [ -f ${B}/${UBOOT_HS_2ND_BINARY} ]; then
+        install ${B}/${UBOOT_HS_2ND_BINARY} ${D}/boot/${UBOOT_HS_2ND_IMAGE}
+        ln -sf ${UBOOT_HS_2ND_IMAGE} ${D}/boot/${UBOOT_HS_2ND_BINARY}
+    fi
+}
+
+do_deploy:append:k3r5 () {
+	rm ${DEPLOYDIR}/u-boot-initial-env* || true
+	rm ${DEPLOYDIR}/${PN}-initial-env* || true
+	rm ${DEPLOYDIR}/u-boot-initial-env-${MACHINE}* || true
+	rm ${DEPLOYDIR}/${PN}-initial-env-${MACHINE}* || true
+	rm ${DEPLOYDIR}/u-boot-initial-env-${MACHINE}-${PV}-${PR}* || true
+	rm ${DEPLOYDIR}/${PN}-initial-env-${MACHINE}-${PV}-${PR}* || true
+}
+
+uboot_deploy_config:append:k3r5 () {
+    for f in ${B}/${config}/tiboot3-*.bin; do
+		if [ -f "$f" ]; then
+            f_base=$(basename $f)
+			install -m 644 $f ${DEPLOYDIR}/${f_base}-${type}
+            ln -sf ${f_base}-${type} ${DEPLOYDIR}/${f_base}
 		fi
-		if [ -f ${B}/${UBOOT_HS_2ND_BINARY} ]; then
-			install ${B}/${UBOOT_HS_2ND_BINARY} ${D}/boot/${UBOOT_HS_2ND_IMAGE}
-			ln -sf ${UBOOT_HS_2ND_IMAGE} ${D}/boot/${UBOOT_HS_2ND_BINARY}
+	done
+
+	for f in ${B}/${config}/sysfw*.itb; do
+		if [ -f "$f" ]; then
+            f_base=$(basename $f)
+			install -m 644 $f ${DEPLOYDIR}/${f_base}-${type}
+            ln -sf ${f_base}-${type} ${DEPLOYDIR}/${f_base}
 		fi
-	fi
+	done
 }
 
-do_deploy:append:k3r5 () {
-	for f in ${B}/tiboot3-*.bin; do
+uboot_deploy:append:k3r5 () {
+    for f in ${B}/tiboot3-*.bin; do
 		if [ -f "$f" ]; then
 			install -m 644 $f ${DEPLOYDIR}/
 		fi
@@ -223,117 +234,98 @@ do_deploy:append:k3r5 () {
 			install -m 644 $f ${DEPLOYDIR}/
 		fi
 	done
+}
 
-	rm ${DEPLOYDIR}/u-boot-initial-env || true
-	rm ${DEPLOYDIR}/${PN}-initial-env || true
-	rm ${DEPLOYDIR}/u-boot-initial-env-${MACHINE} || true
-	rm ${DEPLOYDIR}/${PN}-initial-env-${MACHINE} || true
-	rm ${DEPLOYDIR}/u-boot-initial-env-${MACHINE}-${PV}-${PR} || true
-	rm ${DEPLOYDIR}/${PN}-initial-env-${MACHINE}-${PV}-${PR} || true
+uboot_deploy_config:append () {
+    cd ${DEPLOYDIR}
+    if [ "x${SPL_UART_BINARY}" != "x" ]; then
+        install ${B}/${config}/spl/${SPL_UART_BINARY} ${SPL_UART_IMAGE}-${type}
+        rm -f ${SPL_UART_BINARY} ${SPL_UART_SYMLINK}
+        ln -sf ${SPL_UART_IMAGE}-${type} ${SPL_UART_BINARY}-${type}
+        ln -sf ${SPL_UART_IMAGE}-${type} ${SPL_UART_BINARY}
+        ln -sf ${SPL_UART_IMAGE}-${type} ${SPL_UART_SYMLINK}-${type}
+        ln -sf ${SPL_UART_IMAGE}-${type} ${SPL_UART_SYMLINK}
+    fi
+    if [ -f ${B}/${config}/${SPL_HS_MLO_BINARY} ]; then
+        install ${B}/${config}/${SPL_HS_MLO_BINARY} ${SPL_HS_MLO_IMAGE}-${type}
+        rm -f ${SPL_HS_MLO_BINARY} ${SPL_HS_MLO_SYMLINK}
+        ln -sf ${SPL_HS_MLO_IMAGE}-${type} ${SPL_HS_MLO_SYMLINK}-${type}
+        ln -sf ${SPL_HS_MLO_IMAGE}-${type} ${SPL_HS_MLO_SYMLINK}
+        ln -sf ${SPL_HS_MLO_IMAGE}-${type} ${SPL_HS_MLO_BINARY}-${type}
+        ln -sf ${SPL_HS_MLO_IMAGE}-${type} ${SPL_HS_MLO_BINARY}
+    fi
+    if [ -f ${B}/${config}/${UBOOT_HS_XLD_BINARY} ]; then
+        install ${B}/${config}/${UBOOT_HS_XLD_BINARY} ${UBOOT_HS_XLD_IMAGE}-${type}
+        rm -f ${UBOOT_HS_XLD_BINARY} ${UBOOT_HS_XLD_SYMLINK}
+        ln -sf ${UBOOT_HS_XLD_IMAGE}-${type} ${UBOOT_HS_XLD_SYMLINK}-${type}
+        ln -sf ${UBOOT_HS_XLD_IMAGE}-${type} ${UBOOT_HS_XLD_SYMLINK}
+        ln -sf ${UBOOT_HS_XLD_IMAGE}-${type} ${UBOOT_HS_XLD_BINARY}-${type}
+        ln -sf ${UBOOT_HS_XLD_IMAGE}-${type} ${UBOOT_HS_XLD_BINARY}
+    fi
+    if [ -f ${B}/${config}/${UBOOT_HS_MLO_BINARY} ]; then
+        install ${B}/${config}/${UBOOT_HS_MLO_BINARY} ${UBOOT_HS_MLO_IMAGE}-${type}
+        rm -f ${UBOOT_HS_MLO_BINARY} ${UBOOT_HS_MLO_SYMLINK}
+        ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${UBOOT_HS_MLO_SYMLINK}-${type}
+        ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${UBOOT_HS_MLO_SYMLINK}
+        ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${UBOOT_HS_MLO_BINARY}-${type}
+        ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${UBOOT_HS_MLO_BINARY}
+    fi
+    if [ -f ${B}/${config}/${UBOOT_HS_ISSW_BINARY} ]; then
+        install ${B}/${config}/${UBOOT_HS_ISSW_BINARY} ${UBOOT_HS_ISSW_IMAGE}-${type}
+        rm -f ${UBOOT_HS_ISSW_BINARY} ${UBOOT_HS_ISSW_SYMLINK}
+        ln -sf ${UBOOT_HS_ISSW_IMAGE}-${type} ${UBOOT_HS_ISSW_SYMLINK}-${type}
+        ln -sf ${UBOOT_HS_ISSW_IMAGE}-${type} ${UBOOT_HS_ISSW_SYMLINK}
+        ln -sf ${UBOOT_HS_ISSW_IMAGE}-${type} ${UBOOT_HS_ISSW_BINARY}-${type}
+        ln -sf ${UBOOT_HS_ISSW_IMAGE}-${type} ${UBOOT_HS_ISSW_BINARY}
+    fi
+    if [ -f ${B}/${config}/${UBOOT_HS_2ND_BINARY} ]; then
+        install ${B}/${config}/${UBOOT_HS_2ND_BINARY} ${UBOOT_HS_2ND_IMAGE}-${type}
+        rm -f ${UBOOT_HS_2ND_BINARY} ${UBOOT_HS_2ND_SYMLINK}
+        ln -sf ${UBOOT_HS_2ND_IMAGE}-${type} ${UBOOT_HS_2ND_SYMLINK}-${type}
+        ln -sf ${UBOOT_HS_2ND_IMAGE}-${type} ${UBOOT_HS_2ND_SYMLINK}
+        ln -sf ${UBOOT_HS_2ND_IMAGE}-${type} ${UBOOT_HS_2ND_BINARY}-${type}
+        ln -sf ${UBOOT_HS_2ND_IMAGE}-${type} ${UBOOT_HS_2ND_BINARY}
+    fi
 }
 
-do_deploy:append () {
-	if [ -n "${UBOOT_CONFIG}" ]
-	then
-		for config in ${UBOOT_MACHINE}; do
-			i=$(expr $i + 1);
-			for type in ${UBOOT_CONFIG}; do
-				j=$(expr $j + 1);
-				if [ $j -eq $i ]
-				then
-					cd ${DEPLOYDIR}
-					if [ "x${SPL_UART_BINARY}" != "x" ]; then
-						install ${B}/${config}/spl/${SPL_UART_BINARY} ${SPL_UART_IMAGE}-${type}
-						rm -f ${SPL_UART_BINARY} ${SPL_UART_SYMLINK}
-						ln -sf ${SPL_UART_IMAGE}-${type} ${SPL_UART_BINARY}-${type}
-						ln -sf ${SPL_UART_IMAGE}-${type} ${SPL_UART_BINARY}
-						ln -sf ${SPL_UART_IMAGE}-${type} ${SPL_UART_SYMLINK}-${type}
-						ln -sf ${SPL_UART_IMAGE}-${type} ${SPL_UART_SYMLINK}
-					fi
-					if [ -f ${B}/${config}/${SPL_HS_MLO_BINARY} ]; then
-						install ${B}/${config}/${SPL_HS_MLO_BINARY} ${SPL_HS_MLO_IMAGE}-${type}
-						rm -f ${SPL_HS_MLO_BINARY} ${SPL_HS_MLO_SYMLINK}
-						ln -sf ${SPL_HS_MLO_IMAGE}-${type} ${SPL_HS_MLO_SYMLINK}-${type}
-						ln -sf ${SPL_HS_MLO_IMAGE}-${type} ${SPL_HS_MLO_SYMLINK}
-						ln -sf ${SPL_HS_MLO_IMAGE}-${type} ${SPL_HS_MLO_BINARY}-${type}
-						ln -sf ${SPL_HS_MLO_IMAGE}-${type} ${SPL_HS_MLO_BINARY}
-					fi
-					if [ -f ${B}/${config}/${UBOOT_HS_XLD_BINARY} ]; then
-						install ${B}/${config}/${UBOOT_HS_XLD_BINARY} ${UBOOT_HS_XLD_IMAGE}-${type}
-						rm -f ${UBOOT_HS_XLD_BINARY} ${UBOOT_HS_XLD_SYMLINK}
-						ln -sf ${UBOOT_HS_XLD_IMAGE}-${type} ${UBOOT_HS_XLD_SYMLINK}-${type}
-						ln -sf ${UBOOT_HS_XLD_IMAGE}-${type} ${UBOOT_HS_XLD_SYMLINK}
-						ln -sf ${UBOOT_HS_XLD_IMAGE}-${type} ${UBOOT_HS_XLD_BINARY}-${type}
-						ln -sf ${UBOOT_HS_XLD_IMAGE}-${type} ${UBOOT_HS_XLD_BINARY}
-					fi
-					if [ -f ${B}/${config}/${UBOOT_HS_MLO_BINARY} ]; then
-						install ${B}/${config}/${UBOOT_HS_MLO_BINARY} ${UBOOT_HS_MLO_IMAGE}-${type}
-						rm -f ${UBOOT_HS_MLO_BINARY} ${UBOOT_HS_MLO_SYMLINK}
-						ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${UBOOT_HS_MLO_SYMLINK}-${type}
-						ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${UBOOT_HS_MLO_SYMLINK}
-						ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${UBOOT_HS_MLO_BINARY}-${type}
-						ln -sf ${UBOOT_HS_MLO_IMAGE}-${type} ${UBOOT_HS_MLO_BINARY}
-					fi
-					if [ -f ${B}/${config}/${UBOOT_HS_ISSW_BINARY} ]; then
-						install ${B}/${config}/${UBOOT_HS_ISSW_BINARY} ${UBOOT_HS_ISSW_IMAGE}-${type}
-						rm -f ${UBOOT_HS_ISSW_BINARY} ${UBOOT_HS_ISSW_SYMLINK}
-						ln -sf ${UBOOT_HS_ISSW_IMAGE}-${type} ${UBOOT_HS_ISSW_SYMLINK}-${type}
-						ln -sf ${UBOOT_HS_ISSW_IMAGE}-${type} ${UBOOT_HS_ISSW_SYMLINK}
-						ln -sf ${UBOOT_HS_ISSW_IMAGE}-${type} ${UBOOT_HS_ISSW_BINARY}-${type}
-						ln -sf ${UBOOT_HS_ISSW_IMAGE}-${type} ${UBOOT_HS_ISSW_BINARY}
-					fi
-					if [ -f ${B}/${config}/${UBOOT_HS_2ND_BINARY} ]; then
-						install ${B}/${config}/${UBOOT_HS_2ND_BINARY} ${UBOOT_HS_2ND_IMAGE}-${type}
-						rm -f ${UBOOT_HS_2ND_BINARY} ${UBOOT_HS_2ND_SYMLINK}
-						ln -sf ${UBOOT_HS_2ND_IMAGE}-${type} ${UBOOT_HS_2ND_SYMLINK}-${type}
-						ln -sf ${UBOOT_HS_2ND_IMAGE}-${type} ${UBOOT_HS_2ND_SYMLINK}
-						ln -sf ${UBOOT_HS_2ND_IMAGE}-${type} ${UBOOT_HS_2ND_BINARY}-${type}
-						ln -sf ${UBOOT_HS_2ND_IMAGE}-${type} ${UBOOT_HS_2ND_BINARY}
-					fi
-				fi
-			done
-			unset  j
-		done
-		unset  i
-	else
-		cd ${DEPLOYDIR}
-		if [ "x${SPL_UART_BINARY}" != "x" ]; then
-			install ${B}/spl/${SPL_UART_BINARY} ${SPL_UART_IMAGE}
-			rm -f ${SPL_UART_BINARY} ${SPL_UART_SYMLINK}
-			ln -sf ${SPL_UART_IMAGE} ${SPL_UART_BINARY}
-			ln -sf ${SPL_UART_IMAGE} ${SPL_UART_SYMLINK}
-		fi
-		if [ -f ${B}/${SPL_HS_MLO_BINARY} ]; then
-			install ${B}/${SPL_HS_MLO_BINARY} ${SPL_HS_MLO_IMAGE}
-			rm -f ${SPL_HS_MLO_BINARY} ${SPL_HS_MLO_SYMLINK}
-			ln -sf ${SPL_HS_MLO_IMAGE} ${SPL_HS_MLO_SYMLINK}
-			ln -sf ${SPL_HS_MLO_IMAGE} ${SPL_HS_MLO_BINARY}
-		fi
-		if [ -f ${B}/${UBOOT_HS_XLD_BINARY} ]; then
-			install ${B}/${UBOOT_HS_XLD_BINARY} ${UBOOT_HS_XLD_IMAGE}
-			rm -f ${UBOOT_HS_XLD_BINARY} ${UBOOT_HS_XLD_SYMLINK}
-			ln -sf ${UBOOT_HS_XLD_IMAGE} ${UBOOT_HS_XLD_SYMLINK}
-			ln -sf ${UBOOT_HS_XLD_IMAGE} ${UBOOT_HS_XLD_BINARY}
-		fi
-		if [ -f ${B}/${UBOOT_HS_MLO_BINARY} ]; then
-			install ${B}/${UBOOT_HS_MLO_BINARY} ${UBOOT_HS_MLO_IMAGE}
-			rm -f ${UBOOT_HS_MLO_BINARY} ${UBOOT_HS_MLO_SYMLINK}
-			ln -sf ${UBOOT_HS_MLO_IMAGE} ${UBOOT_HS_MLO_SYMLINK}
-			ln -sf ${UBOOT_HS_MLO_IMAGE} ${UBOOT_HS_MLO_BINARY}
-		fi
-		if [ -f ${B}/${UBOOT_HS_ISSW_BINARY} ]; then
-			install ${B}/${UBOOT_HS_ISSW_BINARY} ${UBOOT_HS_ISSW_IMAGE}
-			rm -f ${UBOOT_HS_ISSW_BINARY} ${UBOOT_HS_ISSW_SYMLINK}
-			ln -sf ${UBOOT_HS_ISSW_IMAGE} ${UBOOT_HS_ISSW_SYMLINK}
-			ln -sf ${UBOOT_HS_ISSW_IMAGE} ${UBOOT_HS_ISSW_BINARY}
-		fi
-		if [ -f ${B}/${UBOOT_HS_2ND_BINARY} ]; then
-			install ${B}/${UBOOT_HS_2ND_BINARY} ${UBOOT_HS_2ND_IMAGE}
-			rm -f ${UBOOT_HS_2ND_BINARY} ${UBOOT_HS_2ND_SYMLINK}
-			ln -sf ${UBOOT_HS_2ND_IMAGE} ${UBOOT_HS_2ND_SYMLINK}
-			ln -sf ${UBOOT_HS_2ND_IMAGE} ${UBOOT_HS_2ND_BINARY}
-		fi
-	fi
+uboot_deploy:append () {
+    cd ${DEPLOYDIR}
+    if [ "x${SPL_UART_BINARY}" != "x" ]; then
+        install ${B}/spl/${SPL_UART_BINARY} ${SPL_UART_IMAGE}
+        rm -f ${SPL_UART_BINARY} ${SPL_UART_SYMLINK}
+        ln -sf ${SPL_UART_IMAGE} ${SPL_UART_BINARY}
+        ln -sf ${SPL_UART_IMAGE} ${SPL_UART_SYMLINK}
+    fi
+    if [ -f ${B}/${SPL_HS_MLO_BINARY} ]; then
+        install ${B}/${SPL_HS_MLO_BINARY} ${SPL_HS_MLO_IMAGE}
+        rm -f ${SPL_HS_MLO_BINARY} ${SPL_HS_MLO_SYMLINK}
+        ln -sf ${SPL_HS_MLO_IMAGE} ${SPL_HS_MLO_SYMLINK}
+        ln -sf ${SPL_HS_MLO_IMAGE} ${SPL_HS_MLO_BINARY}
+    fi
+    if [ -f ${B}/${UBOOT_HS_XLD_BINARY} ]; then
+        install ${B}/${UBOOT_HS_XLD_BINARY} ${UBOOT_HS_XLD_IMAGE}
+        rm -f ${UBOOT_HS_XLD_BINARY} ${UBOOT_HS_XLD_SYMLINK}
+        ln -sf ${UBOOT_HS_XLD_IMAGE} ${UBOOT_HS_XLD_SYMLINK}
+        ln -sf ${UBOOT_HS_XLD_IMAGE} ${UBOOT_HS_XLD_BINARY}
+    fi
+    if [ -f ${B}/${UBOOT_HS_MLO_BINARY} ]; then
+        install ${B}/${UBOOT_HS_MLO_BINARY} ${UBOOT_HS_MLO_IMAGE}
+        rm -f ${UBOOT_HS_MLO_BINARY} ${UBOOT_HS_MLO_SYMLINK}
+        ln -sf ${UBOOT_HS_MLO_IMAGE} ${UBOOT_HS_MLO_SYMLINK}
+        ln -sf ${UBOOT_HS_MLO_IMAGE} ${UBOOT_HS_MLO_BINARY}
+    fi
+    if [ -f ${B}/${UBOOT_HS_ISSW_BINARY} ]; then
+        install ${B}/${UBOOT_HS_ISSW_BINARY} ${UBOOT_HS_ISSW_IMAGE}
+        rm -f ${UBOOT_HS_ISSW_BINARY} ${UBOOT_HS_ISSW_SYMLINK}
+        ln -sf ${UBOOT_HS_ISSW_IMAGE} ${UBOOT_HS_ISSW_SYMLINK}
+        ln -sf ${UBOOT_HS_ISSW_IMAGE} ${UBOOT_HS_ISSW_BINARY}
+    fi
+    if [ -f ${B}/${UBOOT_HS_2ND_BINARY} ]; then
+        install ${B}/${UBOOT_HS_2ND_BINARY} ${UBOOT_HS_2ND_IMAGE}
+        rm -f ${UBOOT_HS_2ND_BINARY} ${UBOOT_HS_2ND_SYMLINK}
+        ln -sf ${UBOOT_HS_2ND_IMAGE} ${UBOOT_HS_2ND_SYMLINK}
+        ln -sf ${UBOOT_HS_2ND_IMAGE} ${UBOOT_HS_2ND_BINARY}
+    fi
 }
 
 do_install:append:am62xx() {
-- 
2.17.1


