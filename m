Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3879C76196
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 12:32:11 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.12224.1681216330541705607
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Apr 2023 05:32:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=pp4gfWx9;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33BCW9Ux126255;
	Tue, 11 Apr 2023 07:32:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681216329;
	bh=q5I20y+Y/Dxr9EcmJiJIPCG+1JF1TILtWtuDwGIiCMY=;
	h=From:To:Subject:Date;
	b=pp4gfWx9jO+5Ly+StjdWPfyB9heVspDjBl1ehYyFoq4r5DjZAYZ3FOHNY0dYYILEK
	 H6zESiPWhHaZTp5Fy7yXCA6J+hgIv9RL1K97sesgclOK1Am/5KpqTzLLqCVkmIy4FJ
	 jsAwuhT65xVHpIT6tW5lBiCnteHY+54Q2KGOb6rI=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33BCW9MT107198
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Apr 2023 07:32:09 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 11
 Apr 2023 07:32:09 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 11 Apr 2023 07:32:09 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33BCW9dW032815;
	Tue, 11 Apr 2023 07:32:09 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pmDAP-00008D-1m; Tue, 11 Apr 2023 07:32:09 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2] patches: Add missing Upstream-Status to various patches
Date: Tue, 11 Apr 2023 07:32:09 -0500
Message-ID: <20230411123209.459-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Apr 2023 12:32:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16342

The check-layer command caught that we were missing the Upstream-Status
on a few older patches, and I found a few new ones.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Changed the 0001-ata-ahci-fix-enum-constants-for-gcc-13.patch to
Backport per feedback from Denys.

 ...0001-configs-Update-to-support-oe-core-fitImage-naming.patch | 2 ++
 .../files/0001-ata-ahci-fix-enum-constants-for-gcc-13.patch     | 2 ++
 ...ssemble_info-signature-changes-causes-compile-failures.patch | 2 ++
 .../recipes-ti/ipc/ti-ipc/0001-Add-kernel-build-dir.patch       | 2 ++
 .../wl18xx-fw/0001-Add-Makefile-to-install-firmware-files.patch | 2 ++
 .../0001-print_stat.sh-replace-system-bin-sh-with-bin-sh.patch  | 2 ++
 .../0001-libbfd.h-suppress-GCC9-Wstringop-truncation.patch      | 2 ++
 7 files changed, 14 insertions(+)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging-2021.01/0001-configs-Update-to-support-oe-core-fitImage-naming.patch b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging-2021.01/0001-configs-Update-to-support-oe-core-fitImage-naming.patch
index 9a832312..31c7afc3 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging-2021.01/0001-configs-Update-to-support-oe-core-fitImage-naming.patch
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging-2021.01/0001-configs-Update-to-support-oe-core-fitImage-naming.patch
@@ -7,6 +7,8 @@ In kirkstone and forward, the values in the fitImage have been
 standardized to include both conf- and the vender subdir in the name of
 the dtbs.  This patch updates u-boot to support that.
 
+Upstream-Status: Pending
+
 Signed-off-by: Ryan Eatmon <reatmon@ti.com>
 ---
  include/configs/am62x_evm.h       | 6 +++---
diff --git a/meta-ti-bsp/recipes-kernel/linux/files/0001-ata-ahci-fix-enum-constants-for-gcc-13.patch b/meta-ti-bsp/recipes-kernel/linux/files/0001-ata-ahci-fix-enum-constants-for-gcc-13.patch
index 634b1588..e7e9afc9 100644
--- a/meta-ti-bsp/recipes-kernel/linux/files/0001-ata-ahci-fix-enum-constants-for-gcc-13.patch
+++ b/meta-ti-bsp/recipes-kernel/linux/files/0001-ata-ahci-fix-enum-constants-for-gcc-13.patch
@@ -24,6 +24,8 @@ Fix this by changing the entire enum definition to use BIT(x) in place
 of (1<<x), which results in all values being seen as 'unsigned' and
 fitting into an unsigned 32-bit type.
 
+Upstream-Status: Backport
+
 Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=107917
 Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=107405
 Reported-by: Luis Machado <luis.machado@arm.com>
diff --git a/meta-ti-bsp/recipes-kernel/linux/files/init_disassemble_info-signature-changes-causes-compile-failures.patch b/meta-ti-bsp/recipes-kernel/linux/files/init_disassemble_info-signature-changes-causes-compile-failures.patch
index 33dee03a..e1e04c34 100644
--- a/meta-ti-bsp/recipes-kernel/linux/files/init_disassemble_info-signature-changes-causes-compile-failures.patch
+++ b/meta-ti-bsp/recipes-kernel/linux/files/init_disassemble_info-signature-changes-causes-compile-failures.patch
@@ -4,6 +4,8 @@ kernel we have to "adjust" the patch to match our files.
 
 [A] https://patchwork.yoctoproject.org/project/arm/patch/20220824025819.4888-1-jon.mason@arm.com/#5104
 
+Upstream-Status: Pending
+
 Signed-off-by: Ryan Eatmon <reatmon@ti.com>
 
 
diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc/0001-Add-kernel-build-dir.patch b/meta-ti-bsp/recipes-ti/ipc/ti-ipc/0001-Add-kernel-build-dir.patch
index 71d5b2be..cb178ee6 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-ipc/0001-Add-kernel-build-dir.patch
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-ipc/0001-Add-kernel-build-dir.patch
@@ -7,6 +7,8 @@ We build kernel outside of the source directory and the generated version.h
 file ends up being in a separate directory from the rest of kernel headers.
 Use another variable to point to the kernel build artifacts.
 
+Upstream-Status: Inappropriate [OE-specific]
+
 Signed-off-by: Denys Dmytriyenko <denys@ti.com>
 
 ---
diff --git a/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw/0001-Add-Makefile-to-install-firmware-files.patch b/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw/0001-Add-Makefile-to-install-firmware-files.patch
index a8db0770..bb05c6fe 100644
--- a/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw/0001-Add-Makefile-to-install-firmware-files.patch
+++ b/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw/0001-Add-Makefile-to-install-firmware-files.patch
@@ -3,6 +3,8 @@ From: Denys Dmytriyenko <denys@ti.com>
 Date: Fri, 10 Mar 2017 13:28:29 -0500
 Subject: [PATCH] Add Makefile to install firmware files
 
+Upstream-Status: Pending
+
 Signed-off-by: Denys Dmytriyenko <denys@ti.com>
 ---
  Makefile | 9 +++++++++
diff --git a/meta-ti-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts/0001-print_stat.sh-replace-system-bin-sh-with-bin-sh.patch b/meta-ti-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts/0001-print_stat.sh-replace-system-bin-sh-with-bin-sh.patch
index c0719e34..cde01541 100644
--- a/meta-ti-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts/0001-print_stat.sh-replace-system-bin-sh-with-bin-sh.patch
+++ b/meta-ti-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts/0001-print_stat.sh-replace-system-bin-sh-with-bin-sh.patch
@@ -3,6 +3,8 @@ From: Denys Dmytriyenko <denys@ti.com>
 Date: Fri, 10 Nov 2017 17:02:39 -0500
 Subject: [PATCH] print_stat.sh: replace /system/bin/sh with /bin/sh
 
+Upstream-Status: Pending
+
 Signed-off-by: Denys Dmytriyenko <denys@ti.com>
 ---
  testing/print_stat.sh | 2 +-
diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x/0001-libbfd.h-suppress-GCC9-Wstringop-truncation.patch b/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x/0001-libbfd.h-suppress-GCC9-Wstringop-truncation.patch
index 1cc23b32..e52efa56 100644
--- a/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x/0001-libbfd.h-suppress-GCC9-Wstringop-truncation.patch
+++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x/0001-libbfd.h-suppress-GCC9-Wstringop-truncation.patch
@@ -3,6 +3,8 @@ From: Denys Dmytriyenko <denys@ti.com>
 Date: Sat, 15 Feb 2020 15:59:37 -0500
 Subject: [PATCH] libbfd.h: suppress GCC9 -Wstringop-truncation
 
+Upstream-Status: Inappropriate [OE-specific]
+
 Signed-off-by: Denys Dmytriyenko <denys@ti.com>
 ---
  gdbc6x/bfd/libbfd.h | 4 ++++
-- 
2.17.1


