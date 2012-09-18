Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 30449E002AB
	for <meta-ti@yoctoproject.org>; Tue, 18 Sep 2012 16:58:28 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 601D252A6D; Tue, 18 Sep 2012 23:58:28 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120918235828.601D252A6D@arago-project.org>
Date: Tue, 18 Sep 2012 23:58:28 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVyIGxpYmdsZXMtb21hcDM6IGZpeCBmb3IgbGF0ZXN0IG9lLWNvcmUgbWVzYSBjaGFuZ2Vz?=
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
X-List-Received-Date: Tue, 18 Sep 2012 23:58:33 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 48cab231fc8e3c322ff8b1cb4413d8de1d74fff6
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=48cab231fc8e3c322ff8b1cb4413d8de1d74fff6

Author: Andreas Müller <schnitzeltony@googlemail.com>
Date:   Tue Sep  4 18:20:58 2012 +0200

libgles-omap3: fix for latest oe-core mesa changes

* add virtual/libgles1 virtual/libgles2 to PROVIDES
* add RREPLACES_{PN}* for mesa's libegl* libgles1* libgles2*

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-graphics/libgles/libgles-omap3.inc |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
index 6137097..ac9d5df 100644
--- a/recipes-graphics/libgles/libgles-omap3.inc
+++ b/recipes-graphics/libgles/libgles-omap3.inc
@@ -3,13 +3,17 @@ LICENSE = "proprietary-binary"
 # 'TSPA.txt' might not be the best file to md5sum
 LIC_FILES_CHKSUM = "file://TSPA.txt;md5=c0d5d9c1e38b41677144c4e24d6ddee1"
 
-PR = "r31"
+PR = "r32"
 
 COMPATIBLE_MACHINE = "(omap3|ti814x|ti816x|ti33x)"
 
 DEPENDS = "virtual/libx11 libxau libxdmcp libdrm"
 
-PROVIDES += "virtual/egl"
+PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2"
+
+RREPLACES_${PN} = "libegl libgles1 libgles2"
+RREPLACES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev"
+RREPLACES_${PN}-dbg = "libegl-dbg"
 
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/OMAP35x_Graphics_SDK_setuplinux_${SGXPV}.bin \
 		   file://cputype \


