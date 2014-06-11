Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 08B71E00BC2; Wed, 11 Jun 2014 06:54:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CB154E00B74
	for <meta-ti@yoctoproject.org>; Wed, 11 Jun 2014 06:54:14 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5BDsDVL004544
	for <meta-ti@yoctoproject.org>; Wed, 11 Jun 2014 08:54:13 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5BDsCti006588
	for <meta-ti@yoctoproject.org>; Wed, 11 Jun 2014 08:54:13 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 11 Jun 2014 08:54:12 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5BDs9I4030034;
	Wed, 11 Jun 2014 08:54:11 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 11 Jun 2014 08:54:07 -0500
Message-ID: <1402494847-29713-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [for dora & master][PATCH] u-boot-ti-staging:_2013.10: Update to pull in critical fixes
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
X-List-Received-Date: Wed, 11 Jun 2014 13:54:18 -0000
Content-Type: text/plain

* Critical fixes have been added to the ti-u-boot-2013.10 branch for AM4x.
* Update commit id to point to this new commit.
* For all other platforms nothing should have changed.
---
 recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb
index b8f5ce6..d954db4 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb
@@ -5,14 +5,14 @@ DESCRIPTION = "u-boot bootloader for TI devices"
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
 
 PV = "2013.10"
-PR = "r7+gitr${SRCPV}"
+PR = "r8+gitr${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
 
 BRANCH ?= "ti-u-boot-2013.10"
 
-# Corresponds to tag ti2013.12.01
-SRCREV = "78d8ebd4a0214b72a125f5b98c5ed2f9a3e5e783"
+# Corresponds to tag ti2013.12.01_amsdk-07.01
+SRCREV = "259ff9a577cc66cb40e3cdff3e41628e466f0fef"
 
 SPL_BINARY = "MLO"
 SPL_UART_BINARY = "u-boot-spl.bin"
-- 
1.7.0.4


