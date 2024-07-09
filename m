Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4089C2BD09
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 12:34:39 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.11924.1720528472046785948
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Jul 2024 05:34:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pmuIZioZ;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: p-bhagat@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 469CYVa8063256
	for <meta-ti@lists.yoctoproject.org>; Tue, 9 Jul 2024 07:34:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1720528471;
	bh=5hZgto9WGeVGBg1l3jcZJXfkrbUr69endM96vqLkJKI=;
	h=From:To:CC:Subject:Date;
	b=pmuIZioZN2EvTcfyuEw85y8kty6YLLl2bgaaTM2fQwsDc4G9zIXPUZBJqu9aaw6nd
	 coueHjC5/Cn8RcitNtdjdUH5/1+kjnfwNYPuWhhf8A4acNP//VWVz4C/EpqGCHsyF3
	 GFAHY+50V8A76O4O1VbO0rmhpTfG+mI7RDV/tXgA=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 469CYV1f087548
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 9 Jul 2024 07:34:31 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 9
 Jul 2024 07:34:31 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 9 Jul 2024 07:34:31 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 469CYUNm118940;
	Tue, 9 Jul 2024 07:34:30 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <c-shilwant@ti.com>, <s-adivi@ti.com>, <khasim@ti.com>, <g-gupta@ti.com>
Subject: [master/scarthgap][PATCH] recipes-ti: jailhouse: Update jailhouse for scarthgap
Date: Tue, 9 Jul 2024 18:03:59 +0530
Message-ID: <20240709123359.3086351-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Jul 2024 12:34:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17844

Update SRCREV for jailhouse which incorporates makefile changes for
scarthgap.
Add ${ARAGO_IMAGE_SUFFIX} so that jailhouse can pick correct inmate
image for RT build.
Skip QA checks for usrmerge and buildpath. This is required to package
jailhouse in image.
Update FILES:${PN}.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../recipes-ti/jailhouse/jailhouse_git.bb     | 20 +++++++++----------
 .../recipes-ti/jailhouse/ti-jailhouse.inc     |  2 +-
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
index 98ec0e9e..32e94dd0 100644
--- a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
+++ b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
@@ -51,11 +51,11 @@ do_install() {
 	install -d ${D}/boot
 	if [ -n "${JH_RAMFS_IMAGE}" ]
 	then
-		if [ -f ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}-${MACHINE}.cpio ]
+		if [ -f ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}${ARAGO_IMAGE_SUFFIX}-${MACHINE}.rootfs.cpio ]
 		then
-			install -m 0644 ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}-${MACHINE}.cpio ${D}/boot
+			install -m 0644 ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}${ARAGO_IMAGE_SUFFIX}-${MACHINE}.rootfs.cpio ${D}/boot
 		else
-			bberror "Could not find JH_RAMFS_IMAGE (${JH_RAMFS_IMAGE}-${MACHINE}.cpio)!"
+			bberror "Could not find JH_RAMFS_IMAGE (${JH_RAMFS_IMAGE}${ARAGO_IMAGE_SUFFIX}-${MACHINE}.rootfs.cpio)!"
 			bberror "Please make sure that \"cpio\" is in IMAGE_FSTYPES."
 		fi
 	fi
@@ -68,7 +68,7 @@ do_install() {
 		./jailhouse-cell-linux -w ${D}${JH_DATADIR}/${JH_INMATE_DTB} \
 			-a ${JH_ARCH} -c "${JH_CMDLINE}" \
 			-d ../configs/${JH_ARCH}/dts/${JH_INMATE_DTB} \
-			-i ${D}/boot/${JH_RAMFS_IMAGE}-${MACHINE}.cpio \
+			-i ${D}/boot/${JH_RAMFS_IMAGE}${ARAGO_IMAGE_SUFFIX}-${MACHINE}.rootfs.cpio \
 			${D}${CELL_DIR}/${JH_LINUX_DEMO_CELL} \
 			${DEPLOY_DIR_IMAGE}/Image \
 			| tr -cd '\11\12\15\40-\176' \
@@ -96,7 +96,8 @@ RDEPENDS:pyjailhouse = "python3-core python3-ctypes python3-fcntl python3-shell"
 
 RRECOMMENDS:${PN} = "${PN}-tools"
 
-INSANE_SKIP:${PN} = "ldflags"
+INSANE_SKIP:${PN} = "ldflags usrmerge"
+INSANE_SKIP:${PN}-dbg = "usrmerge buildpaths"
 
 KERNEL_MODULE_AUTOLOAD += "jailhouse"
 
@@ -117,10 +118,7 @@ python __anonymous () {
 }
 
 FILES:${PN} = " \
-    /boot/* \
-    /usr/libexec \
-    /usr/sbin/* \
-    /usr/libexec/* \
-    /usr/share/* \
-    /lib/firmware/* \
+    /boot \
+    /usr \
+    /lib \
 "
diff --git a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
index 6faf16b8..2831e560 100644
--- a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
+++ b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = " \
 COMPATIBLE_MACHINE = "am62xx|am62pxx"
 TARGET_CC_ARCH += "${LDFLAGS}"
 PV = "0.12+git"
-SRCREV = "603819ef9a771a3c253a141220daab8e61751a43"
+SRCREV = "9b494ddf4bd8845a2c1063352d08a274ef61777b"
 BRANCH = "master"
 SRC_URI = " \
     git://git.ti.com/git/jailhouse/ti-jailhouse.git;protocol=https;branch=${BRANCH} \
-- 
2.34.1


