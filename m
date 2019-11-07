Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2BED4E00D7E; Wed,  6 Nov 2019 21:06:18 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/,
	low *      trust
	*      [64.68.198.64 listed in list.dnswl.org]
	*  0.1 URI_HEX URI: URI hostname has long hexadecimal sequence
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 529E3E00B8E
	for <meta-ti@yoctoproject.org>; Wed,  6 Nov 2019 21:06:16 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6E0F640BEA;
	Thu,  7 Nov 2019 05:06:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id n2ZU-LKjlNir; Thu,  7 Nov 2019 05:06:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5359B40B37;
	Thu,  7 Nov 2019 05:06:15 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 8A61E170390;
	Thu,  7 Nov 2019 00:06:14 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Thu,  7 Nov 2019 00:06:14 -0500
Message-Id: <1573103174-8187-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [RFC][PATCH] sgx-um, rogue-umlibs, gc320-libs: RRECOMMENDS on corresponding drivers
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
X-List-Received-Date: Thu, 07 Nov 2019 05:06:18 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb           | 2 ++
 recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb | 4 +++-
 recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb       | 2 ++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
index 0221e39..9487e72 100644
--- a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
+++ b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
@@ -12,6 +12,8 @@ BRANCH = "ti-${PV}"
 SRC_URI = "git://git.ti.com/graphics/ti-gc320-libs.git;protocol=git;branch=${BRANCH}"
 SRCREV = "c0afab259de59909cfe74c01f3f7fbaa147f94b5"
 
+RRECOMMENDS_${PN} = "ti-gc320-driver"
+
 # There's only hardfp version available
 python __anonymous() {
     tunes = d.getVar("TUNE_FEATURES")
diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
index 9cb863a..6729075 100644
--- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
+++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
@@ -27,7 +27,7 @@ PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 virtual/libgbm"
 DEPENDS += "libdrm wayland expat"
 RDEPENDS_${PN} += "bash"
 RDEPENDS_${PN} += "python-core"
-RDEPENDS_${PN} += "ti-img-rogue-driver wayland expat"
+RDEPENDS_${PN} += "wayland expat"
 
 RPROVIDES_${PN} = "libegl libgles1 libgles2 libgbm"
 RPROVIDES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
@@ -41,6 +41,8 @@ RCONFLICTS_${PN} = "libegl libgles1 libgles2 libgbm"
 RCONFLICTS_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
 RCONFLICTS_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg"
 
+RRECOMMENDS_${PN} += "ti-img-rogue-driver"
+
 S = "${WORKDIR}/git"
 
 do_install () {
diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
index ecf3ffc..8b0b305 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
@@ -43,6 +43,8 @@ RCONFLICTS_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg"
 # The actual SONAME is libGLESv2.so.2, so need to explicitly specify RPROVIDES for .so.1 here
 RPROVIDES_${PN} += "libGLESv2.so.1"
 
+RRECOMMENDS_${PN} += "ti-sgx-ddk-km"
+
 S = "${WORKDIR}/git"
 
 do_install () {
-- 
2.7.4


