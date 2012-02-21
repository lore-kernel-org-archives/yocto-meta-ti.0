Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f51.google.com (mail-ww0-f51.google.com [74.125.82.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4E5DAE013AE
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 21 Feb 2012 02:30:54 -0800 (PST)
Received: by mail-ww0-f51.google.com with SMTP id dy1so4575059wgb.8
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 21 Feb 2012 02:30:54 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.92.229 as permitted sender)
	client-ip=10.180.92.229; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.92.229 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.92.229])
	by 10.180.92.229 with SMTP id cp5mr24304845wib.8.1329820254066
	(num_hops = 1); Tue, 21 Feb 2012 02:30:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.92.229 with SMTP id cp5mr20247987wib.8.1329820254017;
	Tue, 21 Feb 2012 02:30:54 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id y1sm53616538wiw.6.2012.02.21.02.30.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Feb 2012 02:30:53 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Tue, 21 Feb 2012 11:30:18 +0100
Message-Id: <1329820224-28112-4-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1329820224-28112-1-git-send-email-koen@dominion.thruhere.net>
References: <1329820224-28112-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQl84PsjLcwh8rIJuc3iXqAWO9i3/oN3alsSycPSFy0Hy4uKYs/NlJUGVJho+hrNnLccIWb9
Subject: [Beagleboard.org][PATCH v2 04/10] linux 3.0: update from 3.0.17 to 3.0.22
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
X-List-Received-Date: Tue, 21 Feb 2012 10:30:54 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 conf/machine/include/omap3.inc    |    2 +-
 recipes-kernel/linux/linux_3.0.bb |    8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
index f415864..b7d23af 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -3,7 +3,7 @@ SOC_FAMILY = "omap3"
 require conf/machine/include/tune-cortexa8.inc
 PREFERRED_PROVIDER_virtual/kernel = "linux-omap"
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r115"
+MACHINE_KERNEL_PR = "r116"
 
 KERNEL_IMAGETYPE = "uImage"
 
diff --git a/recipes-kernel/linux/linux_3.0.bb b/recipes-kernel/linux/linux_3.0.bb
index d62c1ea..65084fb 100644
--- a/recipes-kernel/linux/linux_3.0.bb
+++ b/recipes-kernel/linux/linux_3.0.bb
@@ -5,12 +5,12 @@ KERNEL_IMAGETYPE = "uImage"
 
 COMPATIBLE_MACHINE = "(beagleboard)"
 
-PV = "3.0.17"
-# v3.0.17 tag
-SRCREV_pn-${PN} = "e9d23be2708477feeaec78e707c80441520c1ef6"
+PV = "3.0.22"
+# v3.0.22 tag
+SRCREV_pn-${PN} = "a4a663513af05a98d6085d92f85c16bb64ac4050"
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
-MACHINE_KERNEL_PR_append = "c"
+MACHINE_KERNEL_PR_append = "a"
 
 FILESPATH =. "${FILE_DIRNAME}/linux-3.0:${FILE_DIRNAME}/linux-3.0/${MACHINE}:"
 
-- 
1.7.2.5


