Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f51.google.com (mail-ww0-f51.google.com [74.125.82.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 540F0E0044C
	for <meta-ti@lists.yoctoproject.org>;
	Wed,  7 Mar 2012 00:36:29 -0800 (PST)
Received: by wgbed3 with SMTP id ed3so4435513wgb.8
	for <meta-ti@lists.yoctoproject.org>;
	Wed, 07 Mar 2012 00:36:28 -0800 (PST)
Received: by 10.180.96.8 with SMTP id do8mr24181749wib.21.1331109387958;
	Wed, 07 Mar 2012 00:36:27 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id gf3sm34230491wib.6.2012.03.07.00.36.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Mar 2012 00:36:27 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Wed,  7 Mar 2012 09:36:22 +0100
Message-Id: <1331109382-24539-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQkzXsHmpSg0c46eAg6cWak9jkQzjPBG99T8/YwbRhdZx4FPfZKCQJZqO3wXivUwlgLWm6mu
Subject: [PATCH] linux-ti33x-psp 3.2: enable CONFIG_WATCHDOG_NOWAYOUT for beaglebone
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
X-List-Received-Date: Wed, 07 Mar 2012 08:36:29 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../linux/linux-ti33x-psp-3.2/beaglebone/defconfig |    4 ++--
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
index c5b80d1..782f52d 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
@@ -1769,8 +1769,8 @@ CONFIG_SENSORS_W83627HF=m
 CONFIG_SENSORS_W83627EHF=m
 # CONFIG_THERMAL is not set
 CONFIG_WATCHDOG=y
-# CONFIG_WATCHDOG_CORE is not set
-# CONFIG_WATCHDOG_NOWAYOUT is not set
+CONFIG_WATCHDOG_CORE=y
+CONFIG_WATCHDOG_NOWAYOUT=y
 
 #
 # Watchdog Device Drivers
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index b2f706a..79a315a 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -11,7 +11,7 @@ MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.2-staging"
 SRCREV = "09e9651bcf2ee8d86685f2a8075bc6557b1d3b91"
-MACHINE_KERNEL_PR_append = "a+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "b+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
-- 
1.7.2.5


