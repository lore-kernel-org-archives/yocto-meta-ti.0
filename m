Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.7677.1623755668601605100
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 15 Jun 2021 04:14:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=M+cVQ9AO;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: nikhil.nd@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id EF11338C070D
	for <meta-ti@yoctoproject.org>; Tue, 15 Jun 2021 11:14:26 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15FBEPmD019153;
	Tue, 15 Jun 2021 06:14:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1623755665;
	bh=jnAHGHWszqSQ4pzX22x5A011CBqoA6yGBjg4+88VVAY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=M+cVQ9AOvwrTMainJT0Vps1qdQ8ujztYSLi9Xe8LgnKqvn8Soxbqetb0LKNu7sz2U
	 FJ/FCF6Q12O4EKrlaryjrCDErLQMprHRp2DuvBFUeiEODbFQbify8X1UYMRq/ww1/q
	 Fy+F7P101pcS3PW2ELOuMw8rGHWps4IWH4pve7RE=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15FBEPun113537
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 15 Jun 2021 06:14:25 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 15
 Jun 2021 06:14:24 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 15 Jun 2021 06:14:24 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15FBD0Gn081387;
	Tue, 15 Jun 2021 06:14:23 -0500
From: "Nikhil Devshatwar" <nikhil.nd@ti.com>
To: <praneeth@ti.com>, <denis@denix.org>, <yogeshs@ti.com>
CC: <meta-ti@yoctoproject.org>, Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [meta-ti][dunfell/master 1/2] recipes-bsp: ivshmem: Remove ivshmem packages
Date: Tue, 15 Jun 2021 16:42:43 +0530
Message-ID: <20210615111244.24807-2-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210615111244.24807-1-nikhil.nd@ti.com>
References: <20210615111244.24807-1-nikhil.nd@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Jailhouse support is dropped for K3 platforms. So the ivshmem
(inter VM shared memory) based UIO driver and test applications
cannot be build and are not required.

Remove the recipes for the same.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 .../ivshmem-uio/ivshmem-uio-driver_git.bb     | 29 -------------------
 .../ivshmem-uio/ivshmem-uio-tests_git.bb      | 23 ---------------
 2 files changed, 52 deletions(-)
 delete mode 100644 recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb
 delete mode 100644 recipes-bsp/ivshmem-uio/ivshmem-uio-tests_git.bb

diff --git a/recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb b/recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb
deleted file mode 100644
index 39a75533..00000000
--- a/recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY =  "Kernel driver for IVSHMEM based UIO driver"
-DESCRIPTION = "Kernel module which registers a UIO (userspace io) device for inter VM shared memory"
-HOMEPAGE = "https://github.com/henning-schild-work/ivshmem-guest-code"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0546a27aad86c83b75ad4ee6133e9d5e"
-
-inherit module
-
-RDEPENDS_${PN} = "jailhouse"
-
-PROTOCOL = "git"
-BRANCH = "jailhouse"
-SRCREV = "f3ad79881bebb6c6068966ee3d265d8034c20492"
-SRC_URI = "git://github.com/henning-schild-work/ivshmem-guest-code.git;protocol=${PROTOCOL};branch=${BRANCH}"
-
-S = "${WORKDIR}/git"
-
-EXTRA_OEMAKE += 'KDIR="${STAGING_KERNEL_DIR}"'
-
-COMPATIBLE_MACHINE = "(ti-soc)"
-
-do_compile_prepend() {
-    cd ${S}/kernel_module/uio
-}
-
-do_install() {
-    install -d ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
-    install -m 644 ${S}/kernel_module/uio/uio_ivshmem.ko ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
-}
diff --git a/recipes-bsp/ivshmem-uio/ivshmem-uio-tests_git.bb b/recipes-bsp/ivshmem-uio/ivshmem-uio-tests_git.bb
deleted file mode 100644
index 997b8c48..00000000
--- a/recipes-bsp/ivshmem-uio/ivshmem-uio-tests_git.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY =  "UIO tests for IVSHMEM based UIO driver"
-DESCRIPTION = "Test programs which use UIO (userspace io) device for inter VM communication"
-HOMEPAGE = "https://github.com/henning-schild-work/ivshmem-guest-code"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/git/COPYING;md5=0546a27aad86c83b75ad4ee6133e9d5e"
-
-inherit cmake
-
-PROTOCOL = "git"
-BRANCH = "jailhouse"
-SRCREV = "f3ad79881bebb6c6068966ee3d265d8034c20492"
-SRC_URI = "git://github.com/henning-schild-work/ivshmem-guest-code.git;protocol=${PROTOCOL};branch=${BRANCH}"
-
-S = "${WORKDIR}/git/uio/tests/Interrupts/VM"
-
-COMPATIBLE_MACHINE = "(ti-soc)"
-OECMAKE_TARGET_COMPILE = "uio_send uio_read"
-
-do_install() {
-    install -d ${D}/${bindir}
-    install -m 755 ${B}/uio_send ${D}/${bindir}/
-    install -m 755 ${B}/uio_read ${D}/${bindir}/
-}
-- 
2.17.1

