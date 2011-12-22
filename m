Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D15A4E005A3
	for <meta-ti@lists.yoctoproject.org>;
	Thu, 22 Dec 2011 00:40:38 -0800 (PST)
Received: by werm12 with SMTP id m12so3964337wer.26
	for <meta-ti@lists.yoctoproject.org>;
	Thu, 22 Dec 2011 00:40:37 -0800 (PST)
Received: by 10.216.136.70 with SMTP id v48mr5358296wei.48.1324543236646;
	Thu, 22 Dec 2011 00:40:36 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id d17sm8828774wbh.19.2011.12.22.00.40.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Dec 2011 00:40:35 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Thu, 22 Dec 2011 09:40:30 +0100
Message-Id: <1324543230-17994-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH] ti-linuxutils: fix LICENSE syntax
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
X-List-Received-Date: Thu, 22 Dec 2011 08:40:39 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-ti/linuxutils/ti-linuxutils.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/linuxutils/ti-linuxutils.inc b/recipes-ti/linuxutils/ti-linuxutils.inc
index 0c0ebe3..d6cd18c 100644
--- a/recipes-ti/linuxutils/ti-linuxutils.inc
+++ b/recipes-ti/linuxutils/ti-linuxutils.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "MFP Linux utils for TI ARM/DSP processors"
 SECTION = "devel"
-LICENSE = "GPLv2,BSD"
+LICENSE = "GPLv2 & BSD"
 
 BASE_SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/linuxutils/${PV}/exports"
 SRC_URI = "${BASE_SRC_URI}/linuxutils_${PV}.tar.gz "
@@ -15,7 +15,7 @@ require recipes-ti/includes/ti-staging.inc
 PR = "${MACHINE_KERNEL_PR}"
 
 #This is a kernel module, don't set PR directly
-MACHINE_KERNEL_PR_append = "d"
+MACHINE_KERNEL_PR_append = "e"
 
 inherit module
 
-- 
1.7.2.5


