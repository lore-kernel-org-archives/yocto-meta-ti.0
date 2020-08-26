Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.6079.1598417792355061782
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 25 Aug 2020 21:56:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=H1b8oCk1;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: lokeshvutla@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07Q4uV8e074223
	for <meta-ti@lists.yoctoproject.org>; Tue, 25 Aug 2020 23:56:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1598417791;
	bh=iQwqzuUr5wY/cM+yLxXKA+2uMZA2taC+dGK5jyt3QwI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=H1b8oCk1vhhV/MAI3MUBcE9PBlT7JBii4VBfKZ+hNhZchEKSnqpC73Rxn2SaynXA7
	 W4gxTTuM0fexN6l2/iWybS9xx8n+iiITt1GI9UW/dwFwDKpEozFRmruvNXnhQlFxyU
	 dOGd0VKDrGvqOjDNUNs973gWRfTJwk/PiK/PYf+o=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07Q4uVmT050525
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 25 Aug 2020 23:56:31 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 25
 Aug 2020 23:56:31 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 25 Aug 2020 23:56:31 -0500
Received: from uda0131933.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07Q4uQih093597;
	Tue, 25 Aug 2020 23:56:29 -0500
From: "Lokesh Vutla" <lokeshvutla@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <denys@ti.com>
CC: Sekhar Nori <nsekhar@ti.com>, <m-erdahl@ti.com>, <m-karicheri2@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v2 1/3] prueth-hsr/prp: Update hsr/prp firmwares to latest
Date: Wed, 26 Aug 2020 10:26:23 +0530
Message-ID: <20200826045625.19492-2-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200826045625.19492-1-lokeshvutla@ti.com>
References: <20200826045625.19492-1-lokeshvutla@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Update the hsr/prp firmwares to latest that includes support for
timestamping rx packets. Unfortunately version number is not
incremented for this update.

Also rename the bb file to add PV in it.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 .../pruhsr-fw/{pruhsr-fw_git.bb => pruhsr-fw_2.15.23.bb}     | 5 +++--
 .../pruprp-fw/{pruprp-fw_git.bb => pruprp-fw_2.15.23.bb}     | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)
 rename recipes-bsp/pruhsr-fw/{pruhsr-fw_git.bb => pruhsr-fw_2.15.23.bb} (93%)
 rename recipes-bsp/pruprp-fw/{pruprp-fw_git.bb => pruprp-fw_2.15.23.bb} (93%)

diff --git a/recipes-bsp/pruhsr-fw/pruhsr-fw_git.bb b/recipes-bsp/pruhsr-fw/pruhsr-fw_2.15.23.bb
similarity index 93%
rename from recipes-bsp/pruhsr-fw/pruhsr-fw_git.bb
rename to recipes-bsp/pruhsr-fw/pruhsr-fw_2.15.23.bb
index 0c7e7148..1434363f 100644
--- a/recipes-bsp/pruhsr-fw/pruhsr-fw_git.bb
+++ b/recipes-bsp/pruhsr-fw/pruhsr-fw_2.15.23.bb
@@ -3,15 +3,16 @@ SUMMARY = "PRU HSR firmware for AM335x/AM437x/AM57xx"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
 
-PV = "2.15.23"
 PE = "1"
 PR = "r0"
 
+CLEANBROKEN = "1"
+
 COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "313e20f312a286bc07b97ef9aca70ef3ce96af29"
+SRCREV = "7ba9722b74608ad4472790972917e1205eb3c049"
 BRANCH ?= "ti-linux-firmware"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
diff --git a/recipes-bsp/pruprp-fw/pruprp-fw_git.bb b/recipes-bsp/pruprp-fw/pruprp-fw_2.15.23.bb
similarity index 93%
rename from recipes-bsp/pruprp-fw/pruprp-fw_git.bb
rename to recipes-bsp/pruprp-fw/pruprp-fw_2.15.23.bb
index 046e8dad..da381eb0 100644
--- a/recipes-bsp/pruprp-fw/pruprp-fw_git.bb
+++ b/recipes-bsp/pruprp-fw/pruprp-fw_2.15.23.bb
@@ -3,15 +3,16 @@ SUMMARY = "PRU PRP firmware for AM335x/AM437x/AM57xx"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
 
-PV = "2.15.23"
 PE = "1"
 PR = "r0"
 
+CLEANBROKEN = "1"
+
 COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "313e20f312a286bc07b97ef9aca70ef3ce96af29"
+SRCREV = "7ba9722b74608ad4472790972917e1205eb3c049"
 BRANCH ?= "ti-linux-firmware"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
-- 
2.23.0

