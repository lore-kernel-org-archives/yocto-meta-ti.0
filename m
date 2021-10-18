Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.1218.1634595036420432270
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 18 Oct 2021 15:10:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=EpMIwyi5;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: yogeshs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19IMAZOQ123171;
	Mon, 18 Oct 2021 17:10:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1634595035;
	bh=XonLkfe2uX5JJ64vIU+pHupM4wsTpIWwagMQpE7fyM8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=EpMIwyi5C9yDLHtZnoicFSG1gJV+DJM+OqLk3C6Co6xwE8t361Bh8dZU7Xg05KLLv
	 LWadBvUessXXptIPbW45tsqtyzDbFGXEFQt++F6otOeeX6xTamRBwqqO5j9Xl1lXwN
	 Vty0XOkD7nXUSayVxyrWzaofgZb0D77U/qooUZC8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19IMAZ2l015099
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 18 Oct 2021 17:10:35 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 18
 Oct 2021 17:10:34 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 18 Oct 2021 17:10:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19IMAYOc038321;
	Mon, 18 Oct 2021 17:10:34 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/dunfell][PATCH v3 3/3] conf: omap-a15: fix the dtb file path for extlinux boot
Date: Mon, 18 Oct 2021 22:10:34 +0000
Message-ID: <20211018221034.11092-4-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211018221034.11092-1-yogeshs@ti.com>
References: <20211018221034.11092-1-yogeshs@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

The uboot extlinux is using kernel device tree variable to populate the
dtb files. The error occurs if the device tree files are in ti folder
since there is no ti folder in deploy directory. Fix the kernel device
tree path before using in the uboot extlinux.

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 conf/machine/include/omap-a15.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
index c95b0ccc..8356c920 100644
--- a/conf/machine/include/omap-a15.inc
+++ b/conf/machine/include/omap-a15.inc
@@ -19,15 +19,19 @@ UBOOT_ARCH = "arm"
 UBOOT_ENTRYPOINT = "0x80008000"
 UBOOT_LOADADDRESS = "0x80008000"
 
+DEVICETREE_FILE = "${@d.getVar('KERNEL_DEVICETREE').replace("ti/","")}"
+
 # Generate an extlinux.conf file
 UBOOT_EXTLINUX = "1"
 UBOOT_EXTLINUX_ROOT = "root=PARTUUID=${uuid}"
 UBOOT_EXTLINUX_BOOT_FILES = " \
     extlinux.conf;extlinux/extlinux.conf \
     ${KERNEL_IMAGETYPE} \
-    ${KERNEL_DEVICETREE} \
+    ${DEVICETREE_FILE} \
 "
 
+
+
 SPL_BINARY = "MLO"
 UBOOT_SUFFIX = "img"
 
-- 
2.17.1

