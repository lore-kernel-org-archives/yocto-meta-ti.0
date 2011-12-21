Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f51.google.com (mail-ww0-f51.google.com [74.125.82.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 15A9AE0137D
	for <meta-ti@lists.yoctoproject.org>;
	Wed, 21 Dec 2011 06:37:54 -0800 (PST)
Received: by wgbdr1 with SMTP id dr1so12676224wgb.8
	for <meta-ti@lists.yoctoproject.org>;
	Wed, 21 Dec 2011 06:37:53 -0800 (PST)
Received: by 10.227.207.206 with SMTP id fz14mr6633443wbb.7.1324478273608;
	Wed, 21 Dec 2011 06:37:53 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id ej17sm6060186wbb.14.2011.12.21.06.37.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Dec 2011 06:37:52 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Wed, 21 Dec 2011 15:37:44 +0100
Message-Id: <1324478264-3285-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH] linux-ti335x-psp 3.1: disable whiteheat firmware to unbreak build with make 3.85
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
X-List-Received-Date: Wed, 21 Dec 2011 14:37:55 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../linux/linux-ti33x-psp-3.1/beaglebone/defconfig |    2 +-
 recipes-kernel/linux/linux-ti33x-psp_3.1.bb        |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.1/beaglebone/defconfig b/recipes-kernel/linux/linux-ti33x-psp-3.1/beaglebone/defconfig
index a762e6f..628f149 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.1/beaglebone/defconfig
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.1/beaglebone/defconfig
@@ -2564,7 +2564,7 @@ CONFIG_USB_SERIAL_AIRCABLE=m
 CONFIG_USB_SERIAL_ARK3116=m
 CONFIG_USB_SERIAL_BELKIN=m
 CONFIG_USB_SERIAL_CH341=m
-CONFIG_USB_SERIAL_WHITEHEAT=m
+# CONFIG_USB_SERIAL_WHITEHEAT is not set
 CONFIG_USB_SERIAL_DIGI_ACCELEPORT=m
 CONFIG_USB_SERIAL_CP210X=m
 CONFIG_USB_SERIAL_CYPRESS_M8=m
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.1.bb b/recipes-kernel/linux/linux-ti33x-psp_3.1.bb
index 029b5c3..f7ec2f8 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.1.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.1.bb
@@ -11,7 +11,7 @@ MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.1-meta-ti-r1r+gitr1d84d8853fa30cf3db2571a5aec572accca4e29d"
 SRCREV = "1d84d8853fa30cf3db2571a5aec572accca4e29d"
-MACHINE_KERNEL_PR_append = "f+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "g+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
-- 
1.7.2.5


