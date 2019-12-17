Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.445.1576609413474810653
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Dec 2019 11:03:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=QZdw3u5W;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: j-stiffler@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBHJ3Wkg101844
	for <meta-ti@lists.yoctoproject.org>; Tue, 17 Dec 2019 13:03:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576609412;
	bh=wUHNrMhuyupoTaiiGOyyH27UqLHNXENpJml9MZs/y2Q=;
	h=From:To:CC:Subject:Date;
	b=QZdw3u5WZ+O4bjyVZxdsWJGu31cPpm8si8JGcnnCPPCSQu0JloMHI4UaKYScaQNDW
	 t80OC/drbt+UnkmfjAiF+sp047S5S1ArtXsf0pFI5GW0/FE8puQRUCcGTC1a33DBQO
	 Cu2/gnAQa0wO6CSRtvIFsM7o2ySZrIuzGQTXzDPA=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBHJ3Wlk078854
	for <meta-ti@lists.yoctoproject.org>; Tue, 17 Dec 2019 13:03:32 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 17
 Dec 2019 13:03:32 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 17 Dec 2019 13:03:32 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBHJ3Vqd010984;
	Tue, 17 Dec 2019 13:03:32 -0600
From: "Jacob Stiffler" <j-stiffler@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <m-radhakrishnan2@ti.com>, Jacob Stiffler <j-stiffler@ti.com>
Subject: [master/thud/ti2019.05][PATCH v2 2/3] ti-pdk-fetch: bump SRCREV for Processor SDK 6.2
Date: Tue, 17 Dec 2019 13:44:26 -0500
Message-ID: <1576608267-22695-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2 changes:
* Use correct branch: release/PROCESSOR-SDK_06.02.00

 classes/ti-pdk-fetch.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass
index e7f8875..ac3b154 100644
--- a/classes/ti-pdk-fetch.bbclass
+++ b/classes/ti-pdk-fetch.bbclass
@@ -1,9 +1,9 @@
 TI_PDK_GIT_URI ?= "git://git.ti.com/processor-sdk/pdk.git"
-TI_PDK_GIT_BRANCH ?= "master"
+TI_PDK_GIT_BRANCH ?= "release/PROCESSOR-SDK_06.02.00"
 TI_PDK_GIT_PROTOCOL ?= "git"
-TI_PDK_SRCREV ?= "69b8b56273fe0c9085fb92d9bfcb7367b724c8af"
+TI_PDK_SRCREV ?= "7e19ea1c7e6e2d5a14e73d980ced0964e848c585"
 
-TI_PDK_VERSION ?= "2019.11.0"
+TI_PDK_VERSION ?= "2019.12.0"
 
 PV = "${TI_PDK_VERSION}"
 
-- 
2.7.4

