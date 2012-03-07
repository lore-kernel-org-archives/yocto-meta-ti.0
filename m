Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8B408E0044C
	for <meta-ti@lists.yoctoproject.org>;
	Wed,  7 Mar 2012 01:11:42 -0800 (PST)
Received: by werm13 with SMTP id m13so4297420wer.26
	for <meta-ti@lists.yoctoproject.org>;
	Wed, 07 Mar 2012 01:11:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=rolS7hON/XHGYuR3Di/bXx/3H/ZaTqVzizKvxoGcV9o=;
	b=FQelbDFjnLGS4uGKPUy0/lAWW37+Yr5kypuXqLlv20Nw6MfFPGDAMe3CSrnAjI0UAA
	HP3CZKZ90X3hP0B2di9TgyorlLytypCInEHL8vVm3u0qDOuTHb0fj9nSXGVWU0CQ/W7G
	zkW3pzrzYztsTGp2g5+V4vIHFY3kCr9BEpSOgI3h3cZ+ZI245AP908KiVrMfSMcgqc5x
	FyCHyKu1SlY8DZuUJl/CskB9BCBYBs5fguzOr8d/sSMxKGKj21x0h3dOcHVisusXlxmU
	jmCoNuCOSfgOXrRQA9W7pRWHESZj3PGNMEWXK9AqiIDzZyKzCNMmbb9u6Zwg06nXi8Vj
	5LuA==
Received: by 10.216.135.234 with SMTP id u84mr541609wei.108.1331111501330;
	Wed, 07 Mar 2012 01:11:41 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id gf3sm34428439wib.6.2012.03.07.01.11.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Mar 2012 01:11:40 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Wed,  7 Mar 2012 10:11:27 +0100
Message-Id: <1331111487-21170-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQl9pvSAUh4XYcbbYQPq7yXZmEvuWg7OmOKF55V5om+8T3sk7zhr+6RdpyZ1cs1jpx1i4pFE
Subject: [PATCH] gadget init: don't dump info to info.txt on boot
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
X-List-Received-Date: Wed, 07 Mar 2012 09:11:42 -0000

This script adds ~10s to the boot time, doesn't have error checking and prevents loading the storage gadget 3 out of 10 times.

Remove it from ExecStartPre to get a fast, consistent boot. The functionality should be moved to bone101.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-ti/beagleboard/gadget-init.bb              |    2 +-
 .../gadget-init/storage-gadget-init.service        |    1 -
 2 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/beagleboard/gadget-init.bb b/recipes-ti/beagleboard/gadget-init.bb
index 016877d..1a6a336 100644
--- a/recipes-ti/beagleboard/gadget-init.bb
+++ b/recipes-ti/beagleboard/gadget-init.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Units to initialize usb gadgets"
 
-PR = "r18"
+PR = "r19"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
diff --git a/recipes-ti/beagleboard/gadget-init/storage-gadget-init.service b/recipes-ti/beagleboard/gadget-init/storage-gadget-init.service
index 601e0d7..9a8513e 100644
--- a/recipes-ti/beagleboard/gadget-init/storage-gadget-init.service
+++ b/recipes-ti/beagleboard/gadget-init/storage-gadget-init.service
@@ -4,7 +4,6 @@ After=dev-mmcblk0p1.device
 
 [Service]
 RemainAfterExit=yes
-ExecStartPre=/usr/bin/update-image-info-on-mmcblk0p1.sh
 ExecStart=/sbin/modprobe g_mass_storage file=/dev/mmcblk0p1 cdrom=0 stall=0 removable=1 nofua=1
 ExecStop=/sbin/rmmod g_mass_storage
 
-- 
1.7.2.5


