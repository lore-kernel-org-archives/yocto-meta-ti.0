Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.885.1595611895798746981
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 24 Jul 2020 10:31:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=BN3/Ul55;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: denys@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06OHVZRD004881
	for <meta-ti@lists.yoctoproject.org>; Fri, 24 Jul 2020 12:31:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1595611895;
	bh=C4pd+zpbYVP0hluTtNcVRhVoHjG3W1wWLWNQMqpaW18=;
	h=From:To:CC:Subject:Date;
	b=BN3/Ul55un8eHKLryKuImMCQ/kQbmOMExkHgQhJjmbviKq7MZcGlnkLJSKx6RIb6N
	 I3SLx4t5CWRFcbR7wEwJNomd2iQo9AXhku/nyLJ1LFmbwXvE52VfJPRQQ362ci7Ihe
	 Bz5SEN40sOrl/uM8Lsa1SzsYay2mJwhRIhiifDnA=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06OHVZlc029392
	for <meta-ti@lists.yoctoproject.org>; Fri, 24 Jul 2020 12:31:35 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 24
 Jul 2020 12:31:34 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 24 Jul 2020 12:31:34 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06OHVYIT074219;
	Fri, 24 Jul 2020 12:31:34 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] ti-sci-fw: update 2020.04a -> 2020.06
Date: Fri, 24 Jul 2020 17:31:32 +0000
Message-ID: <20200724173132.18545-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...-sci-fw-source_2020.04a.bb => ti-sci-fw-source_2020.06.bb} | 0
 .../ti-sci-fw/{ti-sci-fw_2020.04a.bb => ti-sci-fw_2020.06.bb} | 0
 .../{ti-sci-fw_2020.04a.inc => ti-sci-fw_2020.06.inc}         | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename recipes-bsp/ti-sci-fw/{ti-sci-fw-source_2020.04a.bb => ti-sci-fw-source_2020.06.bb} (100%)
 rename recipes-bsp/ti-sci-fw/{ti-sci-fw_2020.04a.bb => ti-sci-fw_2020.06.bb} (100%)
 rename recipes-bsp/ti-sci-fw/{ti-sci-fw_2020.04a.inc => ti-sci-fw_2020.06.inc} (79%)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw-source_2020.04a.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw-source_2020.06.bb
similarity index 100%
rename from recipes-bsp/ti-sci-fw/ti-sci-fw-source_2020.04a.bb
rename to recipes-bsp/ti-sci-fw/ti-sci-fw-source_2020.06.bb
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.04a.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.06.bb
similarity index 100%
rename from recipes-bsp/ti-sci-fw/ti-sci-fw_2020.04a.bb
rename to recipes-bsp/ti-sci-fw/ti-sci-fw_2020.06.bb
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.04a.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.06.inc
similarity index 79%
rename from recipes-bsp/ti-sci-fw/ti-sci-fw_2020.04a.inc
rename to recipes-bsp/ti-sci-fw/ti-sci-fw_2020.06.inc
index e785ce01..db2b6027 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.04a.inc
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.06.inc
@@ -3,9 +3,9 @@ SUMMARY = "TI SCI firmware (SYSFW)"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
 
-SRCREV = "c8decf64be551dfd1244cd1d231a97eb2255fb80"
+SRCREV = "dbd8e8801ff20811981bddbb01203d91dc9f4f44"
 BRANCH ?= "ti-linux-firmware"
-SRCREV_imggen = "d9a550b91ec95d06a80f2ccc6dd829815ba35d88"
+SRCREV_imggen = "c0d6e6ebc85d9e7e4e02a7e6364cadf31c6fad0d"
 SRCREV_FORMAT = "imggen"
 
 SRC_URI = " \
-- 
2.17.1

