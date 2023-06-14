Return-Path: <devarsht@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23233EB64DC
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 14:33:16 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.13952.1686753190913188256
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 Jun 2023 07:33:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=fbGG2rjZ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: devarsht@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35EEX98s020743;
	Wed, 14 Jun 2023 09:33:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686753189;
	bh=mJFLJg33onll1CrDOrIt7gN3oHqE9PmuJT61Pbuzl9w=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=fbGG2rjZnPPyzoY2kluZgYlFazfdb7oagf9pKclHKZjToGwKqNxBl7zOhpjjGBgPN
	 kqaWAnvpv9hSf4mWFYi2H/t2MY/c8vd+aB6uyDXex5foqkDXCe0QXiKann/VxIz0FQ
	 Yh1zS3sRYr0YZlu0qy+BQrs1Lpid5tLMFRI5QJXs=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35EEX8H1098743
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 Jun 2023 09:33:09 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 Jun 2023 09:33:08 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 Jun 2023 09:33:08 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35EEX7Bh124843;
	Wed, 14 Jun 2023 09:33:08 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>,
        <denys@konsulko.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <khasim@ti.com>, <nsekhar@ti.com>, <afd@ti.com>, <rs@ti.com>,
        <n-jain1@ti.com>, <devarsht@ti.com>
Subject: [meta-ti] [kirkstone] [PATCH v2 1/2] u-boot-ti-staging_2023.04: Copy bitmap file to boot partition for AM62x
Date: Wed, 14 Jun 2023 20:03:05 +0530
Message-ID: <20230614143306.1502763-2-devarsht@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230614143306.1502763-1-devarsht@ti.com>
References: <20230614143306.1502763-1-devarsht@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 14 Jun 2023 14:33:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16719

Early splash screen support for AM62x has been enabled in u-boot
and it requires bitmap tarball to be present in boot partition
as per the default environment settings done in u-boot [1].

Copy the ti logo bitmap tarball to boot partition of wic image in order
to enable out of box early display on AM62x.

[1] https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/board/ti/am62x/am62x.env

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
V2: Rename ti logo tarball as per suggested changes (same is being
    done in ti-u-boot too)
---
 .../recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb      | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
index e6da84cb..c948e1ed 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
@@ -8,3 +8,12 @@ BRANCH = "ti-u-boot-2023.04"
 
 SRCREV = "1f510931dcc90e6f28f7fed757ad5000d4382e22"
 
+do_install:append:am62xx() {
+	install -d ${D}/boot
+	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${D}/boot
+}
+
+do_deploy:append:am62xx() {
+	install -d ${DEPLOYDIR}
+	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${DEPLOYDIR}
+}
-- 
2.34.1


