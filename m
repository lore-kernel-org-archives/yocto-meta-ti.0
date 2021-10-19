Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.5950.1634624516253815038
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 18 Oct 2021 23:21:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=FrYjn1+3;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: vigneshr@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19J6Llur118147;
	Tue, 19 Oct 2021 01:21:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1634624507;
	bh=PQBaQ1W1LC1ENYLPsHFSzm6znIqNNtDeWxNGWOrtYEA=;
	h=From:To:CC:Subject:Date;
	b=FrYjn1+3/hVBn86drNEt951A5CMuTcuV0399hbpMLsLQqmPQfJVOshHfm51CEEbDe
	 k8/HfLB2ozr8+PZah2Ym8Ig/BDMVo9r3ERBZ3v6XvvsvI0v67Ysw3QS3+woQQ9+ziW
	 3DDtCItolfTmNYZ/Yf/ppEmcybteqblIO7cHf79I=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19J6Ll3U120531
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 19 Oct 2021 01:21:47 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 19
 Oct 2021 01:21:45 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 19 Oct 2021 01:21:45 -0500
Received: from uda0132425.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19J6LgpW018387;
	Tue, 19 Oct 2021 01:21:43 -0500
From: "Vignesh Raghavendra" <vigneshr@ti.com>
To: <yogeshs@ti.com>
CC: <denis@denix.org>, <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Grygorii Strashko
	<grygorii.strashko@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH dunfell/master 0/2] ICSSG PRUETH firmware update for 8.1
Date: Tue, 19 Oct 2021 11:51:39 +0530
Message-ID: <20211019062141.10228-1-vigneshr@ti.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

First patch updates DUAL EMAC firmware to 02.02.09.06 release bringing
in TSN features
Second patch adds new recipe to patch ICSSG switch firmwares, which are
new in 8.1

Vignesh Raghavedra (2):
  prueth-fw-am65x-sr2: Update firmware to 02.02.09.06
  prusw-fw-am65x-sr2: Add recipe for ICSSG Switch mode firmware for
    AM65x SR2.0

 .../prueth-fw/prueth-fw-am65x-sr2_git.bb      |  4 +-
 .../prusw-fw/prusw-fw-am65x-sr2_git.bb        | 39 +++++++++++++++++++
 recipes-kernel/linux/kernel-rdepends.inc      |  2 +-
 3 files changed, 42 insertions(+), 3 deletions(-)
 create mode 100644 recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb

-- 
2.33.1

