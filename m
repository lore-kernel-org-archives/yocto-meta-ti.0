Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6A017E0030B
	for <meta-ti@yoctoproject.org>; Mon, 30 Apr 2012 08:59:53 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 6A57A529E0; Mon, 30 Apr 2012 15:59:52 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120430155952.6A57A529E0@arago-project.org>
Date: Mon, 30 Apr 2012 15:59:52 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : libgles-omap3: add missing libdrm dependency
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Apr 2012 15:59:53 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 5b08302b8885b7a3d8670ecc92a609a29a197606
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=5b08302b8885b7a3d8670ecc92a609a29a197606

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Thu Apr 26 08:06:03 2012 +0200

libgles-omap3: add missing libdrm dependency

dpkg-deb -I shows:

 Package: libgles-omap3
 Version: 4.05.00.03-r26
 Depends: libgles-omap3-flipwsegl, devmem2, update-rc.d, libdrm2 (>= 2.4.31), libgles-omap3-linuxfbwsegl, fbset, libc6 (>= 2.12), libgles-omap3-blitwsegl, libgles-omap3-frontwsegl

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-graphics/libgles/libgles-omap3.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
index fbd931f..93cb091 100644
--- a/recipes-graphics/libgles/libgles-omap3.inc
+++ b/recipes-graphics/libgles/libgles-omap3.inc
@@ -3,11 +3,11 @@ LICENSE = "proprietary-binary"
 # 'TSPA.txt' might not be the best file to md5sum
 LIC_FILES_CHKSUM = "file://TSPA.txt;md5=c0d5d9c1e38b41677144c4e24d6ddee1"
 
-PR = "r26"
+PR = "r27"
 
 COMPATIBLE_MACHINE = "(omap3|ti816x|ti33x)"
 
-DEPENDS = "virtual/libx11 libxau libxdmcp"
+DEPENDS = "virtual/libx11 libxau libxdmcp libdrm"
 
 PROVIDES += "virtual/egl"
 


