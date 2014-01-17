Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C5DFAE00820
	for <meta-ti@yoctoproject.org>; Fri, 17 Jan 2014 06:48:31 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0HEmUFH004448
	for <meta-ti@yoctoproject.org>; Fri, 17 Jan 2014 08:48:30 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0HEmUBH003166
	for <meta-ti@yoctoproject.org>; Fri, 17 Jan 2014 08:48:30 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 17 Jan 2014 08:48:29 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0HEmQfS017668;
	Fri, 17 Jan 2014 08:48:28 -0600
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 17 Jan 2014 10:10:09 -0600
Message-ID: <1389975009-25868-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] omap-a15: set the UBI_VOLUME to match u-boot default
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
X-List-Received-Date: Fri, 17 Jan 2014 14:48:32 -0000
Content-Type: text/plain

* By setting the UBI_VOLUME variable the default name for the
  UBI rootfs will match the default used by u-boot so images
  built through OpenEmbedded will work with out-of-box u-boot.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
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


