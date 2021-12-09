Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.15691.1639075181572076955
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 10:39:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=JYwhCUSZ;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1B9IdaL3013227;
	Thu, 9 Dec 2021 12:39:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1639075176;
	bh=85fMIoXm5V4ecI4QL6PRy+iFd0u1vy6mZ0T7dc3UcDI=;
	h=From:To:CC:Subject:Date;
	b=JYwhCUSZaDqBnAefD1+1Nigtt+3x0InOM84E61GWmTD6g/XLODTYlesaVtFCvs/uW
	 WMHIg6QqbzvCEkkO90AEe3BtqzzmEpuifUImOg56sOn1hIdz6/RvgQCVvs7F25+D+q
	 bp15MtPjuh7zkD+SVtKQdv28tlGe5KY/a1PNUU9c=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1B9Ida7C029033
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Dec 2021 12:39:36 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 9
 Dec 2021 12:39:36 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 9 Dec 2021 12:39:35 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1B9IdZ1r015374;
	Thu, 9 Dec 2021 12:39:35 -0600
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
CC: <denis@denix.org>, Yogesh Siraswar <yogeshs@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCHv3] ti-sci-fw: Fix for k3-image-gen issue for combined boot images
Date: Thu, 9 Dec 2021 12:39:35 -0600
Message-ID: <20211209183935.6810-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Yogesh Siraswar <yogeshs@ti.com>

This is temporary fix for combined boot images for KIG in meta-ti till
the patch is integrated.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
v3: Addressed review comments and simplified the patch further

 ...gning-of-binaries-for-combined-boot-.patch | 38 +++++++++++++++++++
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb        |  5 +++
 2 files changed, 43 insertions(+)
 create mode 100644 recipes-bsp/ti-sci-fw/files/0001-Makefile-Skip-signing-of-binaries-for-combined-boot-.patch

diff --git a/recipes-bsp/ti-sci-fw/files/0001-Makefile-Skip-signing-of-binaries-for-combined-boot-.patch b/recipes-bsp/ti-sci-fw/files/0001-Makefile-Skip-signing-of-binaries-for-combined-boot-.patch
new file mode 100644
index 00000000..604c0c60
--- /dev/null
+++ b/recipes-bsp/ti-sci-fw/files/0001-Makefile-Skip-signing-of-binaries-for-combined-boot-.patch
@@ -0,0 +1,38 @@
+From 31134a5750ab645394c7ae72e8da46509d48bfb4 Mon Sep 17 00:00:00 2001
+From: Vignesh Raghavendra <vigneshr@ti.com>
+Date: Thu, 9 Dec 2021 12:24:08 -0600
+Subject: [tiKIG PATCHv2] Makefile: Skip signing of binaries for HS combined
+ boot
+
+Combined sysfw binaries used in tiboot3.bin do not require signed images.
+This fixes HS boot failures on am64x and j7200.
+
+Upstream-Status: Submitted
+Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
+Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
+Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
+---
+
+ Makefile | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Makefile b/Makefile
+index 47b3b20..18e9eb5 100644
+--- a/Makefile
++++ b/Makefile
+@@ -217,10 +217,12 @@ $(soc_objroot)/%.o: %.c
+ 
+ # On HS board configuration binaries must be signed
+ ifdef HS
++ifneq (,$(COMBINED_SYSFW_BRDCFG_LOADADDR))
+ %.bin.unsigned: %.o
+ 	$(CROSS_COMPILE)objcopy -S -O binary $< $@
+ %.bin: %.bin.unsigned
+ 	$(TI_SECURE_DEV_PKG)/scripts/secure-binary-image.sh $< $@
++endif
+ else
+ %.bin: %.o
+ 	$(CROSS_COMPILE)objcopy -S -O binary $< $@
+-- 
+2.17.1
+
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 6d48bf23..00756fd8 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -47,6 +47,11 @@ LD[unexport] = "1"
 
 do_configure[noexec] = "1"
 
+SRC_URI_append_j7200-hs-evm-k3r5 = "\
+	file://0001-Makefile-Skip-signing-of-binaries-for-combined-boot-.patch;patchdir=../imggen"
+SRC_URI_append_am64xx-hs-evm-k3r5 = "\
+	file://0001-Makefile-Skip-signing-of-binaries-for-combined-boot-.patch;patchdir=../imggen"
+
 EXTRA_OEMAKE = "\
     CROSS_COMPILE=${TARGET_PREFIX} SYSFW_DL_URL='' SYSFW_HS_DL_URL='' SYSFW_HS_INNER_CERT_DL_URL='' \
     SYSFW_PATH="${SYSFW_TISCI}" SOC=${SYSFW_SOC} CONFIG=${SYSFW_CONFIG} \
-- 
2.17.1

