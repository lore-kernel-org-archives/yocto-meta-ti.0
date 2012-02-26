Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BA72BE003E3
	for <meta-ti@yoctoproject.org>; Sat, 25 Feb 2012 19:22:39 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id EDAF952092; Sun, 26 Feb 2012 03:22:38 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120226032238.EDAF952092@arago-project.org>
Date: Sun, 26 Feb 2012 03:22:38 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : libgles-omap3: fix S for IJ unpack changes
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
X-List-Received-Date: Sun, 26 Feb 2012 03:22:39 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: a94f765b9867abefd5f0bd262b5dddb8782b3187
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a94f765b9867abefd5f0bd262b5dddb8782b3187

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Fri Feb 24 13:38:03 2012 +0100

libgles-omap3: fix S for IJ unpack changes

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../libgles/libgles-omap3_4.03.00.02.bb            |    2 +-
 .../libgles/libgles-omap3_4.05.00.03.bb            |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3_4.03.00.02.bb b/recipes-graphics/libgles/libgles-omap3_4.03.00.02.bb
index f605ec0..97a22fe 100644
--- a/recipes-graphics/libgles/libgles-omap3_4.03.00.02.bb
+++ b/recipes-graphics/libgles/libgles-omap3_4.03.00.02.bb
@@ -26,5 +26,5 @@ SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gf
 SRC_URI[md5sum] = "ff8c1f2b8e4cb42f4ced6a613b081ada"
 SRC_URI[sha256sum] = "cdb0bd3964e107733d632aa8224e0537b05c1ffac34befc036423458c8d75255"
 
-S = "${WORKDIR}/Graphics_SDK_${SGXPV}"
+S = "${WORKDIR}"
 
diff --git a/recipes-graphics/libgles/libgles-omap3_4.05.00.03.bb b/recipes-graphics/libgles/libgles-omap3_4.05.00.03.bb
index 0092221..53585cf 100644
--- a/recipes-graphics/libgles/libgles-omap3_4.05.00.03.bb
+++ b/recipes-graphics/libgles/libgles-omap3_4.05.00.03.bb
@@ -22,5 +22,5 @@ SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gf
 SRC_URI[md5sum] = "0e651eaa92bb91760f0b40a17697a7dc"
 SRC_URI[sha256sum] = "bfe764a8959556195545d6fff76f63a489642f345c105bbbc309a3f243c2dd0e"
 
-S = "${WORKDIR}/Graphics_SDK_${SGXPV}"
+S = "${WORKDIR}"
 


