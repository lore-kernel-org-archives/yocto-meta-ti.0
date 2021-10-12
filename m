Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.16531.1634056919176809743
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 12 Oct 2021 09:41:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=AOTMRCin;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: yogeshs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19CGfvdR062826;
	Tue, 12 Oct 2021 11:41:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1634056917;
	bh=KIyUQ5MMfkmI61fyAPZjh+VXGB/XJmYgeF6mHNwFUes=;
	h=From:To:Subject:Date;
	b=AOTMRCinJX2lsnFwIrxs6uPyypoYgirlPql6Jaz9BTZQZyV5O8Zb/RlHYnQiQNlhj
	 EfDeV1uLFzW5TS5h7L4aBBGDusorjgNKBqams7aGSCWtnLHBX18t9v+Ua4fwwC0MUv
	 pQzloKtJFprFWExSUgsKiAKAux0mLS+bXJpJeO2A=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19CGfvLS043236
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 12 Oct 2021 11:41:57 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 12
 Oct 2021 11:41:57 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 12 Oct 2021 11:41:57 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19CGfvaT115591;
	Tue, 12 Oct 2021 11:41:57 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/dunfell][PATCH 0/2] ReIntroduce missing dtb
Date: Tue, 12 Oct 2021 16:41:55 +0000
Message-ID: <20211012164157.3888-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Add missing dtb and dtbo for am57xx and dra7xx. 

Yogesh Siraswar (2):
  conf: dra7xx-evm: ReIntroduce existent dtb* for 5.10
  conf: am57xx-evm: ReIntroduce existent dtb* for 5.10

 conf/machine/am57xx-evm.conf |  7 ++++++-
 conf/machine/dra7xx-evm.conf | 11 +++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)

-- 
2.17.1

