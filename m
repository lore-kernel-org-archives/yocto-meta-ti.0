Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A4818E0127D
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 30 Jan 2012 03:04:37 -0800 (PST)
Received: by werb10 with SMTP id b10so3676274wer.26
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 30 Jan 2012 03:04:36 -0800 (PST)
Received: by 10.180.109.198 with SMTP id hu6mr27507542wib.16.1327921476385;
	Mon, 30 Jan 2012 03:04:36 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id dw7sm14759526wib.4.2012.01.30.03.04.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jan 2012 03:04:35 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Mon, 30 Jan 2012 12:04:21 +0100
Message-Id: <1327921461-12570-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH] omap3-sgx-modules 4.05.00.03: add missing quote for 814x machines
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
X-List-Received-Date: Mon, 30 Jan 2012 11:04:38 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../omap3-sgx-modules_4.05.00.03.bb                |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
index 07a79ea..6f8d680 100644
--- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
@@ -25,7 +25,7 @@ export KERNELDIR = "${STAGING_KERNEL_DIR}"
 PACKAGE_STRIP = "no"
 
 TI_PLATFORM_omap3 = "omap3630"
-TI_PLATFORM_ti814x = "ti81xx
+TI_PLATFORM_ti814x = "ti81xx"
 TI_PLATFORM_ti816x = "ti81xx"
 TI_PLATFORM_ti33x = "ti335x"
 
-- 
1.7.2.5


