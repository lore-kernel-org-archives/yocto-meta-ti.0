Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD280C5478C
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 22:17:08 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.10530.1709158618529065593
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 28 Feb 2024 14:16:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=L0j13W69;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41SMGu1c094923;
	Wed, 28 Feb 2024 16:16:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1709158616;
	bh=TlFVH5AT6+beyzZ5oTCzzkgJ78xEXUubjxDs3YdzeC4=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=L0j13W69QhX0jsUPgXGijo6qYdyqtwOmei8RXBdNUVHMAuB0jwZdYY4yf4Ep+F135
	 6wMqB3OugG5P4a65n5ekN3oDMELSh8iGk0gXCM2YkhVtXHVeAdqsapEXUdHobS7TwI
	 +Zbmi7RUDCOEZXGsvgquy9FQwtgOpD0nPczffs1o=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41SMGukq021773
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 28 Feb 2024 16:16:56 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 28
 Feb 2024 16:16:56 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 28 Feb 2024 16:16:56 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41SMGuvq127990;
	Wed, 28 Feb 2024 16:16:56 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1rfSES-00055S-0L; Wed, 28 Feb 2024 16:16:56 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH 2/2] u-boot-ti: Change from UBOOT_LOCALVERSION and SRCPV
Date: Wed, 28 Feb 2024 16:16:55 -0600
Message-ID: <20240228221655.19511-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240228221655.19511-1-reatmon@ti.com>
References: <20240228221655.19511-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 28 Feb 2024 22:17:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17494

Stop using UBOOT_LOCALVERSION, and copy what is done in the kernel recipe.  This
allows us to set the correct SHA into the version string even if AUTOREV is used
since SRCPV is no longer set in oe-core.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index 855307d9..2c0d4fc4 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -1,6 +1,9 @@
-# UBOOT_LOCALVERSION can be set to add a tag to the end of the
-# U-boot version string.  such as the commit id
-UBOOT_LOCALVERSION = "-g${@d.getVar('SRCPV', True).replace('AUTOINC+','')[:10]}"
+do_compile:prepend () {
+    scm_version=$(printf '%s%s' -ti-g $(git -C ${S} rev-parse --verify HEAD 2>/dev/null | cut -c1-12))
+
+    echo ${scm_version} > ${B}/.scmversion
+    echo ${scm_version} > ${S}/.scmversion
+}
 
 UBOOT_SUFFIX ?= "img"
 SPL_BINARY ?= "MLO"
-- 
2.17.1


