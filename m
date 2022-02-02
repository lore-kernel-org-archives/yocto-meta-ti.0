Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.60572.1643783683108112894
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 01 Feb 2022 22:34:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ltu5+Inw;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2126YcZ9029235;
	Wed, 2 Feb 2022 00:34:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1643783678;
	bh=jEIbjx1vNM3Pn88Ttqggw7rxOLokjMcfSQGiRSWP9HQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ltu5+InwwFlPah6OBSHMC/qBbSjRz6ZuE/CWBZSDAnFq7hsKd60ORXTUKXQyrkjxq
	 NXr8KpcAneUW7h025nJblN/3mee5tBPPArkdS/MExuovhvA9o+JnaO+7l1TeRTUgKC
	 2KSYxKcrijSBoX6CeGdrZNds84ItYaA/qe6U7iDM=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2126YcD7055829
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 2 Feb 2022 00:34:38 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 2
 Feb 2022 00:34:38 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 2 Feb 2022 00:34:38 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2126Ycm6119872;
	Wed, 2 Feb 2022 00:34:38 -0600
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
CC: Denys Dmytriyenko <denis@denix.org>, Yogesh Siraswar <yogeshs@ti.com>,
        Ryan Eatmon <reatmon@ti.com>
Subject: [dunfell/master PATCH 2/2] Revert "ti-sci-fw: Fix for k3-image-gen issue for combined boot images"
Date: Wed, 2 Feb 2022 00:34:37 -0600
Message-ID: <20220202063437.8036-3-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220202063437.8036-1-praneeth@ti.com>
References: <20220202063437.8036-1-praneeth@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

This reverts commit d29025f7e868bea6299b55caf78e684fc647be33.

* associated fix in k3-image-gen is picked up now.
  commit 892c86501ff7 ("Makefile: Skip signing of binaries for HS combined boot")

hence its no longer needed to carry the same fix from meta-ti here.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-bsp/ti-linux-fw/ti-linux-fw.inc       |  2 +-
 ...gning-of-binaries-for-combined-boot-.patch | 64 -------------------
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb        |  5 --
 3 files changed, 1 insertion(+), 70 deletions(-)
 delete mode 100644 recipes-bsp/ti-sci-fw/files/0001-Makefile-Skip-signing-of-binaries-for-combined-boot-.patch

diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index d3819ab9..12ca7873 100644
--- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -23,7 +23,7 @@ SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
 
-K3_IMAGE_GEN_SRCREV ?= "9abbe130d47a7fa6f8e02b740ad3ad27bc81d327"
+K3_IMAGE_GEN_SRCREV ?= "892c86501ff745dfde4d535923ce686f45700da3"
 SRCREV_imggen = "${K3_IMAGE_GEN_SRCREV}"
 SRCREV_FORMAT = "imggen"
 
diff --git a/recipes-bsp/ti-sci-fw/files/0001-Makefile-Skip-signing-of-binaries-for-combined-boot-.patch b/recipes-bsp/ti-sci-fw/files/0001-Makefile-Skip-signing-of-binaries-for-combined-boot-.patch
deleted file mode 100644
index 196f3d3f..00000000
--- a/recipes-bsp/ti-sci-fw/files/0001-Makefile-Skip-signing-of-binaries-for-combined-boot-.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 2efc79702a47f9cbbeecbb2f604577f1ec8c95ba Mon Sep 17 00:00:00 2001
-From: Yogesh Siraswar <yogeshs@ti.com>
-Date: Wed, 8 Dec 2021 17:50:19 -0600
-Subject: [KIG PATCH] Makefile: Skip signing of binaries for combined boot hs
- images
-
-Combined sysfw binaries used in tiboot.bin do not require signed images.
-This fixes issues with AM64x HS and J7200 HS boot images
-
-Upstream-Status: Submitted
-Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
----
- Makefile           | 8 +++++++-
- soc/am64x/Makefile | 1 +
- soc/j7200/Makefile | 1 +
- 3 files changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 47b3b20..ab465df 100644
---- a/Makefile
-+++ b/Makefile
-@@ -215,8 +215,14 @@ $(soc_objroot)/%.o: %.c
- 	$(CROSS_COMPILE)gcc $(CFLAGS) -c -o $@-pre-validated $<
- 	python3 ./scripts/sysfw_boardcfg_validator.py -b $@-pre-validated -i -o $@ -s $(SOC) -l $@.log
- 
--# On HS board configuration binaries must be signed
-+# On HS board configuration binaries must be signed unless it is combined boot image
- ifdef HS
-+ifndef COMBINED_BOOT_IMAGE
-+SIGN_BINARY=1
-+endif
-+endif
-+
-+ifdef SIGN_BINARY
- %.bin.unsigned: %.o
- 	$(CROSS_COMPILE)objcopy -S -O binary $< $@
- %.bin: %.bin.unsigned
-diff --git a/soc/am64x/Makefile b/soc/am64x/Makefile
-index bfbe3e5..33ebbd0 100644
---- a/soc/am64x/Makefile
-+++ b/soc/am64x/Makefile
-@@ -31,6 +31,7 @@
- #
- 
- SBL_LOADADDDR ?= 0x70000000
-+COMBINED_BOOT_IMAGE = 1
- COMBINED_SYSFW_BRDCFG_LOADADDR ?= 0x7b000
- LOADADDR  ?= 0x44000
- SCIFS = sci
-diff --git a/soc/j7200/Makefile b/soc/j7200/Makefile
-index 3b754f7..0baef51 100644
---- a/soc/j7200/Makefile
-+++ b/soc/j7200/Makefile
-@@ -31,6 +31,7 @@
- #
- 
- SBL_LOADADDDR ?= 0x41c00000
-+COMBINED_BOOT_IMAGE = 1
- COMBINED_TIFS_BRDCFG_LOADADDR ?= 0x7f000
- COMBINED_DM_BRDCFG_LOADADDR ?= 0x41c80000
- LOADADDR ?= 0x40000
--- 
-2.17.1
-
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index d70d664c..646833a7 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -49,11 +49,6 @@ LD[unexport] = "1"
 
 do_configure[noexec] = "1"
 
-SRC_URI_append_j7200-hs-evm-k3r5 = "\ 
-	file://0001-Makefile-Skip-signing-of-binaries-for-combined-boot-.patch;patchdir=../imggen"
-SRC_URI_append_am64xx-hs-evm-k3r5 = "\
-	file://0001-Makefile-Skip-signing-of-binaries-for-combined-boot-.patch;patchdir=../imggen"
-
 EXTRA_OEMAKE = "\
     CROSS_COMPILE=${TARGET_PREFIX} SYSFW_DL_URL='' SYSFW_HS_DL_URL='' SYSFW_HS_INNER_CERT_DL_URL='' \
     SYSFW_PATH="${SYSFW_TISCI}" SOC=${SYSFW_SOC} CONFIG=${SYSFW_CONFIG} \
-- 
2.17.1

