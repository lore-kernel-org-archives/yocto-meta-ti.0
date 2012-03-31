Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0EEB6E004D2
	for <meta-ti@yoctoproject.org>; Fri, 30 Mar 2012 19:04:43 -0700 (PDT)
Received: by wgbdq13 with SMTP id dq13so924137wgb.11
	for <meta-ti@yoctoproject.org>; Fri, 30 Mar 2012 19:04:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=7ItGGff6yoGpzTsNu0bFmxSrzf3FzSCcU2mD/rEcQ9M=;
	b=Wo8SzcmSJDKJcrKSrI5ZlQGLO73ff3RlWNBl2zRutGo/0aHj82jSQvgN8iCBVKVQKs
	7YQSSA6roQ41V67qDQ1dXkbfacW/9Z1CK8cbo14GqErFcIC250GcMKs43zfDTYHvHAbm
	FnvNzaRM4Gr7DGg7ahf3NLweyQ1PcwoNElK9H8N/zh89+lgXWi2l/zW7xHXGHQvnThWg
	hXzJ4OJk0gb6giWj8usHdEbNjJ8+Wvu22ZSgZaMGbjMp9zQkSHjQVBAZu147BxSYDaar
	v+nT4zSCYfty6GTXQ/WdtZ+NYAjZrEPfjHain3lXWsFiAKhc0zsvcIaKAZvD0IuPSGKF
	ZNuA==
Received: by 10.180.92.71 with SMTP id ck7mr1952051wib.21.1333159482673;
	Fri, 30 Mar 2012 19:04:42 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id n15sm11369416wiw.6.2012.03.30.19.04.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Mar 2012 19:04:42 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Sat, 31 Mar 2012 04:04:23 +0200
Message-Id: <1333159463-19937-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQn/YzehzeJn/xvgBIDa6flYbWGvaGt25BhgC/hmlnvpvwmHAbNatOJkhjfq7v6Vp+H2PbuN
Subject: [RFC][PATCH] u-boot 2011.10rc: add patch to speed up ext2load
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
X-List-Received-Date: Sat, 31 Mar 2012 02:04:44 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---

Please test this patch on your am335x boards, I need to run out and buy a mini usb cable because I misplaced mine during traveling this week. 

Untested, but I wanted to get it out before the weekend.

 .../0011-ext2load-increase-read-speed.patch        |   74 ++++++++++++++++++++
 recipes-bsp/u-boot/u-boot_2011.10rc.bb             |    3 +-
 2 files changed, 76 insertions(+), 1 deletions(-)
 create mode 100644 recipes-bsp/u-boot/u-boot/2011.09git/0011-ext2load-increase-read-speed.patch

diff --git a/recipes-bsp/u-boot/u-boot/2011.09git/0011-ext2load-increase-read-speed.patch b/recipes-bsp/u-boot/u-boot/2011.09git/0011-ext2load-increase-read-speed.patch
new file mode 100644
index 0000000..7d4ce87
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot/2011.09git/0011-ext2load-increase-read-speed.patch
@@ -0,0 +1,74 @@
+From 5d6d85e090e6ff57972e7cc9d38fa0c62be08031 Mon Sep 17 00:00:00 2001
+From: u-boot@lakedaemon.net <u-boot@lakedaemon.net>
+Date: Wed, 28 Mar 2012 04:37:11 +0000
+Subject: [PATCH 11/11] ext2load: increase read speed
+
+This patch dramatically drops the amount of time u-boot needs to read a
+file from an ext2 partition.  On a typical 2 to 5 MB file (kernels and
+initrds) it goes from tens of seconds to a couple seconds.
+
+All we are doing here is grouping contiguous blocks into one read.
+
+Boot tested on Globalscale Technologies Dreamplug (Kirkwood ARM SoC)
+with three different files.  sha1sums were calculated in Linux
+userspace, and then confirmed after ext2load.
+
+Signed-off-by: Jason Cooper <u-boot@lakedaemon.net>
+---
+ fs/ext2/ext2fs.c |   26 ++++++++++++++++++++++++--
+ 1 files changed, 24 insertions(+), 2 deletions(-)
+
+diff --git a/fs/ext2/ext2fs.c b/fs/ext2/ext2fs.c
+index e119e13..8531db5 100644
+--- a/fs/ext2/ext2fs.c
++++ b/fs/ext2/ext2fs.c
+@@ -414,7 +414,6 @@ int ext2fs_read_file
+ 		if (blknr < 0) {
+ 			return (-1);
+ 		}
+-		blknr = blknr << log2blocksize;
+ 
+ 		/* Last block.  */
+ 		if (i == blockcnt - 1) {
+@@ -432,6 +431,29 @@ int ext2fs_read_file
+ 			blockend -= skipfirst;
+ 		}
+ 
++		/* grab middle blocks in one go */
++		if (i != pos / blocksize && i != blockcnt - 1 && blockcnt > 3) {
++			int oldblk = blknr;
++			int blocknxt;
++			while (i < blockcnt - 1) {
++				blocknxt = ext2fs_read_block(node, i + 1);
++				if (blocknxt == (oldblk + 1)) {
++					oldblk = blocknxt;
++					i++;
++				} else {
++					blocknxt = ext2fs_read_block(node, i);
++					break;
++				}
++			}
++
++			if (oldblk == blknr)
++				blockend = blocksize;
++			else
++				blockend = (1 + blocknxt - blknr) * blocksize;
++		}
++
++		blknr = blknr << log2blocksize;
++
+ 		/* If the block number is 0 this block is not stored on disk but
+ 		   is zero filled instead.  */
+ 		if (blknr) {
+@@ -444,7 +466,7 @@ int ext2fs_read_file
+ 		} else {
+ 			memset (buf, 0, blocksize - skipfirst);
+ 		}
+-		buf += blocksize - skipfirst;
++		buf += blockend - skipfirst;
+ 	}
+ 	return (len);
+ }
+-- 
+1.7.2.5
+
diff --git a/recipes-bsp/u-boot/u-boot_2011.10rc.bb b/recipes-bsp/u-boot/u-boot_2011.10rc.bb
index 0102d15..8f2c137 100644
--- a/recipes-bsp/u-boot/u-boot_2011.10rc.bb
+++ b/recipes-bsp/u-boot/u-boot_2011.10rc.bb
@@ -6,7 +6,7 @@ COMPATIBLE_MACHINE = "(ti33x)"
 DEFAULT_PREFERENCE_ti33x = "99"
 
 PV = "2011.09+git"
-PR = "r26"
+PR = "r27"
 
 # SPL build
 UBOOT_BINARY = "u-boot.img"
@@ -24,6 +24,7 @@ SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;br
            file://2011.09git/0008-HACK-am335x-evm-turn-d-cache-on-globally-turn-it-off.patch \
            file://2011.09git/0009-am335x-evm-enable-i2c2-pinmux-for-beaglebone.patch \
            file://2011.09git/0001-ddr_defs-change-DDR-timings-for-15x15-EVM.patch \
+           file://2011.09git/0011-ext2load-increase-read-speed.patch \
           "
 
 SRCREV = "f63b270e47f62f4d1a05b2001357e215966c6f5a"
-- 
1.7.2.5


