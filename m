Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5090DEB64D9
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 07:41:23 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.6061.1686728482661968259
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 Jun 2023 00:41:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Ml2avKLI;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: m-chawdhry@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35E7fLo0018122
	for <meta-ti@lists.yoctoproject.org>; Wed, 14 Jun 2023 02:41:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686728481;
	bh=sXdsKbBnvbubsHEWb2yqyHun+ct/qFoFrjrppnCdvck=;
	h=From:To:CC:Subject:Date;
	b=Ml2avKLIu8PwM++yIo1hvV4SlZ9NALeiRGYdH05PUP/S8jfhp4UPT4LvQ2RZ1q+Fc
	 GSaU4C5HCEn0THEDkNvd2oAm3hP86ZyIxJWrNph9W52CG2qDqH/M7N4Aof0q3l1/1s
	 XiWC1VBVgLzE/FKDbzFdCU61dXwU6Dl9/Ox9ZIiQ=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35E7fL0J025006
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 14 Jun 2023 02:41:21 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 Jun 2023 02:41:21 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 Jun 2023 02:41:21 -0500
Received: from uda0497581.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35E7fIkM025198;
	Wed, 14 Jun 2023 02:41:18 -0500
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Denys Dmytriyenko
	<denys@ti.com>, Udit Kumar <u-kumar1@ti.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Kamlesh Gurudasani
	<kamlesh@ti.com>,
        Manorit Chawdhry <m-chawdhry@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH] conf: machine: include: k3 enable fit signing for uboot
Date: Wed, 14 Jun 2023 13:11:17 +0530
Message-ID: <20230613-b4-internal-core-secdev-fit-v1-1-c344639b5be1@ti.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686728385; l=1627; i=m-chawdhry@ti.com; s=20230417; h=from:subject:message-id; bh=WZ/c0rV/ntE7YzDLc0WId/X4WQ5BgBeJU1MnR/I+r1Y=; b=HV0h+AgjG9LraL/J2VVB4844+kLR+lv407usCH7DkJxjY0EeD/lYuqZwKN5HWjZvebuqxBnBM NTs6bZjMCxDCn+8ixzsLCihYNdE8gegZamVG1mweGmyyhO9tSIhhMZG
X-Developer-Key: i=m-chawdhry@ti.com; a=ed25519; pk=J/YFdaNRtg/0laEMIcsNnCdIcyFQ3oolBqBrCkiyjHo=
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 14 Jun 2023 07:41:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16717

Enables FIT Image signing for K3 platforms

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
---
 meta-ti-bsp/conf/machine/include/k3.inc                  | 7 +++++++
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb | 1 +
 2 files changed, 8 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index f8bfb3dbcafc..eb25fa780407 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -31,6 +31,13 @@ SPL_BINARY = "tispl.bin"
 SPL_BINARYNAME = "tispl.bin"
 UBOOT_SUFFIX = "img"
 
+UBOOT_SIGN_ENABLE = "1"
+UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb"
+UBOOT_SIGN_KEYNAME ?= "custMpk"
+UBOOT_SIGN_KEYDIR ?= "${TI_SECURE_DEV_PKG}/keys"
+FIT_HASH_ALG ?= "sha512"
+FIT_SIGN_ALG ?= "rsa4096"
+
 EXTRA_IMAGEDEPENDS += "virtual/bootloader"
 
 TFA_PLATFORM = "k3"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
index 12ac61d18c6b..3e7e124a80f4 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
@@ -3,6 +3,7 @@ SUMMARY = "Linux kernel for TI devices"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
+inherit ti-secdev
 inherit kernel
 
 require recipes-kernel/linux/setup-defconfig.inc

---
base-commit: 02fb90c7972aa53ad6c3599a161ec62fd91d1efa
change-id: 20230613-b4-internal-core-secdev-fit-027b8db6a112

Best regards,
-- 
Manorit Chawdhry <m-chawdhry@ti.com>


