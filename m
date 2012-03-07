Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 58EA8E013A6
	for <meta-ti@yoctoproject.org>; Wed,  7 Mar 2012 13:52:52 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 0E2E952A5C; Wed,  7 Mar 2012 21:52:50 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120307215251.0E2E952A5C@arago-project.org>
Date: Wed,  7 Mar 2012 21:52:50 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : gadget init: don't dump info to info.txt on boot
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
X-List-Received-Date: Wed, 07 Mar 2012 21:52:52 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: ed29286f2b16b48206ba788f790c1082c7724bb0
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ed29286f2b16b48206ba788f790c1082c7724bb0

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Wed Mar  7 10:11:27 2012 +0100

gadget init: don't dump info to info.txt on boot

This script adds ~10s to the boot time, doesn't have error checking and
prevents loading the storage gadget 3 out of 10 times.

Remove it from ExecStartPre to get a fast, consistent boot. The functionality
should be moved to bone101.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

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
 


