Return-Path: <raj.khem@gmail.com>
Received: from mail-iy0-f176.google.com (mail-iy0-f176.google.com
	[209.85.210.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2C7E0E00599
	for <meta-ti@yoctoproject.org>; Wed, 18 Jan 2012 19:30:54 -0800 (PST)
Received: by iagj37 with SMTP id j37so13391682iag.35
	for <meta-ti@yoctoproject.org>; Wed, 18 Jan 2012 19:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=qzyfmsa3qZW4+dlC+J6Ku9Q3tQnmkXL/N2iFM3gdylM=;
	b=HFQzH3/RMzsLPV8A3D+YyBqI1z6XTY6zT+dYr82LFNSlGpEhy8LrBqzgWCg9pdafCu
	abSto9nzzReeU7WOYWhbF/jzv9QdoAtsimdGnT3eSFTtaPqOd9U7HETyfpya+l+pb5JO
	bJW9mK6E4ZyDzfeoufDRsbXsOAv3TS/qUF9lM=
Received: by 10.42.156.137 with SMTP id z9mr4644889icw.28.1326943853544;
	Wed, 18 Jan 2012 19:30:53 -0800 (PST)
Received: from leto.gateway.2wire.net
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id py9sm47954336igc.2.2012.01.18.19.30.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jan 2012 19:30:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Wed, 18 Jan 2012 19:30:43 -0800
Message-Id: <1326943843-13114-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.8.3
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH V2] linux-3.0: Fix perf compile failure with eglibc 2.15
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
X-List-Received-Date: Thu, 19 Jan 2012 03:30:54 -0000

There is a conflict with eglibc headers since
new headers added the defines that compiler.h
was redefining without undefining them

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Undef-before-redefining-__attribute_const.patch |   31 ++++++++++++++++++++
 recipes-kernel/linux/linux-3.0/patch.sh            |    2 +-
 recipes-kernel/linux/linux_3.0.bb                  |    4 ++-
 3 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-3.0/misc/0001-compiler.h-Undef-before-redefining-__attribute_const.patch

diff --git a/recipes-kernel/linux/linux-3.0/misc/0001-compiler.h-Undef-before-redefining-__attribute_const.patch b/recipes-kernel/linux/linux-3.0/misc/0001-compiler.h-Undef-before-redefining-__attribute_const.patch
new file mode 100644
index 0000000..bf2f6e7
--- /dev/null
+++ b/recipes-kernel/linux/linux-3.0/misc/0001-compiler.h-Undef-before-redefining-__attribute_const.patch
@@ -0,0 +1,31 @@
+From 6f92ab6de9d8daeb575949bbbcbc7bcdcebc60af Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 5 Jan 2012 11:42:35 -0800
+Subject: [PATCH] compiler.h: Undef before redefining __attribute_const__
+
+This is required to avoid warnings like
+util/include/linux/compiler.h:8:0: error: "__attribute_const__" redefined [-Werror]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+
+---
+ tools/perf/util/include/linux/compiler.h |    4 +++-
+ 1 files changed, 3 insertions(+), 1 deletions(-)
+
+--- a/tools/perf/util/include/linux/compiler.h
++++ b/tools/perf/util/include/linux/compiler.h
+@@ -4,9 +4,11 @@
+ #ifndef __always_inline
+ #define __always_inline	inline
+ #endif
++#undef __user
+ #define __user
++#undef __attribute_const__
+ #define __attribute_const__
+-
++#undef __used
+ #define __used		__attribute__((__unused__))
+ 
+ #endif
diff --git a/recipes-kernel/linux/linux-3.0/patch.sh b/recipes-kernel/linux/linux-3.0/patch.sh
index 885db09..dc19a9e 100755
--- a/recipes-kernel/linux/linux-3.0/patch.sh
+++ b/recipes-kernel/linux/linux-3.0/patch.sh
@@ -13,7 +13,7 @@ git reset --hard ${TAG}
 rm export -rf
 
 previous=${TAG}
-PATCHSET="pm-wip/voltdm pm-wip/cpufreq beagle madc sakoman sgx ulcd omap4"
+PATCHSET="pm-wip/voltdm pm-wip/cpufreq beagle madc sakoman sgx ulcd omap4 misc"
 
 # apply patches
 for patchset in ${PATCHSET} ; do
diff --git a/recipes-kernel/linux/linux_3.0.bb b/recipes-kernel/linux/linux_3.0.bb
index 2796304..70ca7cc 100644
--- a/recipes-kernel/linux/linux_3.0.bb
+++ b/recipes-kernel/linux/linux_3.0.bb
@@ -10,7 +10,7 @@ PV = "3.0.17"
 SRCREV_pn-${PN} = "e9d23be2708477feeaec78e707c80441520c1ef6"
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 
 FILESPATH =. "${FILE_DIRNAME}/linux-3.0:${FILE_DIRNAME}/linux-3.0/${MACHINE}:"
 
@@ -221,6 +221,8 @@ SRC_URI += "git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.gi
             \
             file://omap4/0001-OMAP-Fix-linking-error-in-twl-common.c-for-OMAP2-3-4.patch \
             \
+            file://misc/0001-compiler.h-Undef-before-redefining-__attribute_const.patch \
+            \
             file://defconfig"
 
 SRC_URI_append_beagleboard = " file://logo_linux_clut224.ppm \
-- 
1.7.8.3


