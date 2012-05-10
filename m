Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B54EFE01421
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 06:45:31 -0700 (PDT)
Received: by wibhm4 with SMTP id hm4so441668wib.11
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 06:45:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=lgmm7jGwLEZTIMmfGTW8jKR1QhtvwT1e53u/RUKksfA=;
	b=gJvyRfIGBGU2t43mGQ4hSbArfKSBnV5sMngVXHxZmfGDVDe7ENg/edASbv2QFKyyxk
	MXbgTiMX4HHXqJvcX5+htM/e9hdzSLFD5qvPhUYq5TAgA1T0IrISPvuvgDz740OSyQup
	wjKDeRDlwAegRQ6FrWyMUDF1NHLjNvrSveU0ttACII4bLhZFzxKSbUrkYmaBMEwtNKkR
	25dJMnM6InHWmDCQ4dA0MHjygi9zKwI63iQs8jQZ2k/vhmzFW7FSCxLFgtHauG2RMZeh
	ZbLpgIJxhWY/vgSPefiGhItGnsY7AxXZKR61TVEhackOkUNOzJD3XtxZoxQfq6QHOMSO
	SDyA==
Received: by 10.180.92.9 with SMTP id ci9mr16277401wib.15.1336657530409;
	Thu, 10 May 2012 06:45:30 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id m4sm3208511wix.0.2012.05.10.06.45.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 May 2012 06:45:29 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Thu, 10 May 2012 15:45:24 +0200
Message-Id: <1336657524-9450-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkkkHgmuzHNIZJtpkerpCkwJv5246bRfbeP89NImnGv/cB1QQpPo4406vA/UkgeY2zWI4Sk
Cc: denys@ti.com
Subject: [PATCH] omap3-sgx-modules, ti-staging.inc, ti-linuxutils: change PACKAGE_STRIP = "no" to the proper INHIBIT_PACKAGE_STRIP = "1"
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
X-List-Received-Date: Thu, 10 May 2012 13:45:32 -0000

PACKAGE_STRIP doesn't exit in oe-core (anymore)

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-bsp/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb |    2 +-
 recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb  |    2 +-
 recipes-ti/includes/ti-staging.inc                           |    2 +-
 recipes-ti/linuxutils/ti-linuxutils.inc                      |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb
index f37299d..0affee1 100644
--- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb
@@ -26,7 +26,7 @@ S = "${WORKDIR}/Graphics_SDK_${SGXPV}/GFX_Linux_KM"
 PVRBUILD = "release"
 export KERNELDIR = "${STAGING_KERNEL_DIR}"
 
-PACKAGE_STRIP = "no"
+INHIBIT_PACKAGE_STRIP = "1"
 
 TI_PLATFORM_omap3 = "omap3630"
 TI_PLATFORM_ti816x = "ti81xx"
diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
index 42a2e9a..31c7d4e 100644
--- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}${TI_BIN_UNPK_WDEXT}/GFX_Linux_KM"
 PVRBUILD = "release"
 export KERNELDIR = "${STAGING_KERNEL_DIR}"
 
-PACKAGE_STRIP = "no"
+INHIBIT_PACKAGE_STRIP = "1"
 
 TI_PLATFORM_omap3 = "omap3630"
 TI_PLATFORM_ti814x = "ti81xx"
diff --git a/recipes-ti/includes/ti-staging.inc b/recipes-ti/includes/ti-staging.inc
index 48ee061..b588805 100644
--- a/recipes-ti/includes/ti-staging.inc
+++ b/recipes-ti/includes/ti-staging.inc
@@ -1,4 +1,4 @@
-PACKAGE_STRIP = "no"
+INHIBIT_PACKAGE_STRIP = "1"
 
 ALLOW_EMPTY_${PN} = "1"
 ALLOW_EMPTY_${PN}-dev = "1"
diff --git a/recipes-ti/linuxutils/ti-linuxutils.inc b/recipes-ti/linuxutils/ti-linuxutils.inc
index 06b254d..dba485b 100644
--- a/recipes-ti/linuxutils/ti-linuxutils.inc
+++ b/recipes-ti/linuxutils/ti-linuxutils.inc
@@ -90,4 +90,4 @@ FILES_ti-irq-module = "/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp/irq*.ko
 FILES_ti-linuxutils-app = "${installdir}/ti-linuxutils-app/*/*"
 
 INSANE_SKIP_ti-linuxutils-app = "True"
-PACKAGE_STRIP = "no"
+INHIBIT_PACKAGE_STRIP = "1"
-- 
1.7.10


