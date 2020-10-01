Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.488.1601560409698889471
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 01 Oct 2020 06:53:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Qc5hezZ4;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rogerq@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 091DrTbY033080
	for <meta-ti@lists.yoctoproject.org>; Thu, 1 Oct 2020 08:53:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1601560409;
	bh=M300l+vxCnecC1X9LFZbeidz/dnmnG2LawAImdr14/s=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Qc5hezZ4a7e1cOZPRf4o9WXTNvk1+79Q7hoQNG0jpJ+0OoOYDDISrUFga0q2inqzy
	 3WHXd7eM5dq9P/1YhiIYlo08pXXJT/JYvFmEJM+jHoc9Cll7ZdaNKwbmW9R5UtI8an
	 O4v+WSdPp8KVs+XdJTbOKWp9d6040ejHAJpZWuhQ=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 091DrT5Y031299
	for <meta-ti@lists.yoctoproject.org>; Thu, 1 Oct 2020 08:53:29 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 1 Oct
 2020 08:53:28 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 1 Oct 2020 08:53:28 -0500
Received: from lta0400828a.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 091DrMMb004447;
	Thu, 1 Oct 2020 08:53:27 -0500
From: "Roger Quadros" <rogerq@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <denys@ti.com>, <nsekhar@ti.com>, <vigneshr@ti.com>, <lokeshvutla@ti.com>,
        <dmurphy@ti.com>, Roger Quadros <rogerq@ti.com>
Subject: [meta-ti][dunfell/master PATCH 2/2] prusw-fw: Update the firmware to 3.1.4 version
Date: Thu, 1 Oct 2020 16:53:21 +0300
Message-ID: <20201001135321.7470-3-rogerq@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201001135321.7470-1-rogerq@ti.com>
References: <20201001135321.7470-1-rogerq@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Update the firmware to version 3.1.4

Signed-off-by: Roger Quadros <rogerq@ti.com>
---
 recipes-bsp/prusw-fw/{prusw-fw_3.0.3.bb => prusw-fw_3.1.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename recipes-bsp/prusw-fw/{prusw-fw_3.0.3.bb => prusw-fw_3.1.4.bb} (94%)

diff --git a/recipes-bsp/prusw-fw/prusw-fw_3.0.3.bb b/recipes-bsp/prusw-fw/prusw-fw_3.1.4.bb
similarity index 94%
rename from recipes-bsp/prusw-fw/prusw-fw_3.0.3.bb
rename to recipes-bsp/prusw-fw/prusw-fw_3.1.4.bb
index 6eac87c5..b8897e4b 100644
--- a/recipes-bsp/prusw-fw/prusw-fw_3.0.3.bb
+++ b/recipes-bsp/prusw-fw/prusw-fw_3.1.4.bb
@@ -11,7 +11,7 @@ COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "7ba9722b74608ad4472790972917e1205eb3c049"
+SRCREV = "b19bf13a16d7f5c1260cf4d48cf967e5c7e15128"
 BRANCH ?= "ti-linux-firmware"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

