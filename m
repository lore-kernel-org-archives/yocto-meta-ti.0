Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 191B3C77B7A
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 14:47:10 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.378.1686062825154762331
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 07:47:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=PGWDqt7p;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: p-bhagat@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 356El4se101869
	for <meta-ti@lists.yoctoproject.org>; Tue, 6 Jun 2023 09:47:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686062824;
	bh=e9H5RqZ5HVJV/6XHx5Fsn3CijTn7Bbad81Pp+JEIeU8=;
	h=From:To:CC:Subject:Date;
	b=PGWDqt7powjBcP2ISUj2+BF2ssWpTtY78aOWvQbs8Z6/+TWpKGUVWipfRETPaU3EE
	 3KfPtQ9m+sR4AKiitq6IOHmT9HqJ+GRIPZUYfWwlJ0z1AkmBNAYid98yb8ULYEjVpj
	 J4vxsHBKVNssEm1TkvjFsCrMkAsSGkQ+PtoLuoms=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 356El3vC055729
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 6 Jun 2023 09:47:03 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Jun 2023 09:47:02 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Jun 2023 09:47:03 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 356El2H6010902;
	Tue, 6 Jun 2023 09:47:02 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <c-shilwant@ti.com>, <s-adivi@ti.com>, <khasim@ti.com>, <g-gupta@ti.com>
Subject: [kirkstone][PATCH v3] Add linux-ti-extras, u-boot-ti-extras recipe and make jailhouse recipe depend on MACHINE_FEATURES.
Date: Tue, 6 Jun 2023 20:16:26 +0530
Message-ID: <20230606144626.181511-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 06 Jun 2023 14:47:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16675

Add new recipe for u-boot-ti-extras and linux-ti-extras which will fetch
processor-sdk/uboot and processor-sdk/linux respectively. This recipes,
presently will only be used for jailhouse by changing BRANCH and
SRCREV to jailhouse branch via MACHINE_FEATURES.

In future, if a new feature is hosted in a separate branch, only BRANCH and
SRCREV needs to be changed to respective feature branch in this recipe itself.

Also going forward make jailhouse recipe depend on machine_feature variable.
jailhouse recipe will only be build if MACHINE_FEATURES include jailhouse.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-extras.bb   |  9 +++++++++
 meta-ti-bsp/recipes-kernel/linux/linux-ti-extras.bb  | 10 ++++++++++
 meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb |  2 ++
 3 files changed, 21 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-extras.bb
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-extras.bb

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-extras.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-extras.bb
new file mode 100644
index 00000000..dcd5aea2
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-extras.bb
@@ -0,0 +1,9 @@
+require u-boot-ti-staging_2023.04.bb
+
+# This will have priority over generic uboot path
+
+BRANCH = "${@bb.utils.contains('MACHINE_FEATURES','jailhouse','ti-u-boot-2023.04-jailhouse','ti-u-boot-2023.04',d)}"
+
+SRCREV = "${@bb.utils.contains('MACHINE_FEATURES','jailhouse','79615e1c99b9aa73948f811f5f866cff2e34dc37','010afc1fe7a1412f92363c8af69c848d76a53e42',d)}"
+
+UBOOT_GIT_URI = "git://git.ti.com/git/processor-sdk/u-boot.git"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-extras.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-extras.bb
new file mode 100644
index 00000000..fe0a431d
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-extras.bb
@@ -0,0 +1,10 @@
+require linux-ti-staging_6.1.bb
+
+# Use different commit, repo and branch for jailhouse build
+# This will have priority over generic rt path
+
+BRANCH = "${@bb.utils.contains('MACHINE_FEATURES','jailhouse','ti-linux-6.1.y-jailhouse','ti-linux-6.1.y',d)}"
+
+SRCREV = "${@bb.utils.contains('MACHINE_FEATURES','jailhouse','0ed0dec2462b805b0188fe080895adc437871549','30bcc25e7cb1b25667db88d61828728f0f0b5f4b',d)}"
+
+KERNEL_GIT_URI = "git://git.ti.com/git/processor-sdk/linux.git"
diff --git a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
index 05cc21b3..4336c487 100644
--- a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
+++ b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
@@ -10,6 +10,8 @@ LIC_FILES_CHKSUM = " \
     file://COPYING;md5=9fa7f895f96bde2d47fd5b7d95b6ba4d \
 "
 
+REQUIRED_MACHINE_FEATURES = "jailhouse"
+
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 PV = "0.12+git${SRCPV}"
-- 
2.34.1


