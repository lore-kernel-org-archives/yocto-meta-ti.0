Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.8726.1619073448433277710
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Apr 2021 23:37:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=nkfXubsl;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13M6bRiq018837;
	Thu, 22 Apr 2021 01:37:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1619073447;
	bh=S162xThjq4wbD2qgjb6D2zLXeKk7f1VrD6ECDqbJJUY=;
	h=From:To:CC:Subject:Date;
	b=nkfXubslN0N4jmamd2Eu8/EOcVXsBrBFrM/bCcsivqOna7yGdqQpMwlmxTEQvb/I3
	 PwzQdyXDTrdiTxZ27eAbwxPHh2JL6B4eet3W8B7udpYTzvlxKIAdsCAuxlg4fjn6FA
	 hPN7WRri2GyfAVmzN/qLyE63mvoH3f+XNVHAYnjc=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13M6bReJ065762
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 22 Apr 2021 01:37:27 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 22
 Apr 2021 01:37:27 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 22 Apr 2021 01:37:27 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13M6bRvo088685;
	Thu, 22 Apr 2021 01:37:27 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Gowtham Tammana <g-tammana@ti.com>, Suman Anna <s-anna@ti.com>,
        Yogesh
 Siraswar <yogeshs@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH v2] uio-module-drv: Build fix for linux kernel 5.10
Date: Thu, 22 Apr 2021 01:37:22 -0500
Message-ID: <20210422063722.19732-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

This update contains build fix for linux kernel 5.10
* uio-module-drv: Replace ioremap_nocache with ioremap

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 ...Replace-ioremap_nocache-with-ioremap.patch | 35 +++++++++++++++++++
 .../uio-module-drv/uio-module-drv_git.bb      |  4 +++
 2 files changed, 39 insertions(+)
 create mode 100644 recipes-bsp/uio-module-drv/uio-module-drv/0001-uio-module-drv-Replace-ioremap_nocache-with-ioremap.patch

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
diff --git a/recipes-bsp/uio-module-drv/uio-module-drv_git.bb b/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
index 6ac91875..cb61305f 100644
--- a/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
+++ b/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
@@ -2,6 +2,10 @@ DESCRIPTION = "User space IO (UIO) driver for on-chip modules"
 
 include uio-module-drv.inc
 
+FILESEXTRAPATHS_prepend:= "${THISDIR}/${PN}:"
+
+SRC_URI += "file://0001-uio-module-drv-Replace-ioremap_nocache-with-ioremap.patch"
+
 # This package builds a kernel module, use kernel PR as base and append a local
 MACHINE_KERNEL_PR_append = "d"
 PR = "${MACHINE_KERNEL_PR}"
-- 
2.17.1

