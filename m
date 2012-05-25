Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-bk0-f48.google.com (mail-bk0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0E877E01402
	for <meta-ti@yoctoproject.org>; Fri, 25 May 2012 02:07:57 -0700 (PDT)
Received: by bkcjf20 with SMTP id jf20so822123bkc.35
	for <meta-ti@yoctoproject.org>; Fri, 25 May 2012 02:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=I0S8/swlC1nBMozjl+eJ3eyflKOxQFwS1OR9LP8AetI=;
	b=QPNCVVrhMK44BQ5i8KnuST29XSwzqKIwiezPe44ntGLJl40iytzhlYg3h0rKFTuoJP
	nPh88g7eznB8uCJ/piNOmgwYiA2TlfsnFQNhLe+mbg2od2B49TrrD0HQCB6RjxBooG3+
	FsBGRlcoFuhqgV/LpOlHHucEY0UUJsZaB8v6U2FmbIEwhm3xLiuM8oV09IGJupg3bwE4
	FMA9EhDcGX0OtSUcbFGfKXAdHiWiKBqxjVCtEXvodxSkafPCa16yJ4asROdYGaQGp+Jm
	Sbg7r8bLy/MLWUuolsjSKRMwlZypMnjNhDg7WDU5HqFqFFDHm86zS5gpr+Yaf+b5ezY/
	ENKQ==
Received: by 10.204.128.88 with SMTP id j24mr1092913bks.89.1337936876984;
	Fri, 25 May 2012 02:07:56 -0700 (PDT)
Received: from localhost.localdomain (p4FDF163D.dip.t-dialin.net.
	[79.223.22.61])
	by mx.google.com with ESMTPS id x23sm5550692bkw.12.2012.05.25.02.07.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 25 May 2012 02:07:56 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: meta-ti@yoctoproject.org
Date: Fri, 25 May 2012 11:11:56 +0200
Message-Id: <1337937117-3991-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1337937117-3991-1-git-send-email-schnitzeltony@googlemail.com>
References: <1337937117-3991-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [V2 1/2] linux-mainline: update to 3.2.18
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
X-List-Received-Date: Fri, 25 May 2012 09:07:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Koen Kooi <koen@dominion.thruhere.net>

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
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
1.7.4.4


