Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6EA4EE013BB
	for <meta-ti@yoctoproject.org>; Wed, 23 May 2012 04:57:28 -0700 (PDT)
Received: by eekb45 with SMTP id b45so2168882eek.35
	for <meta-ti@yoctoproject.org>; Wed, 23 May 2012 04:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=FOQSj0wL6fEyiasxZN3jhkf2zsdR7pmSfIEgn6dCZTE=;
	b=B++GiJA63ohN1mL0f56UEmHJeMoCYbUYm0P8fLtEZm0QPHJWOQkJLyJO8JnQESJLx6
	628uwCaSP08EA3/6hrdJAjiTHSFyEJjEc4xNZh7sdKT2nM2hbk14eMcnXzRaff2UWPBA
	nEhBTtqlRN4+l4OeBZFQlxp08xv0/nARmnTeb9AT7WW2iSOjAmm5iq4OvvaBx15oIQSM
	N7QP8AUXL7GOycBT6I/zI+mjwR14Cc0gWV1R5eb/CK0XTQXPIzu/4Czv2Md+cSlzFy39
	nOumtqyTqHRcA6G+CTY3OyoMXToZjaXSnIME2ROAYXXq+HzscEXLkyC3o9NGzlibecRq
	9P5g==
Received: by 10.213.3.151 with SMTP id 23mr1064621ebn.76.1337774246974;
	Wed, 23 May 2012 04:57:26 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id f16sm122073736eec.2.2012.05.23.04.57.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 May 2012 04:57:25 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Wed, 23 May 2012 13:57:15 +0200
Message-Id: <1337774235-9471-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkMQX9+QBm9YoMGa4UGMOeeGCg7DFslOB6h2aCUZDZfVD/w3yzQu3se+cTEByb6dW1mAH4U
Cc: denys@ti.com
Subject: [PATCH] linux-mainline: update to 3.2.18
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
X-List-Received-Date: Wed, 23 May 2012 11:57:28 -0000

---
 conf/machine/include/omap3.inc             |    2 +-
 recipes-kernel/linux/linux-mainline_3.2.bb |    8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
index c5b1979..0f3cc36 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -4,7 +4,7 @@ require conf/machine/include/soc-family.inc
 require conf/machine/include/tune-cortexa8.inc
 PREFERRED_PROVIDER_virtual/kernel = "linux-omap"
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r120"
+MACHINE_KERNEL_PR = "r121"
 
 KERNEL_IMAGETYPE = "uImage"
 
diff --git a/recipes-kernel/linux/linux-mainline_3.2.bb b/recipes-kernel/linux/linux-mainline_3.2.bb
index 3dda4f8..69eb7e5 100644
--- a/recipes-kernel/linux/linux-mainline_3.2.bb
+++ b/recipes-kernel/linux/linux-mainline_3.2.bb
@@ -5,12 +5,12 @@ KERNEL_IMAGETYPE = "uImage"
 
 COMPATIBLE_MACHINE = "(beagleboard)"
 
-PV = "3.2.16"
-# v3.2.16 tag
-SRCREV_pn-${PN} = "b1be7dd1ec231ae751d0ce3acd0d2e5760704a6f"
+PV = "3.2.18"
+# v3.2.18 tag
+SRCREV_pn-${PN} = "52c6b95f8a2edaff98b779f15b2f4d69b61b18b9"
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
-MACHINE_KERNEL_PR_append = "d"
+MACHINE_KERNEL_PR_append = "a"
 
 FILESPATH =. "${FILE_DIRNAME}/linux-mainline-3.2:${FILE_DIRNAME}/linux-mainline-3.2/${MACHINE}:"
 
-- 
1.7.10


