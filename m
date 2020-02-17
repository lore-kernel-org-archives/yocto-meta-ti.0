Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.72.1581976661952147687
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Feb 2020 13:57:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=jfz8vfdW;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: angelabaker@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4FA84E01733; Mon, 17 Feb 2020 13:57:41 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D8BAFE00C82
	for <meta-ti@yoctoproject.org>; Mon, 17 Feb 2020 13:57:38 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01HLvcoe039046
	for <meta-ti@yoctoproject.org>; Mon, 17 Feb 2020 15:57:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581976658;
	bh=6cHhLSi4WJEqO9x8Z/g61XFS1HzMMnCIOys07wqvT9Y=;
	h=From:To:CC:Subject:Date;
	b=jfz8vfdWr/9UrPcLfBmx9j3V3PI6MbyAFfDBaNrpSlXA+PmXpjSVpL2YU7o/3GyXh
	 xNbUzYmlcIK/y1i+37Ju3O5NL0y2jn6mmTEyiz442kNaBcLBRNhWGjwBvN3y64zrKf
	 g5ekgWAsy56NF2zAAar11xNRFG+YPzW6EAoEH5m0=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01HLvcQk074857
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 17 Feb 2020 15:57:38 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 17
 Feb 2020 15:57:37 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 17 Feb 2020 15:57:38 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01HLvb5J078800;
	Mon, 17 Feb 2020 15:57:37 -0600
Received: from uda0866189.dhcp.ti.com (uda0866189.dhcp.ti.com [128.247.77.48])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id 01HLvb312884;
	Mon, 17 Feb 2020 15:57:37 -0600 (CST)
From: "Angela Stegmaier" <angelabaker@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Angela Stegmaier <angelabaker@ti.com>
Subject: [meta-ti][zeus/master][PATCH] ipc-lld: Update examples build target
Date: Mon, 17 Feb 2020 15:57:21 -0600
Message-ID: <1581976641-18633-1-git-send-email-angelabaker@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Update the build target from examples to apps.

Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
---
 recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb | 8 +-------
 recipes-bsp/ipc-lld/ipc-lld.inc                  | 2 +-
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb b/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb
index fa3ea89..8defbac 100644
--- a/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb
+++ b/recipes-bsp/ipc-lld/ipc-lld-examples-rtos_git.bb
@@ -22,13 +22,7 @@ do_configure[noexec] = "1"
 do_compile() {
     cd ${S}
 
-    for board in ${TI_PDK_LIMIT_BOARDS}
-    do
-        for core in ${TI_PDK_LIMIT_CORES}
-        do
-            oe_runmake examples BOARD="$board" CORE="$core" DEST_ROOT=${REMOTE_FW_DIR}
-        done
-    done
+    oe_runmake apps LIMIT_BOARDS="${TI_PDK_LIMIT_BOARDS}" LIMIT_CORES="${TI_PDK_LIMIT_CORES}" DEST_ROOT=${REMOTE_FW_DIR}
 }
 
 do_install() {
diff --git a/recipes-bsp/ipc-lld/ipc-lld.inc b/recipes-bsp/ipc-lld/ipc-lld.inc
index 66bbf32..f271f31 100644
--- a/recipes-bsp/ipc-lld/ipc-lld.inc
+++ b/recipes-bsp/ipc-lld/ipc-lld.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7eae093f2b09fd39307f30028a068b91"
 COMPATIBLE_MACHINE = "k3"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PR = "r2"
+PR = "r3"
 
 # Build with make instead of XDC
 TI_PDK_XDCMAKE = "0"
-- 
1.9.1

