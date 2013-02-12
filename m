Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f54.google.com (mail-oa0-f54.google.com
	[209.85.219.54]) (using TLSv1 with cipher RC4-SHA (128/128 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id DDF52E006E9
	for <meta-ti@yoctoproject.org>; Mon, 11 Feb 2013 17:04:58 -0800 (PST)
Received: by mail-oa0-f54.google.com with SMTP id n12so7010236oag.13
	for <meta-ti@yoctoproject.org>; Mon, 11 Feb 2013 17:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=i/S4VcvrT+du1JpBq4pLw/nNWzNOEqH8VyOgrRNwhKY=;
	b=OAXEslfic4yt1jK7TH9Rbms5P11pV9a5orvq0FNzEs0ZFWzCq8r68CwVKmsb95sD7U
	+k1emqUZYQsOzGTyhV/DdHktvNCaZOwqAQoYTsH7mO5j8TrCg624xi7Uj/gUQSRRTquN
	/W2JlBui09m7W2XImo5RA82d3hBH4B3T1lCCygPSE2uZ8ZMJztEblnrO5ocYWyY7XNZF
	B9fSe7VbbsxjDEK+S75xkCkh2WCWfvBIhILN81fRdhBxYy0aYi8SV7ydzekOqVrQqTUZ
	zGqVx3KYObpZovp3Kp2UPG2iKGaprbApkurh4M7cjO7TgLAfPBXwyNZ+jUk8gMxeILLt
	mJyQ==
X-Received: by 10.60.7.129 with SMTP id j1mr12020390oea.54.1360631098102;
	Mon, 11 Feb 2013 17:04:58 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v2sm51155307obl.10.2013.02.11.17.04.56
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 17:04:57 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-ti@yoctoproject.org
Date: Mon, 11 Feb 2013 19:04:40 -0600
Message-Id: <1360631082-29015-5-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1360631082-29015-1-git-send-email-fcooper@ti.com>
References: <1360631082-29015-1-git-send-email-fcooper@ti.com>
Subject: [PATCH 5/7] u-boot_2010.12.12-psp03.21.00.04.sdk: Add latest u-boot recipe for am180x-evm
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
X-List-Received-Date: Tue, 12 Feb 2013 01:04:59 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 ...hange-default-memory-to-not-limit-at-32MB.patch |   34 ++++++++++++++++++++
 .../u-boot/u-boot_2010.12-psp03.21.00.04.sdk.bb    |   29 +++++++++++++++++
 2 files changed, 63 insertions(+), 0 deletions(-)
 create mode 100644 recipes-bsp/u-boot/u-boot-2010.12-psp03.21.00.04.sdk/am180x-evm/0001-da850evm-change-default-memory-to-not-limit-at-32MB.patch
 create mode 100644 recipes-bsp/u-boot/u-boot_2010.12-psp03.21.00.04.sdk.bb

diff --git a/recipes-bsp/u-boot/u-boot-2010.12-psp03.21.00.04.sdk/am180x-evm/0001-da850evm-change-default-memory-to-not-limit-at-32MB.patch b/recipes-bsp/u-boot/u-boot-2010.12-psp03.21.00.04.sdk/am180x-evm/0001-da850evm-change-default-memory-to-not-limit-at-32MB.patch
new file mode 100644
index 0000000..b19575b
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot-2010.12-psp03.21.00.04.sdk/am180x-evm/0001-da850evm-change-default-memory-to-not-limit-at-32MB.patch
@@ -0,0 +1,34 @@
+From df5c87c4e1be1670475eba1187301a2f7a7aca30 Mon Sep 17 00:00:00 2001
+From: Chase Maupin <Chase.Maupin@ti.com>
+Date: Wed, 22 Jun 2011 12:12:09 -0500
+Subject: [PATCH] da850evm: change default memory to not limit at 32MB
+
+* Change the default mem= option passed to the Linux kernel to
+  not limit the memory to 32MB.
+* This change is used by AM devices that do not need to reserve
+  space for the DSP image.  By removing the mem= option we get
+  access to all of the memory on the system.
+* Limiting the memory to 32MB causes out-of-memory errors
+  when running large applications such as web browsers
+
+Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
+---
+ include/configs/da850evm.h |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/include/configs/da850evm.h b/include/configs/da850evm.h
+index 4a1e0af..55badc9 100755
+--- a/include/configs/da850evm.h
++++ b/include/configs/da850evm.h
+@@ -184,7 +184,7 @@
+ #define CONFIG_CMDLINE_TAG
+ #define CONFIG_REVISION_TAG
+ #define CONFIG_SETUP_MEMORY_TAGS
+-#define CONFIG_BOOTARGS		"mem=32M console=ttyS2,115200n8 root=/dev/mmcblk0p2 rw rootwait ip=off"
++#define CONFIG_BOOTARGS		"console=ttyS2,115200n8 root=/dev/mmcblk0p2 rw rootwait ip=off"
+ #define CONFIG_BOOTCOMMAND	"if mmc rescan 0; then if fatload mmc 0 0xc0600000 boot.scr; then source 0xc0600000; else fatload mmc 0 0xc0700000 uImage; bootm c0700000; fi; else sf probe 0; sf read 0xc0700000 0x80000 0x220000; bootm 0xc0700000; fi"
+ #define CONFIG_BOOTDELAY	3
+ 
+-- 
+1.7.0.4
+
diff --git a/recipes-bsp/u-boot/u-boot_2010.12-psp03.21.00.04.sdk.bb b/recipes-bsp/u-boot/u-boot_2010.12-psp03.21.00.04.sdk.bb
new file mode 100644
index 0000000..7652521
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot_2010.12-psp03.21.00.04.sdk.bb
@@ -0,0 +1,29 @@
+# Use the version of u-boot.inc in oe-core not the meta-ti version
+require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
+
+DESCRIPTION = "u-boot bootloader for DaVinci devices"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4c6cde5df68eff615d36789dc18edd3b"
+
+COMPATIBLE_MACHINE = "am180x-evm"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PR = "r0"
+
+SRC_URI = "git://arago-project.org/git/projects/u-boot-davinci.git;protocol=git;branch=${BRANCH}"
+
+# For the am180x we want to enable all the memory on the EVM, but for other
+# devices that use the DSP we do not want this change because that memory
+# is used for the DSP
+SRC_URI_append_am180x-evm = " file://0001-da850evm-change-default-memory-to-not-limit-at-32MB.patch"
+
+BRANCH = "03.21.00.03"
+
+# Use literal tags in SRCREV, when available, instead of commit IDs
+SRCREV = "v2010.12_DAVINCIPSP_03.21.00.04"
+
+S = "${WORKDIR}/git"
+
+UBOOT_SUFFIX = "bin"
-- 
1.7.0.4


