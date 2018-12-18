Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 075ABE00C5B; Tue, 18 Dec 2018 14:26:41 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C9401E00B92
	for <meta-ti@yoctoproject.org>; Tue, 18 Dec 2018 14:26:39 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBIMQdIc006110
	for <meta-ti@yoctoproject.org>; Tue, 18 Dec 2018 16:26:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1545171999;
	bh=yucGhZ2rgyT/rYOt9riTX2798h52bPA0hW4GWdN+bA8=;
	h=From:To:Subject:Date;
	b=iuGiQGALDESVx0Gtg6wk/3wzsX5/R09FoMc27SH+WwmZgR6Csmsp98LclqeI6+tjP
	kZ9o3CSzH1wp9mBc30zNlmPIuls6Pc1rkthf+4uLoaXkLNBKoeOT+7GQ/hIgsAsxhU
	u/uBcxOz3203aFW88gEx1jLRZ0eOEooRx4EexiM0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBIMQd4b046417
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 18 Dec 2018 16:26:39 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 18 Dec 2018 16:26:39 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 18 Dec 2018 16:26:38 -0600
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBIMQcEL023799
	for <meta-ti@yoctoproject.org>; Tue, 18 Dec 2018 16:26:38 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 18 Dec 2018 17:26:29 -0500
Message-ID: <1545171996-17507-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 0/7] RTOS patchset for 5.2
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Dec 2018 22:26:41 -0000
Content-Type: text/plain

This is the second set of patches for RTOS recipes for 5.2 release

Mahesh Radhakrishnan (7):
  board-rtos: SRCREV update to 01.00.10.03A
  common-csl-ip: SRCREV update to 03.03.00.13A
  emac-lld-rtos: SRCREV update to 01.00.03.13B
  osal: SRCREV update to 01.00.00.13A
  spi-lld-rtos: SRCREV udpate to 01.00.00.13A
  udma-lld-rtos: SRCREV update to 01.00.00.01A
  emac-lld-rtos: SRCREV update to 01.00.03.13C

 recipes-bsp/board-rtos/board-rtos_git.bb    | 6 +++---
 recipes-bsp/common-csl-ip/common-csl-ip.inc | 6 +++---
 recipes-bsp/emac-lld/emac-lld-rtos_git.bb   | 6 +++---
 recipes-bsp/osal/osal.inc                   | 6 +++---
 recipes-bsp/spi-lld/spi-lld-rtos_git.bb     | 6 +++---
 recipes-bsp/udma-lld/udma-lld-rtos_git.bb   | 6 +++---
 6 files changed, 18 insertions(+), 18 deletions(-)

-- 
1.9.1


