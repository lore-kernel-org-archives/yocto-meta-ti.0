Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.16601.1634056919335255726
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 12 Oct 2021 09:41:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ETECjlC8;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: yogeshs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19CGfvwI108308;
	Tue, 12 Oct 2021 11:41:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1634056917;
	bh=+X52RO1O/g0xmdiC5ZVISmMWxcnfoGxZA4/Lid5gXvg=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ETECjlC8wklk4Klx9ephT1QFWetfX43oPobai56tk9UcUaLNEzmcfEUvUTb4w3tUT
	 Z0BjeT71k7UeyRqHHWwppmAOr2ujyo08ZQAOFXGoE7BUGU6cTlFkVR+Ho4TnNJtKLE
	 NxbPFTJzK9U+N1tNvT1c+gmcX2/qPkTTfC4STN9U=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19CGfvL0003463
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 12 Oct 2021 11:41:57 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 12
 Oct 2021 11:41:57 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 12 Oct 2021 11:41:57 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19CGfvOq003496;
	Tue, 12 Oct 2021 11:41:57 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/dunfell][PATCH 2/2] conf: am57xx-evm: ReIntroduce existent dtb* for 5.10
Date: Tue, 12 Oct 2021 16:41:57 +0000
Message-ID: <20211012164157.3888-3-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211012164157.3888-1-yogeshs@ti.com>
References: <20211012164157.3888-1-yogeshs@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

This reverts commit 43bf0f36a3ac62cc3378688358ba704a27b501ce.
Added dtb and dtbo for am57xx

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 conf/machine/am57xx-evm.conf | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-evm.conf
index 78e730ca..cb3687f9 100644
--- a/conf/machine/am57xx-evm.conf
+++ b/conf/machine/am57xx-evm.conf
@@ -14,10 +14,15 @@ KERNEL_DEVICETREE = " \
     am57xx-beagle-x15-revc.dtb \
     am5729-beagleboneai.dtb \
     am57xx-evm.dtb \
-    am57xx-evm-reva3.dtb \
+    am57xx-evm-common.dtbo
+    am57xx-evm-reva3.dtbo \
     am571x-idk.dtb \
+    am571x-idk-touchscreen.dtbo \
     am572x-idk.dtb \
     am574x-idk.dtb \
+    am57xx-idk-osd-lcd-common.dtbo \
+    am572x-idk-touchscreen.dtbo \
+
 "
 
 KERNEL_DEVICETREE += "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am574x-idk-pru-excl-uio.dtb am572x-idk-pru-excl-uio.dtb am571x-idk-pru-excl-uio.dtb', '', d)}"
-- 
2.17.1

