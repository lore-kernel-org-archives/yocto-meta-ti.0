Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f181.google.com (mail-ey0-f181.google.com
	[209.85.215.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 31D4AE0030C
	for <meta-ti@lists.yoctoproject.org>;
	Wed,  7 Dec 2011 00:53:45 -0800 (PST)
Received: by eaal13 with SMTP id l13so289450eaa.26
	for <meta-ti@lists.yoctoproject.org>;
	Wed, 07 Dec 2011 00:53:44 -0800 (PST)
Received: by 10.213.26.137 with SMTP id e9mr282957ebc.89.1323248024236;
	Wed, 07 Dec 2011 00:53:44 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id 49sm3386102eec.1.2011.12.07.00.53.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Dec 2011 00:53:43 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Wed,  7 Dec 2011 09:53:38 +0100
Message-Id: <1323248018-31873-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH] linux-omap 2.6.3[79]: fix SRC_URI after kernel.org changes
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
X-List-Received-Date: Wed, 07 Dec 2011 08:53:46 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-kernel/linux/linux-omap_2.6.37.bb |    2 +-
 recipes-kernel/linux/linux-omap_2.6.39.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-omap_2.6.37.bb b/recipes-kernel/linux/linux-omap_2.6.37.bb
index a79393f..aa7d2fc 100644
--- a/recipes-kernel/linux/linux-omap_2.6.37.bb
+++ b/recipes-kernel/linux/linux-omap_2.6.37.bb
@@ -12,7 +12,7 @@ SRCREV = "fa3b4e23ec20cfc944db7cc2b30b0d82c20e4472"
 
 FILESPATHPKG_prepend = "linux-omap-2.6.37:"
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git;protocol=git \
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git;protocol=git \
 	   file://defconfig"
 
 SRC_URI_append = " \
diff --git a/recipes-kernel/linux/linux-omap_2.6.39.bb b/recipes-kernel/linux/linux-omap_2.6.39.bb
index 3204fbe..34e24e7 100644
--- a/recipes-kernel/linux/linux-omap_2.6.39.bb
+++ b/recipes-kernel/linux/linux-omap_2.6.39.bb
@@ -11,7 +11,7 @@ MACHINE_KERNEL_PR_append = "o"
 
 FILESPATHPKG_prepend = "linux-omap-2.6.39:"
 
-SRC_URI += "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git;protocol=git \
+SRC_URI += "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git;protocol=git \
             file://defconfig"
 
 SRC_URI_append = " \
-- 
1.7.2.5


