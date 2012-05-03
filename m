Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6E679E00723
	for <meta-ti@yoctoproject.org>; Wed,  2 May 2012 23:15:03 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 0293452990; Thu,  3 May 2012 06:15:02 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120503061503.0293452990@arago-project.org>
Date: Thu,  3 May 2012 06:15:02 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : libgles-omap3: enable for ti814x SOC family
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
X-List-Received-Date: Thu, 03 May 2012 06:15:03 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: d18bb23803ff9735a5fcb049c25d79273a325323
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d18bb23803ff9735a5fcb049c25d79273a325323

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu May  3 02:13:57 2012 -0400

libgles-omap3: enable for ti814x SOC family

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-graphics/libgles/libgles-omap3.inc         |    2 +-
 .../libgles/libgles-omap3_4.05.00.03.bb            |    1 +
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
index 664a649..6137097 100644
--- a/recipes-graphics/libgles/libgles-omap3.inc
+++ b/recipes-graphics/libgles/libgles-omap3.inc
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://TSPA.txt;md5=c0d5d9c1e38b41677144c4e24d6ddee1"
 
 PR = "r31"
 
-COMPATIBLE_MACHINE = "(omap3|ti816x|ti33x)"
+COMPATIBLE_MACHINE = "(omap3|ti814x|ti816x|ti33x)"
 
 DEPENDS = "virtual/libx11 libxau libxdmcp libdrm"
 
diff --git a/recipes-graphics/libgles/libgles-omap3_4.05.00.03.bb b/recipes-graphics/libgles/libgles-omap3_4.05.00.03.bb
index 53585cf..d55dd05 100644
--- a/recipes-graphics/libgles/libgles-omap3_4.05.00.03.bb
+++ b/recipes-graphics/libgles/libgles-omap3_4.05.00.03.bb
@@ -1,4 +1,5 @@
 BINLOCATION_omap3  = "${S}/gfx_rel_es3.x"
+BINLOCATION_ti814x = "${S}/gfx_rel_es6.x"
 BINLOCATION_ti816x = "${S}/gfx_rel_es6.x"
 BINLOCATION_ti33x = "${S}/gfx_rel_es8.x"
 


