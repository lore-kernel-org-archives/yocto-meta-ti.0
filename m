Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDA62C531DC
	for <webhook@archiver.kernel.org>; Fri, 16 Aug 2024 18:53:16 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.155429.1723834389698090282
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 16 Aug 2024 11:53:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Saybdgag;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47GIr89e090969;
	Fri, 16 Aug 2024 13:53:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1723834388;
	bh=475P3GA5P3l4zNrLkBa2XP9tzUIiZ4mfNA0gVsGMREI=;
	h=From:To:Subject:Date;
	b=SaybdgagC0U+//64z1RyH5fXS5gFcYzEDBB4Z5kdLTi3Hdu09x7qJIk6gtzTfA4Kl
	 c0R/F0MFvuka7KJQfQF+oKwMEHh0mPlZx2HYlsC3MTNQwqXI6wRv+e6K1oLDtTPqmw
	 j+ToNM6WzZvWXH4zfIVUcU37hPLbRZS2vRLye1BY=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47GIr8rL023156
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 16 Aug 2024 13:53:08 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 16
 Aug 2024 13:53:08 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 16 Aug 2024 13:53:08 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47GIr8PH117510;
	Fri, 16 Aug 2024 13:53:08 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sf24R-00047h-T8; Fri, 16 Aug 2024 13:53:07 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH v2] trusted-firmware-a: Update to v2.11 release tag
Date: Fri, 16 Aug 2024 13:53:07 -0500
Message-ID: <20240816185307.15808-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 16 Aug 2024 18:53:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17942

From: Kamlesh Gurudasani <kamlesh@ti.com>

Update to latest release tag, i.e. v2.11.

Also update the LIC_FILES_CHKSUM since the license file changed since
the last SRCREV change.

Commit:
https://git.trustedfirmware.org/TF-A/trusted-firmware-a/+/f2735ebccf5173f74c0458736ec526276106097e

Tag:
https://git.trustedfirmware.org/TF-A/trusted-firmware-a/+/refs/tags/v2.11

Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
Tested-by: Manorit Chawdhry <m-chawdhry@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index 291259c0..157bdbc5 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -1,5 +1,6 @@
-PV:k3 = "2.10+git"
-SRCREV_tfa:k3 = "00f1ec6b8740ccd403e641131e294aabacf2a48b"
+PV:k3 = "2.11+git"
+SRCREV_tfa:k3 = "f2735ebccf5173f74c0458736ec526276106097e"
+LIC_FILES_CHKSUM:k3 = "file://docs/license.rst;md5=b5fbfdeb6855162dded31fadcd5d4dc5"
 SRC_URI:k3 = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa;branch=master"
 COMPATIBLE_MACHINE:k3 = "k3"
 TFA_BUILD_TARGET:k3 = "all"
-- 
2.17.1


