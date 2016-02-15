Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 037A1E0071E; Mon, 15 Feb 2016 11:04:11 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B0379E00444
	for <meta-ti@yoctoproject.org>; Mon, 15 Feb 2016 11:04:07 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1FJ46fw019569
	for <meta-ti@yoctoproject.org>; Mon, 15 Feb 2016 13:04:06 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1FJ46TC028490
	for <meta-ti@yoctoproject.org>; Mon, 15 Feb 2016 13:04:06 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 15 Feb 2016 13:04:06 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u1FJ46KS003226;	Mon, 15 Feb 2016 13:04:06 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 15 Feb 2016 14:04:04 -0500
Message-ID: <1455563044-2879-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] omap5-sgx-ddk-um-linux: Specify COMPATIBLE_MACHINE list
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
X-List-Received-Date: Mon, 15 Feb 2016 19:04:11 -0000
Content-Type: text/plain

* This is only compatible with ti33x, ti43, and omap-a15 as a SRCREV
  is only supplied for these SOC families.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
index dfd22d0..0cdab96 100644
--- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
@@ -3,6 +3,7 @@ HOMEPAGE = "http://downloads.ti.com/dsps/dsps_public_sw/gfxsdk"
 LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://OMAP5-Linux-Graphics-DDK-UM-Manifest.doc;md5=360d293df455e4f2d363bb4014a49603"
 
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 BRANCH_omap-a15 = "master"
@@ -19,7 +20,7 @@ INITSCRIPT_PARAMS = "defaults 8"
 
 inherit update-rc.d
 
-PR = "r14"
+PR = "r15"
 PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2"
 
 RDEPENDS_${PN} += "libdrm"
-- 
1.9.1


