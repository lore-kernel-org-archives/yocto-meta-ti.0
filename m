Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.14718.1636717802670231556
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 12 Nov 2021 03:50:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=m9k7rkun;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: yogeshs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1ACBo0oE006103;
	Fri, 12 Nov 2021 05:50:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1636717800;
	bh=FdzHPejha5ZT3DpvMbrrZ/OqJHo2aFCXvtRqqDbtZjk=;
	h=From:To:Subject:Date;
	b=m9k7rkunATW5Z1fIV92JNELfRRQtMecVXo6uDxq2qeLidex8+G97h/Fv00MUiWuUD
	 kabtqgJLXKIuzdXrlxTFjVMy/BK0684f3iuMeBlm+bqsnnPQ/az6Gh7l0LqocDCgYL
	 Cd1Ncu99voI+d78g7u+prWsfdtJKBLxY/SLkFN3k=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1ACBo08J074743
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 12 Nov 2021 05:50:00 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 12
 Nov 2021 05:50:00 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 12 Nov 2021 05:50:00 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1ACBo0kY077144;
	Fri, 12 Nov 2021 05:50:00 -0600
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH] ti-linux-fw: Add AUTOREV support for K3 Image Gen
Date: Fri, 12 Nov 2021 11:50:00 +0000
Message-ID: <20211112115000.60066-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

This patch brings k3 image gen under bleeding for nightly builds

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 recipes-bsp/ti-linux-fw/ti-linux-fw.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 97e51962..c59120b8 100644
--- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -21,7 +21,9 @@ TI_LINUX_FW_SRCREV ?= "95232a584175a8ac872adf477b2dbb9ca68ba063"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
-SRCREV_imggen = "6baabef219aea0f667423f2cab2bc2d63a349488"
+
+K3_IMAGE_GEN_SRCREV ?= "6baabef219aea0f667423f2cab2bc2d63a349488"
+SRCREV_imggen = "${K3_IMAGE_GEN_SRCREV}"
 SRCREV_FORMAT = "imggen"
 
 SRC_URI = " \
-- 
2.17.1

