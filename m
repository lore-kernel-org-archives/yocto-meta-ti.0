Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C9E7CE00D8F; Fri, 28 Jun 2019 15:24:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 856C2E00931
	for <meta-ti@yoctoproject.org>; Fri, 28 Jun 2019 15:24:32 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5SMOWJF097898
	for <meta-ti@yoctoproject.org>; Fri, 28 Jun 2019 17:24:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561760672;
	bh=R0j938sKA80Qx3RpaFYXNYqHvwaJX/It/+Uj92whV9I=;
	h=From:To:Subject:Date;
	b=c4Q7GsfVGaLiP4XZUunyluOGl9RkbiuuXpmnGGkCrgzqh2KrWFG93Z1KZHHtsM49B
	5nXdyk2l6nOhiRmuWge/N8wpml02b1JW0hvy5Qjk31QivoaoGR9W4IM0R28ql11xm+
	ZgWzQtvbB+WYYZgxGlS/agOEn5AoRFOPJDC+/8D0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5SMOVMP024360
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 28 Jun 2019 17:24:32 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 28 Jun 2019 17:24:31 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 28 Jun 2019 17:24:31 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5SMOVnw012488
	for <meta-ti@yoctoproject.org>; Fri, 28 Jun 2019 17:24:31 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 28 Jun 2019 18:24:20 -0400
Message-ID: <1561760664-53158-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 0/4] *** RTOS 6.0 Patchset-3 ***
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
X-List-Received-Date: Fri, 28 Jun 2019 22:24:33 -0000
Content-Type: text/plain

This is the RTOS Patchset #3 which addresses the following issue
 https://jira.itg.ti.com/browse/PRSDK-4321

Mahesh Radhakrishnan (4):
  board-rtos: SRCREV update to 01.00.10.05C
  emac-lld-rtos: SRCREV update to 01.00.03.16A
  pruss-lld: SRCREV update to 01.00.00.14A
  transport-rtos: SRCREV update to 01.00.00.16A

 recipes-bsp/board-rtos/board-rtos_git.bb  | 6 +++---
 recipes-bsp/emac-lld/emac-lld-rtos_git.bb | 6 +++---
 recipes-bsp/pruss-lld/pruss-lld.inc       | 6 +++---
 recipes-bsp/transport-rtos/transport.inc  | 6 +++---
 4 files changed, 12 insertions(+), 12 deletions(-)

-- 
1.9.1


