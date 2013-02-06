Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f54.google.com (mail-oa0-f54.google.com
	[209.85.219.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 69C72E0034C
	for <meta-ti@yoctoproject.org>; Tue,  5 Feb 2013 23:02:01 -0800 (PST)
Received: by mail-oa0-f54.google.com with SMTP id n12so1188041oag.13
	for <meta-ti@yoctoproject.org>; Tue, 05 Feb 2013 23:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=Oqhgr92EYl9xecwrhsKk+B20vcBH09zTLvffCFMudKk=;
	b=QWIhjCytSlc7LvmBpW43F94rhMi2o4jGVjx5zP7mqrkDZB+2TlwmTItET7guqGHvXT
	HvkhYjfeqZJV99qx/G4WJB34txF5GRwAxkboNO4iDOJxY0XAUeKt9Lml7tD5xovICIqu
	MGM5vm3DE3R2/R9R6jhUzSTXYHsfmFldSgmEVBTmDVSU0HcS5MvHFTdVlK0wVNjRwmJO
	cZQORHDMymVS1BZJIuVZ43rA7wjip0p7LbEbcDV7CZ8uEHkN5URVgnTZCQ9opks+ZQ8x
	kycs9zT8zcZ3A2sMgtJLppRuWv4ohHaXyEfz4uUFG7L8ftPSDuj9F37v0DbsSafxcsH0
	xxwA==
X-Received: by 10.60.32.50 with SMTP id f18mr21983106oei.8.1360134120827;
	Tue, 05 Feb 2013 23:02:00 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id j10sm9413146oee.4.2013.02.05.23.01.58
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 05 Feb 2013 23:01:59 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-ti@yoctoproject.org
Date: Wed,  6 Feb 2013 01:01:51 -0600
Message-Id: <1360134111-25800-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] linux-omapl138-psp_2.6.37: Add MACHINE_KERNEL_PR and fix white space issues.
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
X-List-Received-Date: Wed, 06 Feb 2013 07:02:01 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Add MACHINE_KERNEL_PR variable to enable future tweaks to this recipe.
* Convert tabs to whitespaces

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb |   20 +++++++++++---------
 1 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb b/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb
index 5441675..0895e91 100644
--- a/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb
+++ b/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb
@@ -6,6 +6,8 @@ KERNEL_IMAGETYPE = "uImage"
 require multi-kernel.inc
 require tipspkernel.inc
 
+MACHINE_KERNEL_PR_append = "a+gitr${SRCREV}"
+
 S = "${WORKDIR}/git"
 
 MULTI_CONFIG_BASE_SUFFIX = ""
@@ -16,14 +18,14 @@ SRCREV = "v2.6.37_DAVINCIPSP_03.21.00.04"
 COMPATIBLE_MACHINE = "(omapl138)"
 
 SRC_URI += "git://arago-project.org/git/projects/linux-davinci.git;protocol=git;branch=${BRANCH} \
-	file://defconfig"
+    file://defconfig"
 
 PATCHES_OVER_PSP = " \
-	file://0001-TI-WL12xx-MMC-patches-03.21.00.04.patch \
-	file://0002-da850-Set-maximum-OPP-frequency-to-456MHz.patch \
-	file://0003-AM18xx-WL1271-Enable-BT.patch \
-	file://0004-PSP03.21.00.04.sdk-activate-wireless-extensions.patch \
-	file://0005-Davinci-da850-Add-Mistral-WL12XX-config-support-to.patch \
-	file://0006-Add-wlan-and-BT-config-switches.patch \
-	file://uio_pruss.patch \
-	"
+    file://0001-TI-WL12xx-MMC-patches-03.21.00.04.patch \
+    file://0002-da850-Set-maximum-OPP-frequency-to-456MHz.patch \
+    file://0003-AM18xx-WL1271-Enable-BT.patch \
+    file://0004-PSP03.21.00.04.sdk-activate-wireless-extensions.patch \
+    file://0005-Davinci-da850-Add-Mistral-WL12XX-config-support-to.patch \
+    file://0006-Add-wlan-and-BT-config-switches.patch \
+    file://uio_pruss.patch \
+"
-- 
1.7.0.4


