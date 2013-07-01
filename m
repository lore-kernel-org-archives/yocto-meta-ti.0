Return-Path: <heroor@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7046FE01569
	for <meta-ti@yoctoproject.org>; Mon,  1 Jul 2013 01:21:42 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r618Lf7T004480
	for <meta-ti@yoctoproject.org>; Mon, 1 Jul 2013 03:21:41 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r618Lf5N009989
	for <meta-ti@yoctoproject.org>; Mon, 1 Jul 2013 03:21:41 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 1 Jul 2013 03:21:41 -0500
Received: from ti.com (swubn01.india.ti.com [172.24.162.214])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with SMTP id r618LdK4026234;
	Mon, 1 Jul 2013 03:21:40 -0500
Date: Mon, 1 Jul 2013 13:51:39 +0530
From: Siddharth Heroor <heroor@ti.com>
To: <meta-ti@yoctoproject.org>
Message-ID: <20130701082139.GA3378@ti.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCH] recipes-kernel: Update to latest fixes on the glsdk staging tree
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
X-List-Received-Date: Mon, 01 Jul 2013 08:21:44 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Fixes for USB, SATA and enables GPU (omapdrm).
* Fix OMAP5 LDO1 value.

Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 recipes-kernel/linux/linux-ti-glsdk_3.8.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
index 2746188..bfcaf3a 100644
--- a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
+++ b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
@@ -20,7 +20,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "master"
 
-SRCREV = "4e8193eb3b7465d7f67cd8c7e6c2ed99dad1a483"
+SRCREV = "6076e6882d1d6a64b104e42e56a3eada36605cb3"
 PV = "3.8.13"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
1.7.0.4


