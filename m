Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFFC3C54E55
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 22:17:08 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.10528.1709158618251801632
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 28 Feb 2024 14:16:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=SW3Di8Ju;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41SMGueJ094919;
	Wed, 28 Feb 2024 16:16:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1709158616;
	bh=6mdq0ZSwO6slXt1tyuqKdJQ2Oaz2M7CXPCzXAkYvlvE=;
	h=From:To:Subject:Date;
	b=SW3Di8JuDT0K60o1uMJ/l2FI10ff+5RqvfshUwPfFvPYa5ww87b1o6GPeS/pq8EIw
	 6Q7Ez5/OaQZEZ470pFnCzDYiy3xkGVN8/I+tZR85Fba/JRyuwzb2lvOc4DQE2TeXAn
	 lu3q2NCp4nsT0esK0qFWtkIO7lSuCheFpnQCuiFA=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41SMGupL021893
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 28 Feb 2024 16:16:56 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 28
 Feb 2024 16:16:56 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 28 Feb 2024 16:16:56 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41SMGuji056777;
	Wed, 28 Feb 2024 16:16:56 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1rfSER-00055Q-Si; Wed, 28 Feb 2024 16:16:55 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH 1/2] linux-ti-staging: Update KERNEL_LOCALVERSION
Date: Wed, 28 Feb 2024 16:16:54 -0600
Message-ID: <20240228221655.19511-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 28 Feb 2024 22:17:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17493

The use of KERNEL_LOCALVERSION for controlling the kernel version has
changed recently.  Placing the value of KERNEL_LOCALVERSION in
.scmversion was causing it to duplicate the string in the final version.

Instead, drop KERNEL_LOCALVERSION to just identify that it comes from
TI, and that it is an RT kernel.  Additionally, place the commit sha for
the kernel into the .scmversion file explicitly to be both backward and
forward compatible.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-kernel/linux/linux-ti-staging-rt_6.1.bb    |  2 ++
 meta-ti-bsp/recipes-kernel/linux/setup-defconfig.inc   | 10 +++++-----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
index e78707f4..b7426aff 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
@@ -1,5 +1,7 @@
 require linux-ti-staging_6.1.bb
 
+KERNEL_LOCALVERSION:append = "-rt"
+
 # Look in the generic major.minor directory for files
 # This will have priority over generic non-rt path
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.1:"
diff --git a/meta-ti-bsp/recipes-kernel/linux/setup-defconfig.inc b/meta-ti-bsp/recipes-kernel/linux/setup-defconfig.inc
index df7d9ac8..8da90c79 100644
--- a/meta-ti-bsp/recipes-kernel/linux/setup-defconfig.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/setup-defconfig.inc
@@ -1,6 +1,4 @@
-# KERNEL_LOCALVERSION can be set to add a tag to the end of the
-# kernel version string.  such as the commit id
-KERNEL_LOCALVERSION = "-g${@d.getVar('SRCPV', True).replace('AUTOINC+','')[:10]}"
+KERNEL_LOCALVERSION = "-ti"
 
 # Check the defconfig file and see if it points to an in kernel
 # defconfig that should be used, or if it is a complete config file
@@ -13,8 +11,10 @@ do_configure() {
     # tree config
     cp ${WORKDIR}/defconfig ${B}/.config
 
-    echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
-    echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
+    scm_version=$(printf '%s%s' -g $(git -C ${S} rev-parse --verify HEAD 2>/dev/null | cut -c1-12))
+
+    echo ${scm_version} > ${B}/.scmversion
+    echo ${scm_version} > ${S}/.scmversion
 
     # Zero, when using "tisdk" configs, pass control to defconfig_builder
     config=`cat ${B}/.config | grep use-tisdk-config | cut -d= -f2`
-- 
2.17.1


