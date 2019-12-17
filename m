Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.712.1576599011737101772
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Dec 2019 08:10:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=MnQfPO3N;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: j-stiffler@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBHGABtE040547
	for <meta-ti@lists.yoctoproject.org>; Tue, 17 Dec 2019 10:10:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576599011;
	bh=vph9xoF5K68EQwmc4KgwtJs0dsuTyanBXEFZHdbjwxQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=MnQfPO3NzOCt06tkuAC7siY4pp84Bch4S5TKGO5cRSND65A/ItcgKu7RATZ+3Ceni
	 /WjXjeYDTWIa3NIICfsKgHVugKsW+lzLSQCahOAfuC3G/onvRGMGUnsnytAsq3SwwA
	 dTMAA7Ohp8owlUJGilRw4Ff4QULq06UmnTd+/ONE=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBHGABB3061048
	for <meta-ti@lists.yoctoproject.org>; Tue, 17 Dec 2019 10:10:11 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 17
 Dec 2019 10:10:10 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 17 Dec 2019 10:10:10 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBHGA8pH104114;
	Tue, 17 Dec 2019 10:10:10 -0600
From: "Jacob Stiffler" <j-stiffler@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <m-radhakrishnan2@ti.com>, Jacob Stiffler <j-stiffler@ti.com>
Subject: [master/thud/ti2019.05][PATCH 2/3] ti-pdk-fetch: bump SRCREV for Processor SDK 6.2
Date: Tue, 17 Dec 2019 10:51:03 -0500
Message-ID: <1576597865-9349-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576597865-9349-1-git-send-email-j-stiffler@ti.com>
References: <1576597865-9349-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 classes/ti-pdk-fetch.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass
index e7f8875..7b46836 100644
--- a/classes/ti-pdk-fetch.bbclass
+++ b/classes/ti-pdk-fetch.bbclass
@@ -1,9 +1,9 @@
 TI_PDK_GIT_URI ?= "git://git.ti.com/processor-sdk/pdk.git"
 TI_PDK_GIT_BRANCH ?= "master"
 TI_PDK_GIT_PROTOCOL ?= "git"
-TI_PDK_SRCREV ?= "69b8b56273fe0c9085fb92d9bfcb7367b724c8af"
+TI_PDK_SRCREV ?= "7e19ea1c7e6e2d5a14e73d980ced0964e848c585"
 
-TI_PDK_VERSION ?= "2019.11.0"
+TI_PDK_VERSION ?= "2019.12.0"
 
 PV = "${TI_PDK_VERSION}"
 
-- 
2.7.4

