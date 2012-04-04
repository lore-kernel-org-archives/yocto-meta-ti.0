Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CF995E0044A
	for <meta-ti@yoctoproject.org>; Wed,  4 Apr 2012 10:43:45 -0700 (PDT)
Received: by werc1 with SMTP id c1so445976wer.35
	for <meta-ti@yoctoproject.org>; Wed, 04 Apr 2012 10:43:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=B6f3AwgvJ/VEOSwi4chDvw3r+fKVNRBqjOl6JBRRnmw=;
	b=EPLjF9iKKn9s6descL9ziSXt8ZArckdBO+6aF/xvNXpdituNmicm22JtPiloDGwCc5
	dcC2TLyY4PY32aDHxv0s8jw2h5JU8yNfiFAHC49mudIcZ8nZhj4OZbIbcu3sKUw43U8P
	fkmrd+USlrx9+X8+qAiBuuITIVt4SpSDi34QeA6JraOMezuL2v49g49wUo7B4rDN7f+k
	SacMVJETmSjggX3jN7Y6gWtpJJ7pzV3/EiSFn8XXm8UQlFhlLUBUg/37xZn/b67wa9Ou
	sTQCxl5aXbeLkKdB2dytT3VTRnqeY+/eTvptpG4GSTvEKFAbj5MNXkzSsewiZjkrBx0j
	dKqA==
Received: by 10.180.101.136 with SMTP id fg8mr7419754wib.4.1333561424376;
	Wed, 04 Apr 2012 10:43:44 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id ex2sm5317626wib.8.2012.04.04.10.43.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 04 Apr 2012 10:43:43 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Wed,  4 Apr 2012 19:43:38 +0200
Message-Id: <1333561418-4142-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQnSKyXjKvG9Yq41SFzRuydZOGDZdm8+UMGwMnajzoBJoH1OhI7d2RKrscgSXZrBdZdrYOxL
Cc: denys@ti.com
Subject: [PATCH] u-boot 2011.10rc: fix loading from /boot by adding ext4 support
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
X-List-Received-Date: Wed, 04 Apr 2012 17:43:46 -0000

This patchset was pulled from u-boot patchwork and aren't final, but testing on beaglebone shows it to work.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-bsp/u-boot/u-boot_2011.10rc.bb |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot_2011.10rc.bb b/recipes-bsp/u-boot/u-boot_2011.10rc.bb
index 0102d15..48bc618 100644
--- a/recipes-bsp/u-boot/u-boot_2011.10rc.bb
+++ b/recipes-bsp/u-boot/u-boot_2011.10rc.bb
@@ -6,7 +6,7 @@ COMPATIBLE_MACHINE = "(ti33x)"
 DEFAULT_PREFERENCE_ti33x = "99"
 
 PV = "2011.09+git"
-PR = "r26"
+PR = "r27"
 
 # SPL build
 UBOOT_BINARY = "u-boot.img"
@@ -24,6 +24,11 @@ SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;br
            file://2011.09git/0008-HACK-am335x-evm-turn-d-cache-on-globally-turn-it-off.patch \
            file://2011.09git/0009-am335x-evm-enable-i2c2-pinmux-for-beaglebone.patch \
            file://2011.09git/0001-ddr_defs-change-DDR-timings-for-15x15-EVM.patch \
+           file://2011.09git/0011-ext2load-increase-read-speed.patch \
+           file://2011.09git/0012-am335x-evm-fix-ext2load-and-specify-partition-for-bo.patch \
+           file://2011.09git/0013-am335x-evm-load-uImage-from-boot-instead-of-VFAT.patch \
+           file://2011.09git/0014-ext4fs-ls-load-support.patch \
+           file://2011.09git/0015-am335x-switch-to-ext4-mode.patch \
           "
 
 SRCREV = "f63b270e47f62f4d1a05b2001357e215966c6f5a"
-- 
1.7.2.5


