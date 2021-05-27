Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.711.1622075279278704199
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 26 May 2021 17:27:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=yKYE7KvU;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14R0RviG079160;
	Wed, 26 May 2021 19:27:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1622075277;
	bh=PJUU3FYupFt2KtnQ4IuUWZc8DqkIh4Ai8EA+VhTZ61A=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=yKYE7KvUE3oJvadBj4ldiQEqYzUXfPPywvQzCQ3vD0E7CM56lGkepMz9E+9Okwozu
	 +dsEpzEbF3icv0ADV6KVXLAcyPovS/pw9Thwpg9b0/n48bg/EIBifqzm24Ug4Yx+mw
	 VKtZRgJhEQ7AaceP8k9BkWBDJyRYTCGHfamaOZUU=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14R0RvL8009246
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 May 2021 19:27:57 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 26
 May 2021 19:27:57 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 26 May 2021 19:27:57 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14R0RvIh091635;
	Wed, 26 May 2021 19:27:57 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Yogesh Siraswar <yogeshs@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH] conf: j7-evm: ReIntroduce existent dtbo for 5.10
Date: Wed, 26 May 2021 19:27:57 -0500
Message-ID: <20210527002757.9900-2-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210527002757.9900-1-praneeth@ti.com>
References: <20210527002757.9900-1-praneeth@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

commit 8b206b32ec18 ("conf: j7-evm: Remove unavailable dtb/o from 5.10 kernel")
removed all non-existent dtb* for j7-evm as they were not
available on linux 5.10 branch at that time.

This patch reintroduces k3-j721e-common-proc-board-infotainment.dtbo overlay.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 conf/machine/j7-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/machine/j7-evm.conf b/conf/machine/j7-evm.conf
index 1b99baeb..4e9d18a7 100644
--- a/conf/machine/j7-evm.conf
+++ b/conf/machine/j7-evm.conf
@@ -11,6 +11,7 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 KERNEL_DEVICETREE = " \
     ti/k3-j721e-common-proc-board.dtb \
+    ti/k3-j721e-common-proc-board-infotainment.dtbo \
 "
 
 UBOOT_MACHINE = "j721e_evm_a72_config"
-- 
2.17.1

