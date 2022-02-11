Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.6713.1644583411668676042
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 11 Feb 2022 04:43:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=rBo0BHEY;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21BChTF9103242;
	Fri, 11 Feb 2022 06:43:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1644583409;
	bh=4xG3wWhpC934DEEa72jp9yNklpI91ifv7tHf8qBLetg=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=rBo0BHEYaCiUsp+9Yn9mLATdxVAvPw1ZdG2B0Oq5jArg4GAsm1MJuaJKlnlEd4CmV
	 1BGLng47tOCoimZz/CRg6rynN/pGwXMEo49MW90MbxKhJ4I+YWw/r2qLslgoTbSyLt
	 kkC+nhv0c/ZrsNIGk7oA9UaQP0x+l7OqFx+XFlgY=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21BChTQa024617
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Feb 2022 06:43:29 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 11
 Feb 2022 06:43:29 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 11 Feb 2022 06:43:29 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21BChTdQ056068;
	Fri, 11 Feb 2022 06:43:29 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nIVGr-0003Jf-6t; Fri, 11 Feb 2022 06:43:29 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 2/4] linux-ti-staging-rt: Bump to 08.02.00.002 release
Date: Fri, 11 Feb 2022 06:43:26 -0600
Message-ID: <20220211124328.12693-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220211124328.12693-1-reatmon@ti.com>
References: <20220211124328.12693-1-reatmon@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Updated the linux rt version for 08.02.00.002

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
index 7929b9cf..aa49acdc 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
 
 BRANCH = "ti-rt-linux-5.10.y"
 
-SRCREV = "d81474af4e33f8de2869d9b21a2389e06178c230"
+SRCREV = "1f6e95d4b12d73bd1728286f3ccc938df7b77954"
 PV = "5.10.65+git${SRCPV}"
-- 
2.17.1

