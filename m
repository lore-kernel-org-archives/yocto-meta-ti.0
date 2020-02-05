Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.345.1580926602580225476
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Feb 2020 10:16:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=EbnJqZEr;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: sam.nelson@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 015IGfIq091909
	for <meta-ti@lists.yoctoproject.org>; Wed, 5 Feb 2020 12:16:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580926601;
	bh=5j3bX9aZv2heaV8TJMd/fyPTwFcP/MikOt6AWztaiJI=;
	h=From:To:CC:Subject:Date;
	b=EbnJqZErjcTIohb7nDRq/XG26TIdv2ZR6nMre8xP/jGIeiOOEfh0xWbMoKUdyeEuN
	 0cYYf2ohwPsSF/mRGfzuaeMFUXcRgtIY39KGHHgRgXduExe3eqspKa/kSI182rr2oW
	 xuefLqlRP9bPjvkXGHnuzb5dia/Bmq29xX5JPuFs=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 015IGfog071234
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 5 Feb 2020 12:16:41 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 5 Feb
 2020 12:16:41 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 5 Feb 2020 12:16:41 -0600
Received: from uda0862859a.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 015IGfvL062595;
	Wed, 5 Feb 2020 12:16:41 -0600
From: "Sam Nelson" <sam.nelson@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Sam Nelson <sam.nelson@ti.com>
Subject: [meta-ti][thud/master][PATCH] ti-ipc: Update to new version 3.51.00.00
Date: Wed, 5 Feb 2020 13:16:39 -0500
Message-ID: <1580926599-7860-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/ipc/ti-ipc-common.inc | 2 +-
 recipes-ti/ipc/ti-ipc-rtos.inc   | 8 ++++----
 recipes-ti/ipc/ti-ipc.inc        | 6 +++---
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-common.inc b/recipes-ti/ipc/ti-ipc-common.inc
index 86a0fd0..96cbd66 100644
--- a/recipes-ti/ipc/ti-ipc-common.inc
+++ b/recipes-ti/ipc/ti-ipc-common.inc
@@ -1,4 +1,4 @@
-PV = "3.50.04.08"
+PV = "3.51.00.00"
 INC_PR = "r0"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
index 4d0d449..c4ab268 100644
--- a/recipes-ti/ipc/ti-ipc-rtos.inc
+++ b/recipes-ti/ipc/ti-ipc-rtos.inc
@@ -24,9 +24,9 @@ protocol=${TI_IPC_METADATA_GIT_PROTOCOL};\
 branch=${TI_IPC_METADATA_GIT_BRANCH};\
 name=${TI_IPC_METADATA_NAME}"
 
-# Corresponds to tag: 3.50.04.08
-TI_IPC_METADATA_SRCREV = "48788ea79190c4995df4c802e8aa4e17f332943d"
-# Corresponds to tag: 3.50.04.08
+# Corresponds to tag: 3.51.00.00
+TI_IPC_METADATA_SRCREV = "1bf668fd6b0ec2ef6956fa55b8484d0b21a9f9e2"
+# Corresponds to tag: 3.51.00.00
 TI_IPC_EXAMPLES_SRCREV = "4707fcbbe0d136e781c4a7ffdc072be407c34358"
 
 SRCREV_FORMAT = "default"
@@ -39,7 +39,7 @@ S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
 RELEASE_TYPE = "GA"
 RELEASE_SUFFIX = ""
 
-PR = "${INC_PR}.r2"
+PR = "${INC_PR}.r0"
 
 DEPENDS_append_keystone = " ti-cgt6x-native \
                             gcc-arm-none-eabi-native \
diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
index d1eaad2..1206e33 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9
 
 TI_IPC_GIT_URI = "git://git.ti.com/ipc/ipcdev.git"
 TI_IPC_GIT_PROTOCOL = "git"
-TI_IPC_GIT_BRANCH = "3.50"
+TI_IPC_GIT_BRANCH = "master"
 
-#Corresponds to 3.50.04.08
-TI_IPC_SRCREV = "1d53b856338b86d1979fe09345c0b382913a848a"
+#Corresponds to 3.51.00.00
+TI_IPC_SRCREV = "36b2fe589de8d2d79db7c076c2ca3b0a7488fc15"
 
 BRANCH = "${TI_IPC_GIT_BRANCH}"
 SRC_URI = "${TI_IPC_GIT_URI};protocol=${TI_IPC_GIT_PROTOCOL};branch=${BRANCH};name=ipcdev"
-- 
1.9.1

