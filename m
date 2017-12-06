Return-Path: <e-ruei1@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DF0BDE00D5D; Wed,  6 Dec 2017 08:06:38 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C271CE00BEA
	for <meta-ti@yoctoproject.org>; Wed,  6 Dec 2017 08:06:37 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id vB6G6aK5015210
	for <meta-ti@yoctoproject.org>; Wed, 6 Dec 2017 10:06:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1512576396;
	bh=uajE7dh+ad3rT4VSB+G5Ic+STucnlxcwoxytDWPAHSw=;
	h=From:To:Subject:Date;
	b=KhVBM29Wx+w/aluu7Sudy1jjQZXkEoV4gSGmz5GLIZewANObhgDkWKRUHHkfaFglY
	dt5cB4AoQzRU42NZdj/bwEDiGjkMnClbfvkX+Owl3W61rjRWkbV8EW8xmFRVQ7oIcA
	g6myukDlufMGkxva/EQmncGix0k3nlkkcH5iLvU0=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vB6G6aie018515
	for <meta-ti@yoctoproject.org>; Wed, 6 Dec 2017 10:06:36 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 6 Dec 2017 10:06:36 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 6 Dec 2017 10:06:36 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vB6G6aYa015576
	for <meta-ti@yoctoproject.org>; Wed, 6 Dec 2017 10:06:36 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 6 Dec 2017 11:06:33 -0500
Message-ID: <1512576393-11754-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/master][PATCH] ti-sgx-ddk-um: update srcrev to pick up the latest fixes
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
X-List-Received-Date: Wed, 06 Dec 2017 16:06:38 -0000
Content-Type: text/plain

- gbm: Fix compilation error with BUILD=debug
- change GLES filenames to mesa style
- gbm: dont increment surface refcount inside internal function
- gbm: decrement gbm bo recount on DeleteDrawable
- add symbolic link libGLESv2.so.1 for backward compatibility of SGX binary demos

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
index 60f63aa..e950d91 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
@@ -8,7 +8,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 BRANCH = "ti-img-sgx/${PV}"
 
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
-SRCREV = "cf8cd620e96c9741bfcbe7f07c95328fe2d6ece9"
+SRCREV = "bbbd5cbb55e4c54d3b02456ae553bea86fd61506"
 
 # There's only hardfp version available
 python __anonymous() {
@@ -31,7 +31,7 @@ INITSCRIPT_PARAMS = "defaults 8"
 
 inherit update-rc.d
 
-PR = "r26"
+PR = "r27"
 PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 omap5-sgx-ddk-um-linux"
 
 DEPENDS += "libdrm udev libgbm wayland libffi"
@@ -55,6 +55,7 @@ do_install () {
     oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT}
     mkdir -p ${D}${libdir}/gbm
     ln -sf ../libpvrGBMWSEGL.so.${PV} ${D}${libdir}/gbm/gbm_pvr.so
+    ln -sf ../libGLESv2.so.${PV} ${D}${libdir}/libGLESv2.so.1
 }
 
 FILES_${PN} =  "${bindir}/*"
-- 
1.9.1


