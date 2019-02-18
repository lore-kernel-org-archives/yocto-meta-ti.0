Return-Path: <g-tammana@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B5C68E009EB; Mon, 18 Feb 2019 15:11:10 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 817A2E008CA
	for <meta-ti@yoctoproject.org>; Mon, 18 Feb 2019 15:11:09 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x1INB88M083734
	for <meta-ti@yoctoproject.org>; Mon, 18 Feb 2019 17:11:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1550531468;
	bh=5XirbXc/HNMlAvl6PkoQ49T4pjooDfG/Zw7dGf5Mkts=;
	h=From:To:CC:Subject:Date;
	b=Q/N+EKDU1eoZOWrXMgBMxbri6GG1clEk8sIzgefNP7S/38Vf7X4jIlTpx4k1DvH0p
	LesC/sUSmzV6oCYbKrHIoHjKJ3ThJWb0Z2PzwOjwgFGm4SaCLX6jHxujnIJetfFuNF
	r5rKgaSjft2TcGgVi3fUh4TtKG3QfEvn/ZLvPg+M=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x1INB8xW087435
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 18 Feb 2019 17:11:08 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 18 Feb 2019 17:11:08 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 18 Feb 2019 17:11:08 -0600
Received: from legion.dal.desgin.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x1INB8LE008844;
	Mon, 18 Feb 2019 17:11:08 -0600
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.77.97])
	by legion.dal.desgin.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x1INB7U04439; Mon, 18 Feb 2019 17:11:07 -0600 (CST)
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-ti@yoctoproject.org>, Denys Dmytriyenko <denys@ti.com>
Date: Mon, 18 Feb 2019 17:12:30 -0600
Message-ID: <20190218231230.14092-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][PATCH] ti-gc320-driver: move to k4.19
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
X-List-Received-Date: Mon, 18 Feb 2019 23:11:10 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

  - Updated the recipe to pick sources for k4.19
  - Removed the gcc8 workaround patch as the new srcrev include those fixes

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 ...-bypass-gcc8-stringop-overflow-error.patch | 26 -------------------
 .../ti-gc320-driver_5.0.11.p7.bb              |  7 +++--
 2 files changed, 3 insertions(+), 30 deletions(-)
 delete mode 100644 recipes-bsp/gc320-drivers/ti-gc320-driver/0001-Kbuild-bypass-gcc8-stringop-overflow-error.patch

diff --git a/recipes-bsp/gc320-drivers/ti-gc320-driver/0001-Kbuild-bypass-gcc8-stringop-overflow-error.patch b/recipes-bsp/gc320-drivers/ti-gc320-driver/0001-Kbuild-bypass-gcc8-stringop-overflow-error.patch
deleted file mode 100644
index 431afa76..00000000
--- a/recipes-bsp/gc320-drivers/ti-gc320-driver/0001-Kbuild-bypass-gcc8-stringop-overflow-error.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From c93a4217425ffebae1fb2d5c6c7fc957eb8aa18c Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Tue, 16 Oct 2018 21:16:48 -0400
-Subject: [PATCH] Kbuild: bypass gcc8 stringop-overflow error
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- src/Kbuild | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/Kbuild b/src/Kbuild
-index 574a107..df4368d 100755
---- a/src/Kbuild
-+++ b/src/Kbuild
-@@ -87,7 +87,7 @@ MODULE_NAME ?= galcore
- CUSTOMER_ALLOCATOR_OBJS    ?=
- ALLOCATOR_ARRAY_H_LOCATION ?= $(OS_KERNEL_DIR)/allocator/default/
- 
--EXTRA_CFLAGS += -Werror
-+EXTRA_CFLAGS += -Werror -Wno-stringop-overflow
- 
- OBJS := $(OS_KERNEL_DIR)/gc_hal_kernel_device.o \
-         $(OS_KERNEL_DIR)/gc_hal_kernel_linux.o \
--- 
-2.7.4
-
diff --git a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
index 1a6bc5da..551a3512 100644
--- a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
+++ b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
@@ -9,12 +9,11 @@ MACHINE_KERNEL_PR_append = "e"
 PR = "${MACHINE_KERNEL_PR}"
 
 # Need to branch out with ${PV} var
-BRANCH = "ti-${PV}-k4.14"
+BRANCH = "ti-${PV}-k4.19"
 
-SRCREV = "a36799d9329efcfff19e30e690156d5ebf7e0c55"
+SRCREV = "9b59e596b4adefabbb686ce8845edef8114558fd"
 
-SRC_URI = "git://git.ti.com/graphics/ti-gc320-driver.git;protocol=git;branch=${BRANCH} \
-	file://0001-Kbuild-bypass-gcc8-stringop-overflow-error.patch;striplevel=2"
+SRC_URI = "git://git.ti.com/graphics/ti-gc320-driver.git;protocol=git;branch=${BRANCH}
 
 S = "${WORKDIR}/git/src"
 
-- 
2.20.1


