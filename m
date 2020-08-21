Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.129806.1597995164856175508
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 21 Aug 2020 00:32:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Piye7Aes;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: lokeshvutla@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07L7WiCl084548
	for <meta-ti@lists.yoctoproject.org>; Fri, 21 Aug 2020 02:32:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1597995164;
	bh=Oyrb7e+v5f/a/W6Jgp4W6LuPtPLocOzEX3TSwZPTIA8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Piye7AesRm7qfyE0DuXcUTmOjETMMY8szjlkBugmkbuwVt6yPveZXgP9j4P3EoMxj
	 YpmWgqQ5HpKp6LVv0wLjNuI8IJRlFBsZyyFBPXuifrI8hw9Srz+VqiJ5ytSj+F/05p
	 UL/FX5ze9xDSNmLG8Pirbn8w7t4poTRn2es9Swdo=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07L7WiFc058857
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 21 Aug 2020 02:32:44 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 21
 Aug 2020 02:32:43 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 21 Aug 2020 02:32:43 -0500
Received: from uda0131933.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07L7Wcah041602;
	Fri, 21 Aug 2020 02:32:41 -0500
From: "Lokesh Vutla" <lokeshvutla@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <denys@ti.com>
CC: Sekhar Nori <nsekhar@ti.com>, <m-erdahl@ti.com>, <m-karicheri2@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH 1/3] prueth-hsr/prp: Update hsr/prp firmwares to latest
Date: Fri, 21 Aug 2020 13:02:36 +0530
Message-ID: <20200821073238.18926-2-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200821073238.18926-1-lokeshvutla@ti.com>
References: <20200821073238.18926-1-lokeshvutla@ti.com>
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
 .../pruhsr-fw/{pruhsr-fw_git.bb => pruhsr-fw_2.15.23.bb}      | 4 +++-
 .../pruprp-fw/{pruprp-fw_git.bb => pruprp-fw_2.15.23.bb}      | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)
 rename recipes-bsp/pruhsr-fw/{pruhsr-fw_git.bb => pruhsr-fw_2.15.23.bb} (93%)
 rename recipes-bsp/pruprp-fw/{pruprp-fw_git.bb => pruprp-fw_2.15.23.bb} (93%)

diff --git a/recipes-bsp/pruhsr-fw/pruhsr-fw_git.bb b/recipes-bsp/pruhsr-fw/pruhsr-fw_2.15.23.bb
similarity index 93%
rename from recipes-bsp/pruhsr-fw/pruhsr-fw_git.bb
rename to recipes-bsp/pruhsr-fw/pruhsr-fw_2.15.23.bb
index 0c7e7148..aebe255e 100644
--- a/recipes-bsp/pruhsr-fw/pruhsr-fw_git.bb
+++ b/recipes-bsp/pruhsr-fw/pruhsr-fw_2.15.23.bb
@@ -7,11 +7,13 @@ PV = "2.15.23"
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
index 046e8dad..e0e36c2d 100644
--- a/recipes-bsp/pruprp-fw/pruprp-fw_git.bb
+++ b/recipes-bsp/pruprp-fw/pruprp-fw_2.15.23.bb
@@ -7,11 +7,13 @@ PV = "2.15.23"
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

