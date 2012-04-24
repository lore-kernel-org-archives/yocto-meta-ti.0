Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CAD0AE0044D
	for <meta-ti@yoctoproject.org>; Tue, 24 Apr 2012 11:11:26 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id CF5E7529AB; Tue, 24 Apr 2012 18:11:25 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120424181125.CF5E7529AB@arago-project.org>
Date: Tue, 24 Apr 2012 18:11:25 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : cloud9-gnome-image: same as cloud9-image, but with GNOME added to it
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
X-List-Received-Date: Tue, 24 Apr 2012 18:11:27 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 51617eac0cdd959918564ee4cc5442048cff51d9
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=51617eac0cdd959918564ee4cc5442048cff51d9

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Thu Apr 19 17:33:33 2012 +0200

cloud9-gnome-image: same as cloud9-image, but with GNOME added to it

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-misc/images/cloud9-gnome-image.bb |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/recipes-misc/images/cloud9-gnome-image.bb b/recipes-misc/images/cloud9-gnome-image.bb
new file mode 100644
index 0000000..13638d7
--- /dev/null
+++ b/recipes-misc/images/cloud9-gnome-image.bb
@@ -0,0 +1,19 @@
+# Image with cloud9 ide, gfx and hw tools installed
+
+require cloud9-image.bb
+
+# SoC specific packages, mostly 3D or multimedia related
+SOCSUPPORT = ""
+SOCSUPPORT_omap3 = "xbmc libgles-omap3-x11demos gstreamer-ti omapfbplay"
+SOCSUPPORT_ti33x = "xbmc libgles-omap3-x11demos gst-ffmpeg mplayer2 beaglebone-capes"
+
+IMAGE_INSTALL += " \
+                  angstrom-task-gnome gimp abiword gedit midori epiphany firefox matchbox-terminal \
+                  ${SOCSUPPORT} \
+                  ttf-dejavu-sans ttf-dejavu-sans-mono ttf-dejavu-common \
+                  xinput-calibrator \
+                  xterm \
+                 "
+
+export IMAGE_BASENAME = "Cloud9-IDE-GNOME"
+


