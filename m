Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.1197.1634595036705154828
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 18 Oct 2021 15:10:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=cfH7e5K9;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19IMAYiT111474;
	Mon, 18 Oct 2021 17:10:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1634595034;
	bh=NUCQnITaF48JQrcpOc6CZHYROKkvrrlXvB6u/mKiydk=;
	h=From:To:Subject:Date;
	b=cfH7e5K9Ee/rOygwnhQudqllJ31czlG4PdEEdbXn+DNeD/JDEQtBwthDhamIuNib1
	 p2zvJVSTR0M0rTbUHYc6MHbZjBbArR4ogxJtPa60kmtmf3BYVOqPJRgfezGfTu9d/k
	 PJ5pFLUu8iT32EGeSdmnbwDPattcZrmKIX+R4fPM=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19IMAYCL045519
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 18 Oct 2021 17:10:34 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 18
 Oct 2021 17:10:34 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 18 Oct 2021 17:10:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19IMAYKG065296;
	Mon, 18 Oct 2021 17:10:34 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/dunfell][PATCH v3 0/3] ReIntroduce missing
Date: Mon, 18 Oct 2021 22:10:31 +0000
Message-ID: <20211018221034.11092-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Added new patch to fix the compile issue with dtb* in ti folder

Yogesh Siraswar (3):
  conf: dra7xx-evm: ReIntroduce existent dtb* for 5.10
  conf: am57xx-evm: ReIntroduce existent dtb* for 5.10
  conf: omap-a15: fix the dtb file  path for extlinux boot

 conf/machine/am57xx-evm.conf      | 6 +++++-
 conf/machine/dra7xx-evm.conf      | 8 ++++++++
 conf/machine/include/omap-a15.inc | 6 +++++-
 3 files changed, 18 insertions(+), 2 deletions(-)

-- 
2.17.1

