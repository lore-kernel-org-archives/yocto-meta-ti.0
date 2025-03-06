Return-Path: <b-brnich@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA6A7C28B24
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 20:37:53 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.4975.1741293471367464503
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Mar 2025 12:37:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=FWmRNGGj;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: b-brnich@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 526KboJi3750406
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-ti@lists.yoctoproject.org>; Thu, 6 Mar 2025 14:37:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741293470;
	bh=Qsm1JY7pJTsL+XPBNqsHNywVwmmCAeYCBjJzoyFSuWc=;
	h=From:To:CC:Subject:Date;
	b=FWmRNGGjbYTWt4uIk3nLD2AkbU0cSFegCLhOc9wwv5RvYQuslteS3/jsY4tRPN7gC
	 KgU9THeFcK3b7ZV36QsXxjrYdrmXB7ghavoG8qgWWfiA9E0+n6H6zIKRcvAgaYml14
	 o1T+jNFPDSv65BbB6j8Y4WImDb8DgDlbcWvi2qF8=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 526KboQR086185
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 6 Mar 2025 14:37:50 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Mar 2025 14:37:49 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Mar 2025 14:37:50 -0600
Received: from udba0500997.dhcp.ti.com (udba0500997.dhcp.ti.com [128.247.81.249])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 526KbnRK044433;
	Thu, 6 Mar 2025 14:37:49 -0600
From: Brandon Brnich <b-brnich@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Brandon Brnich <b-brnich@ti.com>,
        Darren
 Etheridge <detheridge@ti.com>
Subject: [scarthgap][PATCH 1/2] ti-bsp: ti-img-encode-decode: Add Recipe for Building VXE-VXD Out-of-Tree Module
Date: Thu, 6 Mar 2025 14:37:48 -0600
Message-ID: <20250306203749.794759-1-b-brnich@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 06 Mar 2025 20:37:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18361

During 10.0 LTS bringup, the decision was made that it would be the last LTS
that carried the IMG VXE and VXD driver in tree. Driver is now hosted on
git.ti.com. This recipe is responsible for pulling in the driver,
building it, and packaging it within the J721e SDK.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---

This build was tested by changing the kernel to point towards latest
head that has relevant device tree changes and config options. Build is
successful with those changes and no warnings are present.

 .../ti-vxe-vxd-driver_6.12.bb                 | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb

diff --git a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb
new file mode 100644
index 00000000..fa2d3792
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb
@@ -0,0 +1,23 @@
+DESCRIPTION =  "Kernel drivers for the VXE384 and D5500 Video Accelerators found in the J721E TI SoC"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://README;beginline=11;endline=12;md5=ad10b552e357ac443ec5dd2e02912b1b"
+
+inherit module
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+COMPATIBLE_MACHINE = "j721e"
+
+DEPENDS += "virtual/kernel"
+
+BRANCH = "scarthgap/k${PV}"
+
+SRC_URI = "git://git.ti.com/multimedia/img-vxe-vxd.git;protocol=https;branch=${BRANCH}"
+
+SRCREV = "99d063aa0ef53633057042570411b84bd967624b"
+
+TARGET_PRODUCT:j721e = "j721e_linux"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE += 'KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'
-- 
2.34.1


