Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.6048.1634624515905283924
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 18 Oct 2021 23:21:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=OcD19FxQ;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: vigneshr@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19J6Lmqw056848;
	Tue, 19 Oct 2021 01:21:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1634624508;
	bh=F+j/3Ii+QLJPS6hA80pxva5J9FRfcVqtmK7EnhAs9Jw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=OcD19FxQV52l4YrB2KiwTdtt2gs7G8ASXJ/EVjNE5QFQ+czRaWiyecluHpq0r9JkO
	 5i19VKFt3T95yg1p7+hJiGEaRTVvLlrg5R/V5sm+EKtggueZFKBO03SiSlzR7OLxUc
	 ttkCYBhnziQg4Uv/7z/wwRqa5aJqcquFRnpCWgCk=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19J6Lmk5120547
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 19 Oct 2021 01:21:48 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 19
 Oct 2021 01:21:47 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 19 Oct 2021 01:21:47 -0500
Received: from uda0132425.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19J6LgpX018387;
	Tue, 19 Oct 2021 01:21:45 -0500
From: "Vignesh Raghavendra" <vigneshr@ti.com>
To: <yogeshs@ti.com>
CC: <denis@denix.org>, <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Grygorii Strashko
	<grygorii.strashko@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH dunfell/master 1/2] prueth-fw-am65x-sr2: Update firmware to 02.02.09.06
Date: Tue, 19 Oct 2021 11:51:40 +0530
Message-ID: <20211019062141.10228-2-vigneshr@ti.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211019062141.10228-1-vigneshr@ti.com>
References: <20211019062141.10228-1-vigneshr@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Vignesh Raghavedra <vigneshr@ti.com>

Update AM65x SR2.0 prueth firmware to 02.02.09.06 that adds support for
TSN features.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
index 67e8cd07a180..a0a4546a915a 100644
--- a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
+++ b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
@@ -3,7 +3,7 @@ SUMMARY = "PRU Ethernet firmware for AM65xx SR2.0"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
 
-PV = "02.02.09.03"
+PV = "02.02.09.06"
 
 CLEANBROKEN = "1"
 
@@ -11,7 +11,7 @@ COMPATIBLE_MACHINE = "am65xx-evm|am64xx-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "f3d2c7cafc906adc9a2f4543aa2fee556483545d"
+SRCREV = "10bcf8564c6e9277e7f402fb02cf941956d0d3eb"
 BRANCH ?= "ti-linux-firmware"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
-- 
2.33.1

