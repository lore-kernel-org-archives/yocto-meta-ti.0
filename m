Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.17177.1581456863775466348
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Feb 2020 13:34:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=mifuAazu;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: sam.nelson@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01BLYNiY075593
	for <meta-ti@lists.yoctoproject.org>; Tue, 11 Feb 2020 15:34:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581456863;
	bh=nVUhUWcOXg98JSLhtn5o3ssdtsdRQmY4/N2v59un/Mg=;
	h=From:To:CC:Subject:Date;
	b=mifuAazuUc1xOors2XlWmzsPe4cvjAX26mTwMOtkL04r2Hvc4ZAp7PoSTu2p9CPMZ
	 WANAXgjacgwqxJgwDT8b57Yz0DibR2U8UWlJ/8amUWp0Za9WN/Q2g4x+H6DLeUYbdg
	 qMB4bzEPoQWSdbtq3jdfpO3PPfVkWuhdqLf4PKs0=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01BLYNSn064637
	for <meta-ti@lists.yoctoproject.org>; Tue, 11 Feb 2020 15:34:23 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 11
 Feb 2020 15:34:22 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 11 Feb 2020 15:34:22 -0600
Received: from uda0862859a.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01BLYMxL047595;
	Tue, 11 Feb 2020 15:34:22 -0600
From: "Sam Nelson" <sam.nelson@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Sam Nelson <sam.nelson@ti.com>
Subject: [meta-ti][thud][PATCH] Revert "ti-ipc: Update to new version 3.51.00.00"
Date: Tue, 11 Feb 2020 16:34:19 -0500
Message-ID: <1581456859-19417-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

This reverts commit c18c41a7c3c7794a126942057642b5f8684bddf5.
---
 recipes-ti/ipc/ti-ipc-common.inc | 2 +-
 recipes-ti/ipc/ti-ipc-rtos.inc   | 8 ++++----
 recipes-ti/ipc/ti-ipc.inc        | 6 +++---
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-common.inc b/recipes-ti/ipc/ti-ipc-common.inc
index 96cbd66..86a0fd0 100644
--- a/recipes-ti/ipc/ti-ipc-common.inc
+++ b/recipes-ti/ipc/ti-ipc-common.inc
@@ -1,4 +1,4 @@
-PV = "3.51.00.00"
+PV = "3.50.04.08"
 INC_PR = "r0"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
index c4ab268..4d0d449 100644
--- a/recipes-ti/ipc/ti-ipc-rtos.inc
+++ b/recipes-ti/ipc/ti-ipc-rtos.inc
@@ -24,9 +24,9 @@ protocol=${TI_IPC_METADATA_GIT_PROTOCOL};\
 branch=${TI_IPC_METADATA_GIT_BRANCH};\
 name=${TI_IPC_METADATA_NAME}"
 
-# Corresponds to tag: 3.51.00.00
-TI_IPC_METADATA_SRCREV = "1bf668fd6b0ec2ef6956fa55b8484d0b21a9f9e2"
-# Corresponds to tag: 3.51.00.00
+# Corresponds to tag: 3.50.04.08
+TI_IPC_METADATA_SRCREV = "48788ea79190c4995df4c802e8aa4e17f332943d"
+# Corresponds to tag: 3.50.04.08
 TI_IPC_EXAMPLES_SRCREV = "4707fcbbe0d136e781c4a7ffdc072be407c34358"
 
 SRCREV_FORMAT = "default"
@@ -39,7 +39,7 @@ S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
 RELEASE_TYPE = "GA"
 RELEASE_SUFFIX = ""
 
-PR = "${INC_PR}.r0"
+PR = "${INC_PR}.r2"
 
 DEPENDS_append_keystone = " ti-cgt6x-native \
                             gcc-arm-none-eabi-native \
diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
index 1206e33..d1eaad2 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9
 
 TI_IPC_GIT_URI = "git://git.ti.com/ipc/ipcdev.git"
 TI_IPC_GIT_PROTOCOL = "git"
-TI_IPC_GIT_BRANCH = "master"
+TI_IPC_GIT_BRANCH = "3.50"
 
-#Corresponds to 3.51.00.00
-TI_IPC_SRCREV = "36b2fe589de8d2d79db7c076c2ca3b0a7488fc15"
+#Corresponds to 3.50.04.08
+TI_IPC_SRCREV = "1d53b856338b86d1979fe09345c0b382913a848a"
 
 BRANCH = "${TI_IPC_GIT_BRANCH}"
 SRC_URI = "${TI_IPC_GIT_URI};protocol=${TI_IPC_GIT_PROTOCOL};branch=${BRANCH};name=ipcdev"
-- 
1.9.1

