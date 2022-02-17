Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.4151.1645139631778360553
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Feb 2022 15:13:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=toDCCgi+;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21HNDneb025887;
	Thu, 17 Feb 2022 17:13:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1645139629;
	bh=TlEdki2STFL2M3Y6xJBNR+OWLGiHtct+0qPwiM9ADO0=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=toDCCgi+3rY4I5sOwKlHAfaSuPhAF1eS55aEwdFrI2Z5IcPs44Wi2uUO2wdaCvre+
	 XcWADtMwYJHtGHLwjzCp9PvK5OTMEORe8CJ2eLZWYBhVU6FX1ItuZebtVTpVk8KWgY
	 xCRJnZyn9cN3RenIgZSMsVEQlR2H6n521ptJxTgE=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21HNDnTH088863
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Feb 2022 17:13:49 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 17
 Feb 2022 17:13:48 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 17 Feb 2022 17:13:48 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21HNDmnT011172;
	Thu, 17 Feb 2022 17:13:48 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nKpy8-0006nr-MG; Thu, 17 Feb 2022 17:13:48 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 2/4] linux-ti-staging: Bump to 08.02.00.003 release
Date: Thu, 17 Feb 2022 17:13:46 -0600
Message-ID: <20220217231348.26098-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220217231348.26098-1-reatmon@ti.com>
References: <20220217231348.26098-1-reatmon@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Updated the linux version for 08.02.00.003

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_5.10.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
index c74c0a10..cd7d9519 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -23,8 +23,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.10.y"
 
-SRCREV = "46573628be468b58272d7c41b582603b06e0414a"
-PV = "5.10.65+git${SRCPV}"
+SRCREV = "4a12bec7d3f438ce9407e4ba9b2ec883729558a5"
+PV = "5.10.100+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "b"
-- 
2.17.1

