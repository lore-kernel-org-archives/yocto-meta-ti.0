Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2867.1586205431069203245
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 06 Apr 2020 13:37:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7F53940C34;
	Mon,  6 Apr 2020 20:37:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZVIj2aXOljGT; Mon,  6 Apr 2020 20:37:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6E09F40C18;
	Mon,  6 Apr 2020 20:37:09 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id D54F7171901;
	Mon,  6 Apr 2020 16:37:07 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [master][PATCH 6/8] libgles: require gpu machine feature
Date: Mon,  6 Apr 2020 16:37:03 -0400
Message-Id: <1586205425-55562-6-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586205425-55562-1-git-send-email-denis@denix.org>
References: <1586205425-55562-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb | 4 ++++
 recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb       | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
index ce92bb1..dba1701 100644
--- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
+++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
@@ -3,6 +3,10 @@ HOMEPAGE = "http://git.ti.com/graphics/ti-img-rogue-umlibs"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
 
+inherit features_check
+
+REQUIRED_MACHINE_FEATURES = "gpu"
+
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE = "j7-evm"
 
diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
index 8f63aa5..6639ec5 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
@@ -3,6 +3,10 @@ HOMEPAGE = "https://git.ti.com/graphics/omap5-sgx-ddk-um-linux"
 LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://TI-Linux-Graphics-DDK-UM-Manifest.doc;md5=b17390502bc89535c86cfbbae961a2a8"
 
+inherit features_check
+
+REQUIRED_MACHINE_FEATURES = "gpu"
+
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE = "pandaboard|beagleboard|ti33x|ti43x|omap-a15|k3"
 
-- 
2.7.4

