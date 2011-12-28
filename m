Return-Path: <pabigot@gmail.com>
Received: from mail-gy0-f176.google.com (mail-gy0-f176.google.com
	[209.85.160.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 70A82E012F3
	for <meta-ti@yoctoproject.org>; Tue, 27 Dec 2011 16:52:19 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by mail-gy0-f176.google.com with SMTP id g15so4331512ghb.35
	for <meta-ti@yoctoproject.org>; Tue, 27 Dec 2011 16:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=Mslp06dR4H5ahrSGdrS38ao1VMwV8nYe4zIbdj8dCFE=;
	b=DBoepZADOJwFOld4puJ3amhBeG2wo+S0gEDYBllA58DyTqCjkX3l3xptrOBiHUHWlP
	8VgCYDBt3puCGZK3+78dN4ic4NbMaI47+PDy9Xi9v0Fg/y9Xt3+Rv6Khe0wyV0NQpcmk
	M323h9rkRLiMudBkygivU2KcTMrl6OVm4dJnw=
Received: by 10.236.174.2 with SMTP id w2mr40556206yhl.35.1325033539287;
	Tue, 27 Dec 2011 16:52:19 -0800 (PST)
Received: from localhost.localdomain (c-66-41-60-82.hsd1.mn.comcast.net.
	[66.41.60.82])
	by mx.google.com with ESMTPS id k10sm18006608anb.22.2011.12.27.16.52.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Dec 2011 16:52:18 -0800 (PST)
Sender: Peter Bigot <pabigot@gmail.com>
From: "Peter A. Bigot" <bigotp@acm.org>
To: meta-ti@yoctoproject.org
Date: Tue, 27 Dec 2011 18:52:00 -0600
Message-Id: <1325033520-6907-6-git-send-email-bigotp@acm.org>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1325033520-6907-1-git-send-email-bigotp@acm.org>
References: <1325033520-6907-1-git-send-email-bigotp@acm.org>
Subject: [PATCH 5/5] linux 3.0: put back support for graphics on ULCD7
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
X-List-Received-Date: Wed, 28 Dec 2011 00:52:19 -0000

From: "Peter A. Bigot" <bigotp@acm.org>

Signed-off-by: Peter A. Bigot <bigotp@acm.org>
---
 .../linux/linux-3.0/beagleboard/defconfig          |    2 +-
 recipes-kernel/linux/linux_3.0.bb                  |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-3.0/beagleboard/defconfig b/recipes-kernel/linux/linux-3.0/beagleboard/defconfig
index 5f2a7eb..7938236 100644
--- a/recipes-kernel/linux/linux-3.0/beagleboard/defconfig
+++ b/recipes-kernel/linux/linux-3.0/beagleboard/defconfig
@@ -2456,7 +2456,7 @@ CONFIG_OMAP2_DSS_SLEEP_BEFORE_RESET=y
 CONFIG_OMAP2_DSS_SLEEP_AFTER_VENC_RESET=y
 CONFIG_FB_OMAP2=y
 CONFIG_FB_OMAP2_DEBUG_SUPPORT=y
-CONFIG_FB_OMAP2_NUM_FBS=2
+CONFIG_FB_OMAP2_NUM_FBS=3
 
 #
 # OMAP2/3 Display Device Drivers
diff --git a/recipes-kernel/linux/linux_3.0.bb b/recipes-kernel/linux/linux_3.0.bb
index d72826b..277e5d4 100644
--- a/recipes-kernel/linux/linux_3.0.bb
+++ b/recipes-kernel/linux/linux_3.0.bb
@@ -10,7 +10,7 @@ PV = "3.0.14"
 SRCREV_pn-${PN} = "6636552f1dd0d2e2be2f87605ea2cd3aa4d2e5b6"
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 
 FILESPATH =. "${FILE_DIRNAME}/linux-3.0:${FILE_DIRNAME}/linux-3.0/${MACHINE}:"
 
-- 
1.7.6.4


