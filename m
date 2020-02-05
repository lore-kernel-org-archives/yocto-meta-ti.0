Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.33.1580926975238714387
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Feb 2020 10:22:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=KpiA0sNO;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: sam.nelson@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9CAD8E016CA; Wed,  5 Feb 2020 10:22:54 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3290EE007AE
	for <meta-ti@yoctoproject.org>; Wed,  5 Feb 2020 10:22:51 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 015IMpsg026987
	for <meta-ti@yoctoproject.org>; Wed, 5 Feb 2020 12:22:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580926971;
	bh=5j3bX9aZv2heaV8TJMd/fyPTwFcP/MikOt6AWztaiJI=;
	h=From:To:CC:Subject:Date;
	b=KpiA0sNOCwNioe7IymVfmpJXb13PxTYwqe5FqVTKp2caApvkpFd+JX6AAxZk/YPBC
	 h4ia7C+CGHDdz3wJR/uvJ4SvL6Ruu7prIA9wIFq1JOJgm3KiHs14A5/UKbqH9Ef9t4
	 16FI7Mqo7r/WNo451ZD0rbhIs38YZYIzduDdnkZc=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 015IMpJq041017
	for <meta-ti@yoctoproject.org>; Wed, 5 Feb 2020 12:22:51 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 5 Feb
 2020 12:22:50 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 5 Feb 2020 12:22:51 -0600
Received: from uda0862859a.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 015IMoBD109102;
	Wed, 5 Feb 2020 12:22:50 -0600
From: "Sam Nelson" <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Sam Nelson <sam.nelson@ti.com>
Subject: [meta-ti][thud/master][PATCH] ti-ipc: Update to new version 3.51.00.00
Date: Wed, 5 Feb 2020 13:22:47 -0500
Message-ID: <1580926967-7906-1-git-send-email-sam.nelson@ti.com>
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

