Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A9DA2E01358
	for <meta-ti@yoctoproject.org>; Tue,  3 Sep 2013 10:08:09 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 7005B52A7C; Tue,  3 Sep 2013 17:08:09 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130903170809.7005B52A7C@arago-project.org>
Date: Tue,  3 Sep 2013 17:08:09 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : libgles-omap3: introduce INC_PR
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
X-List-Received-Date: Tue, 03 Sep 2013 17:08:13 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 9e07040a0b73f4ea11ff4441e1046269ddc9bc05
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=9e07040a0b73f4ea11ff4441e1046269ddc9bc05

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Aug 31 22:09:34 2013 -0400

libgles-omap3: introduce INC_PR

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Chase Maupin <chase.maupin@ti.com>

---

 recipes-graphics/libgles/libgles-omap3-no-x.inc    |    2 +-
 recipes-graphics/libgles/libgles-omap3-x11.inc     |    2 +-
 .../libgles/libgles-omap3-x11_4.09.00.01.bb        |    2 ++
 .../libgles/libgles-omap3_4.09.00.01.bb            |    2 ++
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


