Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 835D7E00820
	for <meta-ti@yoctoproject.org>; Fri, 17 Jan 2014 08:18:41 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0HGIe12011638
	for <meta-ti@yoctoproject.org>; Fri, 17 Jan 2014 10:18:41 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0HGIeqk019354
	for <meta-ti@yoctoproject.org>; Fri, 17 Jan 2014 10:18:40 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 17 Jan 2014 10:18:40 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0HGIbwh021359;
	Fri, 17 Jan 2014 10:18:38 -0600
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 17 Jan 2014 11:40:19 -0600
Message-ID: <1389980421-26720-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCHv2 1/3] omap-a15: set the UBI_VOLNAME to match u-boot default
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
X-List-Received-Date: Fri, 17 Jan 2014 16:18:42 -0000
Content-Type: text/plain

* By setting the UBI_VOLNAME variable the default name for the
  UBI rootfs will match the default used by u-boot so images
  built through OpenEmbedded will work with out-of-box u-boot.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
* Updated in version 2
    * Changed the commit message to refer to the right variable name
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
-- 
1.7.0.4


