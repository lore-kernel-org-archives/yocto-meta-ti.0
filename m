Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1D3FC7EE30
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 18:30:17 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.4621.1751394613235083091
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 01 Jul 2025 11:30:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pNZR4eqv;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 561IUB4V3713271;
	Tue, 1 Jul 2025 13:30:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751394611;
	bh=hgao2k9TS5hB47N/i4JqZgPvLhS6eeO7usxZPdIZUBQ=;
	h=From:To:Subject:Date;
	b=pNZR4eqv1J/uHJSrx/z4MuRIGIdZ1avA7AnfQiM3LzHq6pUFObp8+npGMlU36Zz8h
	 jdGDOdQ9EPd3yMQ2Gic0yN5a+0d1+IuyQN5nPJsYmHdEivbspwgaRUVT1+rmoKow+5
	 fzNB1zj96UnahBIy04w4E3FnXkfZU99OGavxBqfc=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 561IUBaa3158959
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 1 Jul 2025 13:30:11 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 1
 Jul 2025 13:30:11 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 1 Jul 2025 13:30:11 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 561IUBT41760380;
	Tue, 1 Jul 2025 13:30:11 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uWfkB-0003K6-80; Tue, 01 Jul 2025 13:30:11 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH v2] trusted-firmware-a: Move back to tfa upstream except for am62lxx
Date: Tue, 1 Jul 2025 13:30:11 -0500
Message-ID: <20250701183011.12735-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 01 Jul 2025 18:30:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18752

This moves all of the platforms back to the main TFA repository, but
still points to the TI fork for the am62lxx platform while we continue
to work on upstreaming the needed patches.

With the the split into two repositories on two branches we need to also
split the LIC_FILES_CHECKSUM into two since the license.rst file is
slightly different between the two branches.  The upstream master
version is newer than the current am62l version.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Add blurb about LIC_FILES_CHKSUM change.

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


