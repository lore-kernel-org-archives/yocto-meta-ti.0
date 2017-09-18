Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D1138E00C82; Mon, 18 Sep 2017 11:03:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7EF7DE008D2
	for <meta-ti@yoctoproject.org>; Mon, 18 Sep 2017 11:03:23 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8II3CKx008221
	for <meta-ti@yoctoproject.org>; Mon, 18 Sep 2017 13:03:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505757793;
	bh=jckFW3BWUp6LROEj8OAI2jB81o22BtTK+uVP9p2Y3mw=;
	h=From:To:CC:Subject:Date;
	b=apF+03z5ckdU3Y7xwDiZZwJNmh1yOqSUftsYzQxykF1Oinl7Ir/PS4iJCDeDPc7wb
	7p4gPNMY8tYKZoKKa/DEIgu/p1HH0hK3JgU4pdUVuV91eQxLDKXavRiWhSEfQpgfhO
	ONkpq/QpHu2KcHg+hxtSJSDspFEeacqsB5K4cxRA=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8II37V6030941
	for <meta-ti@yoctoproject.org>; Mon, 18 Sep 2017 13:03:07 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 18 Sep 2017 13:03:07 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 18 Sep 2017 13:03:07 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8II37jM016556;
	Mon, 18 Sep 2017 13:03:07 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 18 Sep 2017 14:03:04 -0400
Message-ID: <1505757784-17240-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/master][PATCH] uio-module-drv: Update to version 02.02.01.00
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
X-List-Received-Date: Mon, 18 Sep 2017 18:03:24 -0000
Content-Type: text/plain

Also revert uio-module-drv-test PR to r0

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb | 2 +-
 recipes-bsp/uio-module-drv/uio-module-drv.inc         | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb b/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
index 2e3bb91..ccd8f2c 100644
--- a/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
+++ b/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Test code for user space IO (UIO) driver"
 
 include uio-module-drv.inc
 
-PR = "r3"
+PR = "r0"
 
 COMPATIBLE_MACHINE = "keystone|omap-a15|ti33x|ti43x"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/recipes-bsp/uio-module-drv/uio-module-drv.inc b/recipes-bsp/uio-module-drv/uio-module-drv.inc
index 6d55db2..99d908e 100644
--- a/recipes-bsp/uio-module-drv/uio-module-drv.inc
+++ b/recipes-bsp/uio-module-drv/uio-module-drv.inc
@@ -2,10 +2,10 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2b7c96eb2aed7b0f6f922214dbde9016"
 
 BRANCH = "master"
-# This corresponds to version 02.02.00.00
-UIO_MODULE_DRV_SRCREV = "59cd07395d7f26cbd01969d130d7b8bd5ccb12c5"
+# This corresponds to version 02.02.01.00
+UIO_MODULE_DRV_SRCREV = "bda9260f2220840a60ec0fbc8011cbadf3cf1b91"
 
-PV = "2.2.0.0+git${SRCPV}"
+PV = "2.2.1.0+git${SRCPV}"
 
 UIO_MODULE_DRV_GIT_URI = "git://git.ti.com/keystone-linux/uio-module-drv.git"
 UIO_MODULE_DRV_GIT_PROTOCOL = "git"
-- 
1.9.1


