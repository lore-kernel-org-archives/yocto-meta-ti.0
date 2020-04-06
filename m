Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.2747.1586205430003057249
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 06 Apr 2020 13:37:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5A2F340BDF;
	Mon,  6 Apr 2020 20:37:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c_WTumNl6J8C; Mon,  6 Apr 2020 20:37:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1BE3840C1D;
	Mon,  6 Apr 2020 20:37:08 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id C99AB171900;
	Mon,  6 Apr 2020 16:37:07 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [master][PATCH 5/8] powervr-drivers: require gpu machine feature
Date: Mon,  6 Apr 2020 16:37:02 -0400
Message-Id: <1586205425-55562-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586205425-55562-1-git-send-email-denis@denix.org>
References: <1586205425-55562-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb | 4 +++-
 recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb       | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb
index 81f7230..460ff18 100644
--- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb
+++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb
@@ -3,7 +3,9 @@ HOMEPAGE = "http://git.ti.com/graphics/ti-img-rogue-driver"
 LICENSE = "MIT | GPLv2"
 LIC_FILES_CHKSUM = "file://README;beginline=15;endline=20;md5=0403c7dea01a2b8232261e805325fac2"
 
-inherit module
+inherit module features_check
+
+REQUIRED_MACHINE_FEATURES = "gpu"
 
 MACHINE_KERNEL_PR_append = "f"
 PR = "${MACHINE_KERNEL_PR}"
diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
index b44671f..734e780 100644
--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
@@ -3,7 +3,9 @@ HOMEPAGE = "https://git.ti.com/graphics/omap5-sgx-ddk-linux"
 LICENSE = "MIT | GPLv2"
 LIC_FILES_CHKSUM = "file://eurasia_km/README;beginline=13;endline=22;md5=74506d9b8e5edbce66c2747c50fcef12"
 
-inherit module
+inherit module features_check
+
+REQUIRED_MACHINE_FEATURES = "gpu"
 
 COMPATIBLE_MACHINE = "pandaboard|beagleboard|ti33x|ti43x|omap-a15|k3"
 
-- 
2.7.4

