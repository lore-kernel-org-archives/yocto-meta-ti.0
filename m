Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E5DF2E01446
	for <meta-ti@yoctoproject.org>; Thu, 30 Aug 2012 01:55:21 -0700 (PDT)
Received: by mail-ey0-f176.google.com with SMTP id d1so500603eab.35
	for <meta-ti@yoctoproject.org>; Thu, 30 Aug 2012 01:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=+i5xqcCqrCS/bF6ybkNmJtgkF70+hL51o2tOSb9JLWw=;
	b=oB3mjobjJt2kHVA8sa1A5zswkx2AR/cqT0RIaBBCX7JxoTOsjoWeWP1K6O3KhyKxuW
	HqJVJ2Z44duZ90xlUvHs9NFSV3Sw0xLdGTa+1dqLlkjLKJiZfZ3TIWiPbZRhLOG2lwyy
	y8DmcrWjXRNhQat+u0Xawm/9xEUiR9tyu7AOova7RcVu4rqb9pTp8HI+G8Vx+dojwLUa
	fQzheCcm3ugida9g1U4dQjwpgvZSZhgRfjR1OpsWAVhvSlVXipYmLb4dVKBp+gekZ6J4
	2K89/MSWxpB6nBTx/tgjmkhN9kVBIikUT7IS7Y39urskZcHVADtPWqOgwdPFDU86En+L
	KoWA==
Received: by 10.14.180.68 with SMTP id i44mr5558406eem.20.1346316921543;
	Thu, 30 Aug 2012 01:55:21 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id 45sm2990741eeb.8.2012.08.30.01.55.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Aug 2012 01:55:20 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Thu, 30 Aug 2012 10:54:58 +0200
Message-Id: <1346316899-11441-5-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1346316899-11441-1-git-send-email-koen@dominion.thruhere.net>
References: <1346316899-11441-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkdepyK8eIRpPy0nW/Y7hK+PyZ/5nSB8SoEtw86FvCGJIOEvYqL29xpzcfynH8uvterZgiA
Subject: [PATCH 5/6] linux-mainline: update to 3.2.28
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Aug 2012 08:55:22 -0000

---
 conf/machine/include/omap3.inc             |    2 +-
 recipes-kernel/linux/linux-mainline_3.2.bb |    8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
index 0f3cc36..8ce0ebc 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -4,7 +4,7 @@ require conf/machine/include/soc-family.inc
 require conf/machine/include/tune-cortexa8.inc
 PREFERRED_PROVIDER_virtual/kernel = "linux-omap"
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r121"
+MACHINE_KERNEL_PR = "r122"
 
 KERNEL_IMAGETYPE = "uImage"
 
diff --git a/recipes-kernel/linux/linux-mainline_3.2.bb b/recipes-kernel/linux/linux-mainline_3.2.bb
index 69344ff..bc0a145 100644
--- a/recipes-kernel/linux/linux-mainline_3.2.bb
+++ b/recipes-kernel/linux/linux-mainline_3.2.bb
@@ -5,12 +5,12 @@ KERNEL_IMAGETYPE = "uImage"
 
 COMPATIBLE_MACHINE = "(beagleboard)"
 
-PV = "3.2.18"
-# v3.2.18 tag
-SRCREV_pn-${PN} = "52c6b95f8a2edaff98b779f15b2f4d69b61b18b9"
+PV = "3.2.28"
+# v3.2.28 tag
+SRCREV_pn-${PN} = "1f873aca1c7aa7a574b276c040d304d16f1dbfa4"
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
-MACHINE_KERNEL_PR_append = "b"
+MACHINE_KERNEL_PR_append = "a"
 
 FILESPATH =. "${FILE_DIRNAME}/linux-mainline-3.2:${FILE_DIRNAME}/linux-mainline-3.2/${MACHINE}:"
 
-- 
1.7.10


