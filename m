Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DC53C7EE30
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 15:50:51 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.567.1751385044307129682
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 01 Jul 2025 08:50:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=QUM/ir9W;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 561FogJY3356965;
	Tue, 1 Jul 2025 10:50:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751385042;
	bh=vV9DE/QnokAmd4YzY7rgnVVNUwEkxmxi2q4JRVprLuE=;
	h=From:To:Subject:Date;
	b=QUM/ir9W1jDTzl1Wn6Emdq4yIsosATsELCgM1moXzVLZ9+uyso/V58I3pv9tUUXlc
	 SKH+3JgqEf2qJY1uqqcy4Er7wUqpvoe2hdh5KyAwvqvGK6dWsX9JEXHK8NgeyKWD+M
	 eS8jGdKbPntgd2hHwcui03orJFwvQxDxH7VcB0yY=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 561Fogx33046084
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 1 Jul 2025 10:50:42 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 1
 Jul 2025 10:50:42 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 1 Jul 2025 10:50:42 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 561FogKX1823923;
	Tue, 1 Jul 2025 10:50:42 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uWdFq-0001Rs-9F; Tue, 01 Jul 2025 10:50:42 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH] trusted-firmware-a: Move back to tfa upstream except for am62lxx
Date: Tue, 1 Jul 2025 10:50:42 -0500
Message-ID: <20250701155042.5529-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 01 Jul 2025 15:50:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18746

This moves all of the platforms back to the main TFA repository, but
still points to the TI fork for the am62lxx platform while we continue
to work on upstreaming the needed patches.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../trusted-firmware-a-ti.inc                   | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index c17ac9de..ec52d09c 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -1,12 +1,19 @@
 # NOTE: This .inc file with customizations only gets included for K3 platforms
 
-PV = "2.12+git"
-SRCREV_tfa = "2ab59f45ad0a5d95b5cb339c0f64686954377050"
-SRC_URI_TRUSTED_FIRMWARE_A = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https"
-SRCBRANCH = "ti-master"
+PV = "2.13+git"
+
+LIC_FILES_CHKSUM = "file://docs/license.rst;md5=6ed7bace7b0bc63021c6eba7b524039e"
+SRCREV_tfa = "d90bb650fe4cb3784f62214ab5829f4051c38d0a"
+SRC_URI_TRUSTED_FIRMWARE_A = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https"
+SRCBRANCH = "master"
+
+LIC_FILES_CHKSUM:am62lxx = "file://docs/license.rst;md5=1118e32884721c0be33267bd7ae11130"
+SRCREV_tfa:am62lxx = "2ab59f45ad0a5d95b5cb339c0f64686954377050"
+SRC_URI_TRUSTED_FIRMWARE_A:am62lxx = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https"
+SRCBRANCH:am62lxx = "ti-master"
+
 SRC_URI = "${SRC_URI_TRUSTED_FIRMWARE_A};name=tfa;branch=${SRCBRANCH}"
 
-LIC_FILES_CHKSUM = "file://docs/license.rst;md5=1118e32884721c0be33267bd7ae11130"
 COMPATIBLE_MACHINE = "k3"
 
 TFA_BUILD_TARGET = "all"
-- 
2.17.1


