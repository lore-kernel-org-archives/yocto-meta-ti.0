Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.764.1585870065042806509
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 Apr 2020 16:27:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=PHPr7J7E;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: sam.nelson@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 032NRi0g094276
	for <meta-ti@lists.yoctoproject.org>; Thu, 2 Apr 2020 18:27:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1585870064;
	bh=gXVUHeLKjGxngeFD8cOxXk/j7jw4S6F8yVqjwOV3cuU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=PHPr7J7Eqjf9mJnAMVDP+EgnTdWFutt7WH0iWiFa6eZ3jdkPe+WZcf72YWjy6uwyR
	 Hfv6cpc3S/euoJujRymUfGP6OtHMCMiJemuxKbEuawhgqzJ5RxDbza0nAwXlUozQDY
	 0XhrqgPavFjyAISwi3wFkPwfHm4ay7g0Oh1QdaRQ=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 032NRi6Q052522
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 2 Apr 2020 18:27:44 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 2 Apr
 2020 18:27:44 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 2 Apr 2020 18:27:43 -0500
Received: from uda0862859a.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 032NRdMT100706;
	Thu, 2 Apr 2020 18:27:43 -0500
From: "Sam Nelson" <sam.nelson@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Sam Nelson <sam.nelson@ti.com>
Subject: [meta-ti][thud][PATCH 3/3] ti-ipc: Update commit for release 3.50.04.08 release
Date: Thu, 2 Apr 2020 19:27:36 -0400
Message-ID: <1585870056-13775-3-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1585870056-13775-1-git-send-email-sam.nelson@ti.com>
References: <1585870056-13775-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/ipc/ti-ipc-common.inc | 2 +-
 recipes-ti/ipc/ti-ipc.inc        | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-common.inc b/recipes-ti/ipc/ti-ipc-common.inc
index 86a0fd0..07b380f 100644
--- a/recipes-ti/ipc/ti-ipc-common.inc
+++ b/recipes-ti/ipc/ti-ipc-common.inc
@@ -1,5 +1,5 @@
 PV = "3.50.04.08"
-INC_PR = "r0"
+INC_PR = "r1"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_HOST ?= "null"
diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
index d1eaad2..4f68e31 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -8,8 +8,8 @@ TI_IPC_GIT_URI = "git://git.ti.com/ipc/ipcdev.git"
 TI_IPC_GIT_PROTOCOL = "git"
 TI_IPC_GIT_BRANCH = "3.50"
 
-#Corresponds to 3.50.04.08
-TI_IPC_SRCREV = "1d53b856338b86d1979fe09345c0b382913a848a"
+#Corresponds to 3.50.04.08A
+TI_IPC_SRCREV = "5e72155431e955c5fcba34d844812d234093c846"
 
 BRANCH = "${TI_IPC_GIT_BRANCH}"
 SRC_URI = "${TI_IPC_GIT_URI};protocol=${TI_IPC_GIT_PROTOCOL};branch=${BRANCH};name=ipcdev"
-- 
1.9.1

