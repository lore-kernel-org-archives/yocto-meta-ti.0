Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3B8FC77B7A
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 18:11:40 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.19178.1685038298630290834
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 25 May 2023 11:11:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=mX0Xri9R;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34PIBa7c087199;
	Thu, 25 May 2023 13:11:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685038296;
	bh=v/nI1FYB1Mzj1CclU2dZ+a660TdZXHjgV8hlcuQd5p0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=mX0Xri9REbJdSr1QFvzHmKI0x3/FZhYLZ1MIoP6jEhret1F5BqkNbQ2XxsXrvPKOn
	 mtpTNRJvpvwdVdP865vIXEL8KWtlbQ5dEln5W4fNGNxZODJsk4SzDamwQ34wudjwu7
	 cHXhQyaMN1xHmjfCetBuYIIq3s4OEQjeWnThVXNM=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34PIBaOK085287
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 25 May 2023 13:11:36 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 25
 May 2023 13:11:36 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 25 May 2023 13:11:36 -0500
Received: from lelv0326.itg.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34PIBXH0102467;
	Thu, 25 May 2023 13:11:36 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 7/9] u-boot-ti-staging: Use binman to package our firmware
Date: Thu, 25 May 2023 13:11:30 -0500
Message-ID: <20230525181132.417197-8-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230525181132.417197-1-afd@ti.com>
References: <20230525181132.417197-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 25 May 2023 18:11:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16594

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 27 ++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index 38ce5a58..f29b089e 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -25,6 +25,13 @@ PV:append = "+git${SRCPV}"
 # u-boot needs devtree compiler to parse dts files
 DEPENDS += "dtc-native bc-native lzop-native flex-native bison-native python3-setuptools-native"
 
+# u-boot needs these for binman
+DEPENDS += "python3-pyelftools-native python3-pyyaml-native python3-jsonschema-native"
+
+# SYSFW/TIFS Firmware
+DEPENDS:append:k3 = " ti-sci-fw"
+DEPENDS:append:k3r5 = " ti-sci-fw"
+
 DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
 
 PLAT_SFX = ""
@@ -37,7 +44,7 @@ PLAT_SFX:am64xx = "am64xx"
 PLAT_SFX:am62xx = "am62xx"
 PLAT_SFX:am62axx = "am62axx"
 
-PACKAGECONFIG[atf] = "ATF=${STAGING_DIR_HOST}/firmware/bl31.bin,,trusted-firmware-a"
+PACKAGECONFIG[atf] = "BL31=${STAGING_DIR_HOST}/firmware/bl31.bin,,trusted-firmware-a"
 PACKAGECONFIG[optee] = "TEE=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/bl32.bin,,optee-os"
 PACKAGECONFIG[dm] = "DM=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/ti-dm/${PLAT_SFX}/${DM_FIRMWARE},,ti-dm-fw"
 
@@ -51,7 +58,9 @@ PACKAGECONFIG:append:am62axx = " dm"
 
 COMPATIBLE_MACHINE = "(ti-soc)"
 
-EXTRA_OEMAKE += "${PACKAGECONFIG_CONFARGS}"
+BINMAN_INDIRS="${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware"
+
+EXTRA_OEMAKE += "${PACKAGECONFIG_CONFARGS} BINMAN_INDIRS=${BINMAN_INDIRS}"
 
 PROVIDES += "u-boot"
 PKG:${PN} = "u-boot"
@@ -174,6 +183,20 @@ do_install:append () {
 	fi
 }
 
+do_deploy:append:k3r5 () {
+	for f in ${B}/tiboot3-*.bin; do
+		if [ -f "$f" ]; then
+			install -m 644 $f ${DEPLOYDIR}/
+		fi
+	done
+
+	for f in ${B}/sysfw*.itb; do
+		if [ -f "$f" ]; then
+			install -m 644 $f ${DEPLOYDIR}/
+		fi
+	done
+}
+
 do_deploy:append () {
 	if [ -n "${UBOOT_CONFIG}" ]
 	then
-- 
2.39.2


