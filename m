Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4C409E006D9
	for <meta-ti@yoctoproject.org>; Fri, 22 Nov 2013 06:58:50 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAMEwnuf011718
	for <meta-ti@yoctoproject.org>; Fri, 22 Nov 2013 08:58:49 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAMEwn85023610
	for <meta-ti@yoctoproject.org>; Fri, 22 Nov 2013 08:58:49 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 22 Nov 2013 08:58:49 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAMEwfgZ019338;
	Fri, 22 Nov 2013 08:58:47 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 22 Nov 2013 10:00:47 -0600
Message-ID: <1385136047-15830-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1385136047-15830-1-git-send-email-fcooper@ti.com>
References: <1385136047-15830-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] machine config: Use Graphics SDK 05.00.00.01 by default on AM335x and AM43x
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
X-List-Received-Date: Fri, 22 Nov 2013 14:58:53 -0000
Content-Type: text/plain

* The latest Graphics SDK is required for the 3.12 kernel being used by AM335x
  and AM43x machines.
* Set the preferred version to insure that the proper version of the graphics
  sdk is being used.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 conf/machine/include/ti33x.inc |    3 +++
 conf/machine/include/ti43x.inc |    3 +++
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index af340d2..8cdf580 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -23,6 +23,9 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 
+PREFERRED_VERSION_libgles-omap3 = "5.00.00.01"
+PREFERRED_VERSION_omap3-sgx-modules = "5.00.00.01"
+
 KERNEL_IMAGETYPE = "zImage"
 
 UBOOT_ARCH = "arm"
diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.inc
index d9bfd25..948fd99 100644
--- a/conf/machine/include/ti43x.inc
+++ b/conf/machine/include/ti43x.inc
@@ -23,6 +23,9 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 
+PREFERRED_VERSION_libgles-omap3 = "5.00.00.01"
+PREFERRED_VERSION_omap3-sgx-modules = "5.00.00.01"
+
 KERNEL_IMAGETYPE = "zImage"
 
 UBOOT_ARCH = "arm"
-- 
1.7.0.4


