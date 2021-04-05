Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.546.1617595741689127625
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 04 Apr 2021 21:09:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=yIKej7Iw;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: shiju@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 135490ec038698
	for <meta-ti@lists.yoctoproject.org>; Sun, 4 Apr 2021 23:09:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617595740;
	bh=o7IyKpPOdCx8e2TKEWNhHgKZe8r7fOYW0fdVV3zODzk=;
	h=From:To:CC:Subject:Date;
	b=yIKej7IwU9uwHK43n2KGduFxaphQyjeXqZQ0n43eMvImi/xTEByrhygC9IF6qx4eX
	 t+0ggTRiAGZ/1YFugyOW5xOO7Gr87eKNK5bwt/Qw14SIA+Bk4wIzItdKzxe3WQqTSh
	 lRNDslyKFGvxwiKW3VYRLtv5J6rDlczcsvBNKoaY=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 135490WH076343
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Sun, 4 Apr 2021 23:09:00 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Sun, 4 Apr
 2021 23:09:00 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Sun, 4 Apr 2021 23:09:00 -0500
Received: from uda0756868.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13548wx7041524;
	Sun, 4 Apr 2021 23:08:59 -0500
From: "Shiju Sivasankaran" <shiju@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, Shiju Sivasankaran <shiju@ti.com>
Subject: [dunfell/master PATCH] ti-rtos: update metadata and version of am64x rtos firmware
Date: Mon, 5 Apr 2021 09:38:56 +0530
Message-ID: <20210405040856.5154-1-shiju@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

update am64x rtos firmware to keep pinmux and control MMRs
remain unlocked now since linux needs this to be unlock.
this fix the USB and performance degradation issues.

am64xx: 07.03.00.19

Signed-off-by: Shiju Sivasankaran <shiju@ti.com>
---
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 6 +++---
 recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 84dae9a6..e095b7f5 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -23,8 +23,8 @@ DEFAULT_RTOS_FAMILY = "jacinto"
 DEFAULT_RTOS_VERSION = "07_03_00_26"
 DEFAULT_RTOS_VERSION_DOT = "07.03.00.26"
 
-DEFAULT_RTOS_VERSION_am64xx = "07_03_00_18"
-DEFAULT_RTOS_VERSION_DOT_am64xx = "07.03.00.18"
+DEFAULT_RTOS_VERSION_am64xx = "07_03_00_19"
+DEFAULT_RTOS_VERSION_DOT_am64xx = "07.03.00.19"
 
 DEFAULT_RTOS_VERSION_am65xx = "07_03_00_22"
 DEFAULT_RTOS_VERSION_DOT_am65xx = "07.03.00.22"
@@ -51,7 +51,7 @@ DEFAULT_FIRMWARE_SHA256SUM = "unknown"
 DEFAULT_FIRMWARE_SHA256SUM_j7 = "d3fc9fbcfaf67ebd5a509e56ef30e9a54242c290baecfda15e7ff92c127738d0"
 DEFAULT_FIRMWARE_SHA256SUM_j7200-evm = "674040e161cb4b87845fd527dea166a2dd25d0df9136aa6206d73a9240058c40"
 DEFAULT_FIRMWARE_SHA256SUM_am65xx = "61e0be08bea8ab1055645bd96504a6a29c70318c5b277237dee9981cd94d7f79"
-DEFAULT_FIRMWARE_SHA256SUM_am64xx = "1b44bccd20b767568e996e924a2ef18cabd1c3e16d3412629ff72d83b81b152f"
+DEFAULT_FIRMWARE_SHA256SUM_am64xx = "5d1785cbdb91904a5ef3027378061041c59186c4198d7ebcfa660a1ff513d528"
 
 # Use weak assignment for CORESDK_RTOS_* variables to use defaults if not yet set
 CORESDK_RTOS_FAMILY ?= "${DEFAULT_RTOS_FAMILY}"
diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
index c07e932d..9a1659dc 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
@@ -18,7 +18,7 @@ PLAT_SFX_am64xx = "/am64x"
 # Use weak assignment to set defaults to TI_RTOS_METADATA_* variables
 TI_RTOS_METADATA_URI ?= "git://git.ti.com/processor-sdk/coresdk_rtos_releases.git"
 TI_RTOS_METADATA_PROTOCOL ?= "git"
-TI_RTOS_METADATA_SRCREV ?= "12a455643928b9fc22af4d85f2aac7894b80e6a5"
+TI_RTOS_METADATA_SRCREV ?= "d45318854fcc9c664cb9c097afcc6ae08fa82876"
 TI_RTOS_METADATA_BRANCH ?= "master"
 TI_RTOS_METADATA_DIR ?= "${PLAT_SFX}"
 TI_RTOS_METADATA_FILE ?= "${S}${TI_RTOS_METADATA_DIR}/metadata.inc"
-- 
2.17.1

