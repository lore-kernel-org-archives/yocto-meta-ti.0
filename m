Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87AF0C77B7F
	for <webhook@archiver.kernel.org>; Tue, 25 Apr 2023 17:23:59 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.86187.1682443431381674240
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 25 Apr 2023 10:23:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Ky0kfIUI;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33PHNnX0099815;
	Tue, 25 Apr 2023 12:23:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682443429;
	bh=s+TYzatax+5SVmiLNHh3+ZeBC78sBbBrpET8mQ51ahk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Ky0kfIUICG6qy1+YGH6EyYIAp1ehnK6ZZBKXqJSNFXeQltl05fT7KgXF2/6AeW4kG
	 WvEvheCUtDMKV4QN0OMIukHSRhLzgNSdMp7JhdYlOahoIky0X1g408bRuImz6B/uxA
	 W3meHbdIcgJQRfiksFdt5oWexx/SyjR8EaFdQOnA=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33PHNnbr007725
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 25 Apr 2023 12:23:49 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 25
 Apr 2023 12:23:49 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 25 Apr 2023 12:23:49 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33PHNj0u030178;
	Tue, 25 Apr 2023 12:23:48 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>,
        Neha Malcom Francis <n-francis@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][RFC 7/9] u-boot-ti-staging: Use binman to package our firmware
Date: Tue, 25 Apr 2023 12:23:43 -0500
Message-ID: <20230425172345.12293-8-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230425172345.12293-1-afd@ti.com>
References: <20230425172345.12293-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 25 Apr 2023 17:23:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16425

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index 38ce5a58..c7fab71f 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -25,6 +25,12 @@ PV:append = "+git${SRCPV}"
 # u-boot needs devtree compiler to parse dts files
 DEPENDS += "dtc-native bc-native lzop-native flex-native bison-native python3-setuptools-native"
 
+# u-boot needs these for binman
+DEPENDS += "python3-pyelftools-native python3-pyyaml-native python3-jsonschema-native"
+
+# SYSFW/TIFS Firmware
+DEPENDS:append:k3 = " ti-sci-fw"
+
 DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
 
 PLAT_SFX = ""
@@ -37,7 +43,7 @@ PLAT_SFX:am64xx = "am64xx"
 PLAT_SFX:am62xx = "am62xx"
 PLAT_SFX:am62axx = "am62axx"
 
-PACKAGECONFIG[atf] = "ATF=${STAGING_DIR_HOST}/firmware/bl31.bin,,trusted-firmware-a"
+PACKAGECONFIG[atf] = "BL31=${STAGING_DIR_HOST}/firmware/bl31.bin,,trusted-firmware-a"
 PACKAGECONFIG[optee] = "TEE=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/bl32.bin,,optee-os"
 PACKAGECONFIG[dm] = "DM=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/ti-dm/${PLAT_SFX}/${DM_FIRMWARE},,ti-dm-fw"
 
@@ -51,7 +57,9 @@ PACKAGECONFIG:append:am62axx = " dm"
 
 COMPATIBLE_MACHINE = "(ti-soc)"
 
-EXTRA_OEMAKE += "${PACKAGECONFIG_CONFARGS}"
+BINMAN_INDIRS="${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware"
+
+EXTRA_OEMAKE += "${PACKAGECONFIG_CONFARGS} BINMAN_INDIRS=${BINMAN_INDIRS}"
 
 PROVIDES += "u-boot"
 PKG:${PN} = "u-boot"
-- 
2.39.2


