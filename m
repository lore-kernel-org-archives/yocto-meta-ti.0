Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BB6DDE013A0
	for <meta-ti@yoctoproject.org>; Mon, 16 Apr 2012 02:35:31 -0700 (PDT)
Received: by wgbfg15 with SMTP id fg15so404703wgb.11
	for <meta-ti@yoctoproject.org>; Mon, 16 Apr 2012 02:35:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=cj5FyKMP2HFe42dLIS4X/tJEddJ5MJpDA6fGCAIvETw=;
	b=A9kTfKXN0ckHtopPU5Zd7akOF+nlclbUJO7E3WEH6A8R+8IHt/EN6DFjaAAl7PW3DP
	fxO8FVz4V4tJ/XgKhGplv58EgSbgSfvbpLHOFcerGAutkh16KYRLw+PcO4izbZAhmol3
	QqzZYE3ec0V2qLXeUd5uH6xaZdOw6xphqvCLsVh3pJf5ACkHlPtqVTLuKOqyuDKZsJ/D
	PghaBZ7SLpOR+8Ci+D/Fqz15rFf48oor+EQsbEDdkYKFH7wsF4RrZITWSy7Z3s7oVlHq
	/YBfTBFrjGGzmZV5xa50IW6QtMjXB8p8D4AxVYd/R57sCL1R7dRnQ9biRXGXQAf9oRcg
	QEBg==
Received: by 10.180.88.199 with SMTP id bi7mr16999876wib.12.1334568930430;
	Mon, 16 Apr 2012 02:35:30 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id gg2sm29845987wib.7.2012.04.16.02.35.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Apr 2012 02:35:29 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Mon, 16 Apr 2012 11:35:21 +0200
Message-Id: <1334568921-25278-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQk38mNJUMg+KREMUouBWpKZfDY4Fi1CPh74Xvlf2mn2MjvttouP5hy8MKt/iiFpENjpKfAq
Cc: denys@ti.com
Subject: [PATCH] linux 3.0: update to 3.0.28
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
X-List-Received-Date: Mon, 16 Apr 2012 09:35:32 -0000

Runtime tested on Angstrom/beagleboard-xM

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 conf/machine/include/omap3.inc    |    2 +-
 recipes-kernel/linux/linux_3.0.bb |    6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
index 16078db..9903856 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -4,7 +4,7 @@ require conf/machine/include/soc-family.inc
 require conf/machine/include/tune-cortexa8.inc
 PREFERRED_PROVIDER_virtual/kernel = "linux-omap"
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r118"
+MACHINE_KERNEL_PR = "r119"
 
 KERNEL_IMAGETYPE = "uImage"
 
diff --git a/recipes-kernel/linux/linux_3.0.bb b/recipes-kernel/linux/linux_3.0.bb
index a817c1d..522a87d 100644
--- a/recipes-kernel/linux/linux_3.0.bb
+++ b/recipes-kernel/linux/linux_3.0.bb
@@ -5,9 +5,9 @@ KERNEL_IMAGETYPE = "uImage"
 
 COMPATIBLE_MACHINE = "(beagleboard)"
 
-PV = "3.0.25"
-# v3.0.25 tag
-SRCREV_pn-${PN} = "9bf176a3e029ae7f2dc6feae185091525a988be2"
+PV = "3.0.28"
+# v3.0.28 tag
+SRCREV_pn-${PN} = "0527fde0639955203ad48a9fd83bd6fc35e82e07"
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
 MACHINE_KERNEL_PR_append = "a"
-- 
1.7.2.5


