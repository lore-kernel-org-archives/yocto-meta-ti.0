Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f41.google.com (mail-ww0-f41.google.com [74.125.82.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 33F07E01408
	for <meta-ti@lists.yoctoproject.org>;
	Thu,  1 Mar 2012 00:48:51 -0800 (PST)
Received: by wgbds1 with SMTP id ds1so3632517wgb.2
	for <meta-ti@lists.yoctoproject.org>;
	Thu, 01 Mar 2012 00:48:50 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.96.8 as permitted sender)
	client-ip=10.180.96.8; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.96.8 as permitted
	sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.96.8])
	by 10.180.96.8 with SMTP id do8mr24741756wib.21.1330591730423 (num_hops
	= 1); Thu, 01 Mar 2012 00:48:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.96.8 with SMTP id do8mr19772285wib.21.1330591730371;
	Thu, 01 Mar 2012 00:48:50 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id dw7sm40303294wib.4.2012.03.01.00.48.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Mar 2012 00:48:49 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Thu,  1 Mar 2012 09:48:35 +0100
Message-Id: <1330591716-30218-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1330591716-30218-1-git-send-email-koen@dominion.thruhere.net>
References: <1330591716-30218-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQl2dr9t0qMpAdN4wtuMCgDfZhmZHApHs+6DVAvgvCMJTdoQoQl/0f1RWVB43GqjzMEFfr4t
Subject: [PATCH 2/3] linux 3.0: update to 3.0.23
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
X-List-Received-Date: Thu, 01 Mar 2012 08:48:51 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 conf/machine/include/omap3.inc    |    2 +-
 recipes-kernel/linux/linux_3.0.bb |    8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
index b7d23af..8fc0903 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -3,7 +3,7 @@ SOC_FAMILY = "omap3"
 require conf/machine/include/tune-cortexa8.inc
 PREFERRED_PROVIDER_virtual/kernel = "linux-omap"
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r116"
+MACHINE_KERNEL_PR = "r117"
 
 KERNEL_IMAGETYPE = "uImage"
 
diff --git a/recipes-kernel/linux/linux_3.0.bb b/recipes-kernel/linux/linux_3.0.bb
index fac6348..32ef963 100644
--- a/recipes-kernel/linux/linux_3.0.bb
+++ b/recipes-kernel/linux/linux_3.0.bb
@@ -5,12 +5,12 @@ KERNEL_IMAGETYPE = "uImage"
 
 COMPATIBLE_MACHINE = "(beagleboard)"
 
-PV = "3.0.22"
-# v3.0.22 tag
-SRCREV_pn-${PN} = "a4a663513af05a98d6085d92f85c16bb64ac4050"
+PV = "3.0.23"
+# v3.0.23 tag
+SRCREV_pn-${PN} = "bf6a68d2a214e07f7c0d6538e00e17b826714160"
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
-MACHINE_KERNEL_PR_append = "b"
+MACHINE_KERNEL_PR_append = "a"
 
 FILESPATH =. "${FILE_DIRNAME}/linux-3.0:${FILE_DIRNAME}/linux-3.0/${MACHINE}:"
 
-- 
1.7.2.5


