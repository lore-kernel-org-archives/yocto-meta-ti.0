Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.3010.1619038409294259534
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Apr 2021 13:53:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=chJzFSeN;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13LKrScm079769;
	Wed, 21 Apr 2021 15:53:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1619038408;
	bh=ZTlQJJ8p44HXnNAG/2Zc/qrklRnQ9bxu9bg56xux164=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=chJzFSeNN/kI4XO0B3kFr88rrD3HYWFOMPdvIvObBA6Cv5cOwCZfUskRY74SJdyzq
	 de3l84VF6d9x0DJ0U0y680AZSvD6TDKQyF6zvMgOuhhSU4FCkW01Xop166kqrEegTm
	 A1Rg8Kbt7mwfirdx5XRlu9Ic2cmF9t7te4WsZeKs=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13LKrSid112104
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 21 Apr 2021 15:53:28 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 21
 Apr 2021 15:53:28 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 21 Apr 2021 15:53:28 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13LKrRT3064563;
	Wed, 21 Apr 2021 15:53:27 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Suman Anna <s-anna@ti.com>, Yogesh Siraswar <yogeshs@ti.com>,
        Nishanth Menon
	<nm@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH 4/4] uio-module-drv: Build fix for linux kernel 5.10
Date: Wed, 21 Apr 2021 15:53:26 -0500
Message-ID: <20210421205326.22047-5-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210421205326.22047-1-praneeth@ti.com>
References: <20210421205326.22047-1-praneeth@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

This update contains build fix for linux kernel 5.10
* uio-module-drv: Replace ioremap_nocache with ioremap

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-bsp/uio-module-drv/uio-module-drv.inc |  7 +++-
 ...Replace-ioremap_nocache-with-ioremap.patch | 35 +++++++++++++++++++
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 recipes-bsp/uio-module-drv/uio-module-drv/0001-uio-module-drv-Replace-ioremap_nocache-with-ioremap.patch

diff --git a/recipes-bsp/uio-module-drv/uio-module-drv.inc b/recipes-bsp/uio-module-drv/uio-module-drv.inc
index f483010e..ab1beb9f 100644
--- a/recipes-bsp/uio-module-drv/uio-module-drv.inc
+++ b/recipes-bsp/uio-module-drv/uio-module-drv.inc
@@ -1,3 +1,5 @@
+FILESEXTRAPATHS_prepend:= "${THISDIR}/${PN}:"
+
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2b7c96eb2aed7b0f6f922214dbde9016"
 
@@ -9,7 +11,10 @@ PV = "2.2.1.0+git${SRCPV}"
 
 UIO_MODULE_DRV_GIT_URI = "git://git.ti.com/keystone-linux/uio-module-drv.git"
 UIO_MODULE_DRV_GIT_PROTOCOL = "git"
-SRC_URI = "${UIO_MODULE_DRV_GIT_URI};protocol=${UIO_MODULE_DRV_GIT_PROTOCOL};branch=${BRANCH}"
+SRC_URI = " \
+	${UIO_MODULE_DRV_GIT_URI};protocol=${UIO_MODULE_DRV_GIT_PROTOCOL};branch=${BRANCH} \
+	file://0001-uio-module-drv-Replace-ioremap_nocache-with-ioremap.patch \
+"
 
 SRCREV = "${UIO_MODULE_DRV_SRCREV}"
 
diff --git a/recipes-bsp/uio-module-drv/uio-module-drv/0001-uio-module-drv-Replace-ioremap_nocache-with-ioremap.patch b/recipes-bsp/uio-module-drv/uio-module-drv/0001-uio-module-drv-Replace-ioremap_nocache-with-ioremap.patch
new file mode 100644
index 00000000..955ef558
--- /dev/null
+++ b/recipes-bsp/uio-module-drv/uio-module-drv/0001-uio-module-drv-Replace-ioremap_nocache-with-ioremap.patch
@@ -0,0 +1,35 @@
+From b5c4036dac06817bffd0be21c5fa1b7f75f74e4b Mon Sep 17 00:00:00 2001
+From: Suman Anna <s-anna@ti.com>
+Date: Mon, 19 Apr 2021 13:15:51 -0500
+Subject: [PATCH] uio-module-drv: Replace ioremap_nocache with ioremap
+
+The ioremap_nocache is the same as the regular ioremap and its
+definition has been dropped from the Linux kernel v5.6 onwards in
+commit 4bdc0d676a64 ("remove ioremap_nocache and devm_ioremap_nocache")
+[1]. The uio-module-drv module fails to build against these newer
+kernels, so fix it by simply replacing ioremap_nocache with ioremap.
+
+[1]
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4bdc0d676a643140bdf17dbf7eafedee3d496a3c
+
+Signed-off-by: Suman Anna <s-anna@ti.com>
+---
+ uio_module_drv.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/uio_module_drv.c b/uio_module_drv.c
+index 5a67dd199e21..7cc6005d1f05 100644
+--- a/uio_module_drv.c
++++ b/uio_module_drv.c
+@@ -240,7 +240,7 @@ static ssize_t  uio_module_drv_transfer(struct file *file, char __user *buf,
+ 		return -EINVAL;
+ 	}
+ 
+-	virt_addr_p = ioremap_nocache(phys_addr, count);
++	virt_addr_p = ioremap(phys_addr, count);
+ 	if (!virt_addr_p) {
+ 		dev_err(uio_module_drv->dev, "Mapping of virtual memory failed\n");
+ 		return(-ENOMEM);
+-- 
+2.30.1
+
-- 
2.17.1

