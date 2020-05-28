Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.7499.1590650664767981877
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 28 May 2020 00:24:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=uImsKuj1;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: x0038811@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9F585E01BED; Thu, 28 May 2020 00:24:24 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E2676E01BEA
	for <meta-ti@yoctoproject.org>; Thu, 28 May 2020 00:24:23 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04S7OMF3026595
	for <meta-ti@yoctoproject.org>; Thu, 28 May 2020 02:24:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1590650662;
	bh=w2rv7g9mFg9cj9874GjbEGWqTFWl+SOlQS0UGhl43EE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=uImsKuj1LWtZWZ5orR1YZehtxInLk/NsM2X5P2GWNB0t8/ecIjiU9G3XXBCksNOp/
	 5V8KQxBU/OsDd+fmgZ4rSQl0uXMxRlZJVODgmFxDf46fyeBm7cvcyqqTExnLSmK7gy
	 fFN8nn2iP4jnShMWsSiu14wVf+1FyoImZqkT4yAw=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04S7OMiN113040
	for <meta-ti@yoctoproject.org>; Thu, 28 May 2020 02:24:22 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 28
 May 2020 02:24:22 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 28 May 2020 02:24:22 -0500
Received: from udx0038811.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04S7OJK0018399;
	Thu, 28 May 2020 02:24:21 -0500
From: "Ramprasad.N" <x0038811@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Ramprasad N <x0038811@ti.com>
Subject: [dunfell 1/1] ipumm: Hack: Temporary work-around for linker error with XDC tools upgradation.
Date: Thu, 28 May 2020 12:54:16 +0530
Message-ID: <1590650656-18953-2-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1590650656-18953-1-git-send-email-x0038811@ti.com>
References: <1590650656-18953-1-git-send-email-x0038811@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

IPUMM build is showing linker error for a function
ti_sdo_ce_utils_syscbuf_SysCBuf_Module_startup__E with latest xdc tool.

A dummy version of this function is added in ipumm as a temporary solution.

Signed-off-by: Ramprasad N <x0038811@ti.com>
---
 ...01-HACK-ipumm-Workaround-for-linker-error.patch | 48 ++++++++++++++++++++++
 recipes-bsp/ipumm-fw/ipumm-fw_git.bb               |  6 ++-
 2 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 recipes-bsp/ipumm-fw/files/0001-HACK-ipumm-Workaround-for-linker-error.patch

diff --git a/recipes-bsp/ipumm-fw/files/0001-HACK-ipumm-Workaround-for-linker-error.patch b/recipes-bsp/ipumm-fw/files/0001-HACK-ipumm-Workaround-for-linker-error.patch
new file mode 100644
index 0000000..0bea358
--- /dev/null
+++ b/recipes-bsp/ipumm-fw/files/0001-HACK-ipumm-Workaround-for-linker-error.patch
@@ -0,0 +1,48 @@
+From 7226700841c62e6a42690eaa8b3e31b2c329b341 Mon Sep 17 00:00:00 2001
+From: Ramprasad N <x0038811@ti.com>
+Date: Thu, 28 May 2020 09:53:59 +0530
+Subject: [PATCH] HACK: ipumm: Workaround for linker error
+
+* HACK: ti_sdo_ce_utils_syscbuf_SysCBuf_Module_startup__E is no longer
+* defined with latest XDC tools. To temporarily get around the issue
+* until the real fix can be made, dummy defination of the missing function
+* is added in ipu_main.c
+
+*IPUMM dependent tool chain components are upgraded to latest version
+* BIOS : 6_82_01_17_eng
+* XDC  : 3_61_00_16_core
+* This issue is seen only with xdc tools upgrade.
+
+Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
+Signed-off-by: Ramprasad N <x0038811@ti.com>
+---
+ platform/ti/dce/baselib/ipumm_main.c | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+diff --git a/platform/ti/dce/baselib/ipumm_main.c b/platform/ti/dce/baselib/ipumm_main.c
+index 76ccd34..f4ca6e5 100644
+--- a/platform/ti/dce/baselib/ipumm_main.c
++++ b/platform/ti/dce/baselib/ipumm_main.c
+@@ -50,6 +50,19 @@
+ #include <string.h>
+ #include <stdlib.h>
+ 
++/*
++ * HACK: ti_sdo_ce_utils_syscbuf_SysCBuf_Module_startup__E is no longer
++ * defined with latest XDC tools. To temporarily get around the issue
++ * until the real fix can be made, define the missing function
++ * here.
++ */
++extern ti_sdo_ce_utils_syscbuf_SysCBuf_Module_startup__F(xdc_Int state);
++
++/* Module_startup */
++xdc_Int ti_sdo_ce_utils_syscbuf_SysCBuf_Module_startup__E( xdc_Int state )
++{
++    return ti_sdo_ce_utils_syscbuf_SysCBuf_Module_startup__F(state);
++}
+ 
+ /* Legacy function to allow Linux side rpmsg sample tests to work: */
+ extern void start_ping_tasks();
+-- 
+1.9.1
+
diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
index 4f6ae89..e53d0a9 100644
--- a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
+++ b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
@@ -15,10 +15,14 @@ SRC_URI = "git://git.ti.com/ivimm/ipumm.git;protocol=git"
 
 SRCREV = "df4c50aecc9aad7ab3eb1ca9ebacfe473fcad7c5"
 
+SRC_URI += " \
+	           file://0001-HACK-ipumm-Workaround-for-linker-error.patch \
+	     "
+
 S = "${WORKDIR}/git"
 
 PV = "3.00.15.00"
-PR = "r5"
+PR = "r6"
 
 require recipes-ti/includes/ti-paths.inc
 
-- 
1.9.1

