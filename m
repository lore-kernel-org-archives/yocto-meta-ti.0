Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.13258.1603292546457972369
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Oct 2020 08:02:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ZCnRC4vu;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 371FB38C1166
	for <meta-ti@yoctoproject.org>; Wed, 21 Oct 2020 08:02:16 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09LF2F1v103853
	for <meta-ti@yoctoproject.org>; Wed, 21 Oct 2020 10:02:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603292535;
	bh=sxfB1rjSZXMdFYUakSkNHdKxbdc8L9nHExFT6b08C4w=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ZCnRC4vu3p1lKTjgaA9lSv6TCD83AWw5hfnksjoASsSJwfWCJl+g/Y23C5Wpl//x9
	 LGZUElN1IU4bdZtMecakQS2Ebsg5/wYmey8MgqNDuooS+akhTPY3Qp02mzn4i5thAz
	 CSJS3Y6iROdx03At1whPHyHS1hOva2vsplN3tXOw=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09LF2Fnc027252
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 21 Oct 2020 10:02:15 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 21
 Oct 2020 10:02:15 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 21 Oct 2020 10:02:14 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09LF2Ejh102678;
	Wed, 21 Oct 2020 10:02:14 -0500
From: "Dan Murphy" <dmurphy@ti.com>
To: <denys@ti.com>
CC: <s-anna@ti.com>, <praneeth@ti.com>, <meta-ti@yoctoproject.org>,
        Dan Murphy
	<dmurphy@ti.com>
Subject: [PATCH 2/3] u-boot-ti: Add new firmware to u-boot command line for j7
Date: Wed, 21 Oct 2020 10:02:09 -0500
Message-ID: <20201021150210.29966-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201021150210.29966-1-dmurphy@ti.com>
References: <20201021150210.29966-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index 2063bac24554..b7fd246aca6c 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -33,10 +33,14 @@ PV_append = "+git${SRCPV}"
 # u-boot needs devtree compiler to parse dts files
 DEPENDS += "dtc-native bc-native lzop-native flex-native bison-native"
 
+DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
+
 PACKAGECONFIG[atf] = "ATF=${STAGING_DIR_HOST}/firmware/bl31.bin,,trusted-firmware-a"
 PACKAGECONFIG[optee] = "TEE=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/bl32.bin,,optee-os"
+PACKAGECONFIG[dm] = "DM=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/pdk-ipc/${DM_FIRMWARE},,ti-rtos-firmware"
 
 PACKAGECONFIG_append_aarch64 = " atf optee"
+PACKAGECONFIG_append_j7 = " dm"
 
 COMPATIBLE_MACHINE = "(ti-soc)"
 
-- 
2.17.1

