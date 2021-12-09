Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.10661.1639052284466463811
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 04:18:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=uTucvS7M;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: yogeshs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1B9CI2Ld084846;
	Thu, 9 Dec 2021 06:18:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1639052282;
	bh=Rhf6OuxZfiX7QYDtt0FPSnPT/NUxnb3Ww/QStl8WcQM=;
	h=From:To:Subject:Date;
	b=uTucvS7MNMKQxhHyGXoc6QntRuUWXf0es07E0WVHdXqhVPdYNrA69xF7TB3/e9nJA
	 +CqC4AfBj8d0NEibB89zL2X2OqUn3RVzAqCBnLdICwYRcoqPO3dA9oyDpjvqmdEPe1
	 iJu9bToLXbcXVJqirXWHDHlQAeb0EFmEe27Knapc=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1B9CI2oA079552
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Dec 2021 06:18:02 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 9
 Dec 2021 06:18:02 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 9 Dec 2021 06:18:02 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1B9CI2vf075189;
	Thu, 9 Dec 2021 06:18:02 -0600
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH] ti-sci-fw: Fix for KIG issue for combined boot images
Date: Thu, 9 Dec 2021 12:18:02 +0000
Message-ID: <20211209121802.2379-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

This is temporary fix for combined boot images for KIG in meta-ti till
the patch is integrated.

Upstream-Status: Submitted
Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 ...gning-of-binaries-for-combined-boot-.patch | 63 +++++++++++++++++++
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb        |  5 ++
 2 files changed, 68 insertions(+)
 create mode 100644 recipes-bsp/ti-sci-fw/files/0001-Makefile-Skip-signing-of-binaries-for-combined-boot-.patch

diff --git a/recipes-bsp/ti-sci-fw/files/0001-Makefile-Skip-signing-of-binaries-for-combined-boot-.patch b/recipes-bsp/ti-sci-fw/files/0001-Makefile-Skip-signing-of-binaries-for-combined-boot-.patch
new file mode 100644
index 00000000..93b0c325
--- /dev/null
+++ b/recipes-bsp/ti-sci-fw/files/0001-Makefile-Skip-signing-of-binaries-for-combined-boot-.patch
@@ -0,0 +1,63 @@
+From 2efc79702a47f9cbbeecbb2f604577f1ec8c95ba Mon Sep 17 00:00:00 2001
+From: Yogesh Siraswar <yogeshs@ti.com>
+Date: Wed, 8 Dec 2021 17:50:19 -0600
+Subject: [KIG PATCH] Makefile: Skip signing of binaries for combined boot hs
+ images
+
+Combined sysfw binaries used in tiboot.bin do not require signed images.
+This fixes issues with AM64x HS and J7200 HS boot images
+
+Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
+---
+ Makefile           | 8 +++++++-
+ soc/am64x/Makefile | 1 +
+ soc/j7200/Makefile | 1 +
+ 3 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 47b3b20..ab465df 100644
+--- a/Makefile
++++ b/Makefile
+@@ -215,8 +215,14 @@ $(soc_objroot)/%.o: %.c
+ 	$(CROSS_COMPILE)gcc $(CFLAGS) -c -o $@-pre-validated $<
+ 	python3 ./scripts/sysfw_boardcfg_validator.py -b $@-pre-validated -i -o $@ -s $(SOC) -l $@.log
+ 
+-# On HS board configuration binaries must be signed
++# On HS board configuration binaries must be signed unless it is combined boot image
+ ifdef HS
++ifndef COMBINED_BOOT_IMAGE
++SIGN_BINARY=1
++endif
++endif
++
++ifdef SIGN_BINARY
+ %.bin.unsigned: %.o
+ 	$(CROSS_COMPILE)objcopy -S -O binary $< $@
+ %.bin: %.bin.unsigned
+diff --git a/soc/am64x/Makefile b/soc/am64x/Makefile
+index bfbe3e5..33ebbd0 100644
+--- a/soc/am64x/Makefile
++++ b/soc/am64x/Makefile
+@@ -31,6 +31,7 @@
+ #
+ 
+ SBL_LOADADDDR ?= 0x70000000
++COMBINED_BOOT_IMAGE = 1
+ COMBINED_SYSFW_BRDCFG_LOADADDR ?= 0x7b000
+ LOADADDR  ?= 0x44000
+ SCIFS = sci
+diff --git a/soc/j7200/Makefile b/soc/j7200/Makefile
+index 3b754f7..0baef51 100644
+--- a/soc/j7200/Makefile
++++ b/soc/j7200/Makefile
+@@ -31,6 +31,7 @@
+ #
+ 
+ SBL_LOADADDDR ?= 0x41c00000
++COMBINED_BOOT_IMAGE = 1
+ COMBINED_TIFS_BRDCFG_LOADADDR ?= 0x7f000
+ COMBINED_DM_BRDCFG_LOADADDR ?= 0x41c80000
+ LOADADDR ?= 0x40000
+-- 
+2.17.1
+
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 6d48bf23..13ae1f6b 100644
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

