Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9B3E8E01400
	for <meta-ti@yoctoproject.org>; Thu, 19 Apr 2012 08:33:43 -0700 (PDT)
Received: by wibhr14 with SMTP id hr14so1652932wib.11
	for <meta-ti@yoctoproject.org>; Thu, 19 Apr 2012 08:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=tMVAGogqFnoDWPK/TcoRuffbMsFgJS+bF6jA7FzwZlA=;
	b=h/Sik0YwmM5P+U3CiGk92L9hSrzKv8SJ3DV/5mAA5U2bJVDAPjKDztuFqoCQSryiNL
	ATHD3ACYpG3mnQNqg4tDltXx2+NEgAIVZb5RmypjXy6kaFOwI2vrmOtWR9kFvCr6IDh2
	j9VS/6f5k3XAPXwdLALKfltS+bfIhtiVdKsvhk78PWZvKEqDArMUacTYkltZZjoSzuZ4
	HxY0fyquYag9/QPrlBStXtm87NNM7xd5NIgb6Gk/cEc2LZAVGIBlpVY7ZFgfTVVQppqX
	imVPaSJh3/kTWFMqJ4yDTcvTdnhwhBlnffOAbEGBXWjs+izFEA6g4/AOkCQRehP3wySn
	u4XQ==
Received: by 10.180.85.135 with SMTP id h7mr7689461wiz.0.1334849622578;
	Thu, 19 Apr 2012 08:33:42 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id gg2sm9416576wib.7.2012.04.19.08.33.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Apr 2012 08:33:41 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Thu, 19 Apr 2012 17:33:34 +0200
Message-Id: <1334849614-12816-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1334849614-12816-1-git-send-email-koen@dominion.thruhere.net>
References: <1334849614-12816-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkl69jti0rsqHho9MtAnFIruXA797nCLDDle0tkJuqgg6pFm0m50zH0We7w8fo6XvYK+CMy
Cc: denys@ti.com
Subject: [PATCH 2/2] linux-ti33x-psp 3.2: fix VGA cape detection for beaglebone
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
X-List-Received-Date: Thu, 19 Apr 2012 15:33:44 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...don-t-compare-undefined-characters-it-mak.patch |   26 ++++++++++++++++++++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    3 +-
 2 files changed, 28 insertions(+), 1 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0030-beaglebone-don-t-compare-undefined-characters-it-mak.patch

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0030-beaglebone-don-t-compare-undefined-characters-it-mak.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0030-beaglebone-don-t-compare-undefined-characters-it-mak.patch
new file mode 100644
index 0000000..48e8c53
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0030-beaglebone-don-t-compare-undefined-characters-it-mak.patch
@@ -0,0 +1,26 @@
+From 6e14ab85bd71ec3831169d665c4e79f646a60df8 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Thu, 19 Apr 2012 07:55:55 +0200
+Subject: [PATCH 30/30] beaglebone: don't compare undefined characters, it makes strncomp fail
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index bfcccd9..08a0425 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -2152,7 +2152,7 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 		beaglebone_lcd3_keys_init(0,0);
+ 	}
+ 	
+-	if (!strncmp("BB-BONE-VGA-01", cape_config.partnumber, 15)) {
++	if (!strncmp("BB-BONE-VGA-01", cape_config.partnumber, 14)) {
+ 		pr_info("BeagleBone cape: initializing VGA cape\n");
+ 		dvi_init(0,0);
+ 	}
+-- 
+1.7.2.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index d3a2f2e..f560a1d 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -12,7 +12,7 @@ MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.2-staging"
 SRCREV = "e8004dad869568692ca2a45c04e8464ce48cc4d7"
-MACHINE_KERNEL_PR_append = "c+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "d+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
@@ -825,4 +825,5 @@ PATCHES_OVER_PSP = " \
 	file://beaglebone/0027-beaglebone-decrease-PWM-frequency-to-old-value-LCD7-.patch \
 	file://beaglebone/0028-beaglebone-fix-ehrpwm-backlight.patch \
 	file://beaglebone/0029-beaglebone-also-report-cape-revision.patch \
+	file://beaglebone/0030-beaglebone-don-t-compare-undefined-characters-it-mak.patch \
 "
-- 
1.7.2.5


