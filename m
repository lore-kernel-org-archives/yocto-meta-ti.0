Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7252DE00873
	for <meta-ti@yoctoproject.org>; Fri, 17 Jan 2014 09:47:38 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 2FEC752A69; Fri, 17 Jan 2014 17:47:38 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140117174738.2FEC752A69@arago-project.org>
Date: Fri, 17 Jan 2014 17:47:38 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Chase Maupin : omap-a15: set the UBI_VOLNAME to match u-boot default
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
X-List-Received-Date: Fri, 17 Jan 2014 17:47:38 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: dde9c84e1675fddfe55b981cd2af34e4c1ee3cf9
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=dde9c84e1675fddfe55b981cd2af34e4c1ee3cf9

Author: Chase Maupin <Chase.Maupin@ti.com>
Date:   Fri Jan 17 11:40:19 2014 -0600

omap-a15: set the UBI_VOLNAME to match u-boot default

* By setting the UBI_VOLNAME variable the default name for the
  UBI rootfs will match the default used by u-boot so images
  built through OpenEmbedded will work with out-of-box u-boot.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/omap-a15.inc |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
index b0a0e74..dcf973e 100644
--- a/conf/machine/include/omap-a15.inc
+++ b/conf/machine/include/omap-a15.inc
@@ -24,3 +24,7 @@ XSERVER = "xserver-xorg \
            xf86-video-fbdev"
 
 GUI_MACHINE_CLASS = "smallscreen"
+
+# Use the expected value of the ubifs filesystem's volume name in the kernel
+# and u-boot.
+UBI_VOLNAME = "rootfs"


