Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.418.1644248392659895872
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 07 Feb 2022 07:39:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=QtMBPfOM;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 217FdoSq085037;
	Mon, 7 Feb 2022 09:39:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1644248390;
	bh=3uIJ3BFC+vSPab6u2Hs9eHn15do9VrZLBwiXei8J0Wc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=QtMBPfOMDikvglFQ38EFSpHvwztBYgn4EpleqNgOL2ENrg1cnR6PLqRzLBGovorOo
	 c1271/w2x9r86Jobh79HuPzrlbw0/oXHxvkiozYsZ1wcl9VqtUtWg5a921oQtg0y0z
	 KFIuCMACmLQWBq+SU7mqXX+0p2WcdX8ZjHJ0HvMY=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 217FdoAv021791
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Feb 2022 09:39:50 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 7
 Feb 2022 09:39:50 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 7 Feb 2022 09:39:50 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 217Fdo3r041384;
	Mon, 7 Feb 2022 09:39:50 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nH67K-0005o5-Fl; Mon, 07 Feb 2022 09:39:50 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 2/3] linux-ti-staging-rt: Bump to 08.02.00.001 release
Date: Mon, 7 Feb 2022 09:39:49 -0600
Message-ID: <20220207153950.22274-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220207153950.22274-1-reatmon@ti.com>
References: <20220207153950.22274-1-reatmon@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Updated the linux rt version for 08.02.00.001

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
index 53c7462f..7929b9cf 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
 
 BRANCH = "ti-rt-linux-5.10.y"
 
-SRCREV = "541ec9a6995c3dd881d6f0b63cc714a08ded457d"
+SRCREV = "d81474af4e33f8de2869d9b21a2389e06178c230"
 PV = "5.10.65+git${SRCPV}"
-- 
2.17.1

