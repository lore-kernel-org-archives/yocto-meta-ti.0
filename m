Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8C333E01405
	for <meta-ti@yoctoproject.org>; Sat, 31 Aug 2013 20:13:25 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MSF00LW9FLWEZ70@vms173007.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Sat, 31 Aug 2013 22:13:13 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 0140D20091; Sat,
	31 Aug 2013 23:13:08 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Sat, 31 Aug 2013 23:12:59 -0400
Message-id: <1378005180-30928-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1378005180-30928-1-git-send-email-denis@denix.org>
References: <1378005180-30928-1-git-send-email-denis@denix.org>
Subject: [PATCH 4/5] libgles-omap3: introduce INC_PR
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
X-List-Received-Date: Sun, 01 Sep 2013 03:13:28 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-graphics/libgles/libgles-omap3-no-x.inc          | 2 +-
 recipes-graphics/libgles/libgles-omap3-x11.inc           | 2 +-
 recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb | 2 ++
 recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb     | 2 ++
 4 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3-no-x.inc b/recipes-graphics/libgles/libgles-omap3-no-x.inc
index 727c422..83873d7 100644
--- a/recipes-graphics/libgles/libgles-omap3-no-x.inc
+++ b/recipes-graphics/libgles/libgles-omap3-no-x.inc
@@ -3,7 +3,7 @@ LICENSE = "proprietary-binary"
 # 'TSPA.txt' might not be the best file to md5sum
 LIC_FILES_CHKSUM = "file://TSPA.txt;md5=c0d5d9c1e38b41677144c4e24d6ddee1"
 
-PR = "r36"
+INC_PR = "r37"
 
 EXCLUDE_FROM_WORLD = "1"
 
diff --git a/recipes-graphics/libgles/libgles-omap3-x11.inc b/recipes-graphics/libgles/libgles-omap3-x11.inc
index abe6e6f..106a9bc 100644
--- a/recipes-graphics/libgles/libgles-omap3-x11.inc
+++ b/recipes-graphics/libgles/libgles-omap3-x11.inc
@@ -3,7 +3,7 @@ LICENSE = "proprietary-binary"
 # 'TSPA.txt' might not be the best file to md5sum
 LIC_FILES_CHKSUM = "file://TSPA.txt;md5=c0d5d9c1e38b41677144c4e24d6ddee1"
 
-PR = "r36"
+INC_PR = "r37"
 
 EXCLUDE_FROM_WORLD = "1"
 
diff --git a/recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb b/recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb
index b7e6ce0..6b9c561 100644
--- a/recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb
+++ b/recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb
@@ -2,6 +2,8 @@ require libgles-omap3-x11.inc
 
 LICENSE = "TSPA"
 
+PR = "${INC_PR}.0"
+
 DEFAULT_PREFERENCE = "-1"
 
 BINLOCATION_omap3  = "${S}/gfx_rel_es3.x"
diff --git a/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb b/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
index b68b4c3..a4da2f9 100644
--- a/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
+++ b/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
@@ -2,6 +2,8 @@ require libgles-omap3-no-x.inc
 
 LICENSE = "TSPA"
 
+PR = "${INC_PR}.0"
+
 DEFAULT_PREFERENCE = "-1"
 
 BINLOCATION_omap3  = "${S}/gfx_rel_es3.x"
-- 
1.8.3.2


