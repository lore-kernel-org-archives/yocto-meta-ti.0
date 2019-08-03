Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D1349E00AE6; Fri,  2 Aug 2019 18:17:44 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 11807E00AB6
	for <meta-ti@yoctoproject.org>; Fri,  2 Aug 2019 18:17:36 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x731HZr1022690
	for <meta-ti@yoctoproject.org>; Fri, 2 Aug 2019 20:17:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1564795055;
	bh=tka0xtytBV1Hs8WhzchC7tCGjg5rGc/gzPE7JUO1JJM=;
	h=From:To:CC:Subject:Date;
	b=SLAqNgGDhnhw3lh5KXJoHOnzALlG0zZJ5DlCtCoxbCdYoJt6jqsRoYebfZsKu7Djn
	2hgP+YgzJwewl/HkmVIqMOox7ZFdLnOyNwRSX0gbXpRqPTFIx7cirnHY9ETLpiKu5o
	X8QVy7VJFmt4deiT4mbjCnLa0j1Z0PAB64SDGGwY=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x731HZcW081270
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 2 Aug 2019 20:17:35 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 2 Aug 2019 20:17:35 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 2 Aug 2019 20:17:35 -0500
Received: from uda0862859a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x731HYuT051078;
	Fri, 2 Aug 2019 20:17:35 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>, <s-anna@ti.com>
Date: Fri, 2 Aug 2019 21:17:29 -0400
Message-ID: <1564795049-19168-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] ti-ipc: Update to new version 3.50.04.06
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sat, 03 Aug 2019 01:17:44 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/ipc/ti-ipc-common.inc | 2 +-
 recipes-ti/ipc/ti-ipc-rtos.inc   | 8 ++++----
 recipes-ti/ipc/ti-ipc.inc        | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-common.inc b/recipes-ti/ipc/ti-ipc-common.inc
index 036e46d..4ec72cc 100644
--- a/recipes-ti/ipc/ti-ipc-common.inc
+++ b/recipes-ti/ipc/ti-ipc-common.inc
@@ -1,4 +1,4 @@
-PV = "3.50.03.05"
+PV = "3.50.04.06"
 INC_PR = "r0"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
index dcd6309..460befe 100644
--- a/recipes-ti/ipc/ti-ipc-rtos.inc
+++ b/recipes-ti/ipc/ti-ipc-rtos.inc
@@ -24,10 +24,10 @@ protocol=${TI_IPC_METADATA_GIT_PROTOCOL};\
 branch=${TI_IPC_METADATA_GIT_BRANCH};\
 name=${TI_IPC_METADATA_NAME}"
 
-# Corresponds to tag: 3.50.03.05
-TI_IPC_METADATA_SRCREV = "3936c41d021c6d56c25f4bb07b647314a6589a57"
-# Corresponds to tag: 3.50.03.05
-TI_IPC_EXAMPLES_SRCREV = "55a8341c60a91c0ba2d79b7e4b805e2e39b3060f"
+# Corresponds to tag: 3.50.04.06
+TI_IPC_METADATA_SRCREV = "15d256ea3c3a35fe065a0513f09f4ea6ece58725"
+# Corresponds to tag: 3.50.04.06
+TI_IPC_EXAMPLES_SRCREV = "f29c27652302892abbe78ce2c22a2aae28b28d69"
 
 SRCREV_FORMAT = "default"
 SRCREV_ipc-metadata = "${TI_IPC_METADATA_SRCREV}"
diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
index 482fdcc..b9f9ca9 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -8,8 +8,8 @@ TI_IPC_GIT_URI = "git://git.ti.com/ipc/ipcdev.git"
 TI_IPC_GIT_PROTOCOL = "git"
 TI_IPC_GIT_BRANCH = "3.50"
 
-#Corresponds to 3.50.03.05
-TI_IPC_SRCREV = "7007b8adff409fd8c90757c9adafd264a3ff15e3"
+#Corresponds to 3.50.04.06
+TI_IPC_SRCREV = "ca7ce99b8ec82331559f0fd99a174bdcca1da9ac"
 
 BRANCH = "${TI_IPC_GIT_BRANCH}"
 SRC_URI = "${TI_IPC_GIT_URI};protocol=${TI_IPC_GIT_PROTOCOL};branch=${BRANCH};name=ipcdev"
-- 
1.9.1


