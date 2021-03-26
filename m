Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.15852.1616777634165952020
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 Mar 2021 09:53:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=qjwNrydN;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12QGrqTV057663;
	Fri, 26 Mar 2021 11:53:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1616777632;
	bh=kbfWaWBdnWzD0FHk7r5B3yqvxjpWD8mHXLbrynE+4JA=;
	h=From:To:CC:Subject:Date;
	b=qjwNrydN3FfLf/KLOi3PTxkMuMwIbdQ2tqJyfphgyTmUKRvhPp4DBIuHr0IHNv/dS
	 lZJgeyTRvWs1mxELmRHilU7gyjQbT39s0IsHegHTXAr95ZAGBvvhUqxCe0fRswRpkf
	 ZR4Ns/Sm3kjKuxIblDt7a8o9/vbseJlT4c/tvfm8=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12QGrqMo106566
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 Mar 2021 11:53:52 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 26
 Mar 2021 11:53:52 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 26 Mar 2021 11:53:52 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12QGrpTr037415;
	Fri, 26 Mar 2021 11:53:52 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Lucas Weaver <l-weaver@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <denys@konsulko.com>
Subject: [dunfell/master PATCH] u-boot-ti: J721e: update HS build to include DM signing
Date: Fri, 26 Mar 2021 11:53:51 -0500
Message-ID: <20210326165351.29988-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

DM firmware is added now as part of the uboot build process.
This patch fixes HS signing and build including the new DM firmware.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index e5f92f4b..5cae1c15 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -57,6 +57,14 @@ S = "${WORKDIR}/git"
 TI_SECURE_DEV_PKG ?= ""
 export TI_SECURE_DEV_PKG
 
+do_compile_prepend_j7-hs-evm() {
+        ( cd ${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/pdk-ipc/; \
+                mv ipc_echo_testb_mcu1_0_release_strip.xer5f ipc_echo_testb_mcu1_0_release_strip.xer5f.unsigned; \
+                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_testb_mcu1_0_release_strip.xer5f.unsigned ipc_echo_testb_mcu1_0_release_strip.xer5f; \
+        )
+}
+
+
 SYSROOT_DIRS += "/boot"
 
 # SPL (Second Program Loader) to be loaded over UART
-- 
2.17.1

