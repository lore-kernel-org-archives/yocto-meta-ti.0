Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F18D8E00D84; Wed, 26 Jun 2019 21:24:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 55309E00C74
	for <meta-ti@yoctoproject.org>; Wed, 26 Jun 2019 21:24:07 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5R4O6bV095891
	for <meta-ti@yoctoproject.org>; Wed, 26 Jun 2019 23:24:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561609446;
	bh=Q2X+MrLT85gfYEK5v88ls21OwvzU7pqhPgcjJ4JoLPg=;
	h=From:To:Subject:Date;
	b=hotiOkMA2mgjypPrxzSN4KRPKgGTIoVYgL0MIKWW9I9Tb7sBx1gDB9xkzvBNWFQS/
	G7l66XV/8HisvJ9HUJxL6URhjdGenabC6eG+g0zrTuRR0Sl0k8/30/g43ZUuABM3BD
	0Jt9OVCxVL6DY8mY4imgqMzw9BxXwsirdwn9mCbc=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5R4O6cF078492
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 26 Jun 2019 23:24:06 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 26 Jun 2019 23:24:06 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 26 Jun 2019 23:24:06 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5R4O50S079141
	for <meta-ti@yoctoproject.org>; Wed, 26 Jun 2019 23:24:06 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 27 Jun 2019 00:23:32 -0400
Message-ID: <1561609436-41672-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 00/24] *** RTOS patchset for 6.0 release ***
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
X-List-Received-Date: Thu, 27 Jun 2019 04:24:08 -0000
Content-Type: text/plain

RTOS patches for 6.0 Processor SDK RTOS release

Mahesh Radhakrishnan (24):
  board-rtos: SRCREV update to 01.00.10.05A
  common-csl-ip: SRCREV update to 03.03.00.15
  edma3-lld: SRCREV update to 2.12.05.30E
  fatfs-rtos: SRCREV update to 01.00.00.14
  gpio-lld-rtos:SRCREV update to 01.00.00.15
  i2c-lld-rtos: SRCREV update to 01.00.00.15
  icss-emac-lld: SRCREV update to 01.00.00.16
  mcasp-lld-rtos:SRCREV update to 01.01.00.14
  mmcsd-lld-rtos: SRCREV update to 01.00.00.16
  osal: SRCREV update to 01.00.00.15
  pcie-lld-rtos: SRCREV update to 02.03.00.04
  pm-lld-rtos: SRCREV update to 01.08.00.22
  pruss-lld: SRCREV update to 01.00.00.14
  sa-lld: SRCREV update to 04.00.00.03
  sciclient-rtos: SRCREV update to 01.00.00.03
  serdes-diag-rtos: SRCREV update to 01.00.00.12A
  spi-lld-rtos: SRCREV update to 01.00.00.15
  starterware: SRCREV update to 02.01.01.11A
  transport-rtos: SRCREV update to 01.00.00.16
  uart-lld-rtos: SRCREV update to 01.00.00.15
  udma-lld-rtos: SRCREV update to 01.00.00.03
  usb-lld-rtos: SRCREV update to 01.00.00.18
  ti-pdk-build: SRCREV update to 01.00.00.13
  emac-lld-rtos: SRCREV update to 01.00.03.16

 recipes-bsp/board-rtos/board-rtos_git.bb         | 6 +++---
 recipes-bsp/common-csl-ip/common-csl-ip.inc      | 6 +++---
 recipes-bsp/edma3-lld/edma3-lld.inc              | 6 +++---
 recipes-bsp/emac-lld/emac-lld-rtos_git.bb        | 6 +++---
 recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb         | 6 +++---
 recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb        | 6 +++---
 recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb          | 6 +++---
 recipes-bsp/icss-emac-lld/icss-emac-lld.inc      | 6 +++---
 recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb      | 8 ++++----
 recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb      | 6 +++---
 recipes-bsp/osal/osal.inc                        | 6 +++---
 recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb        | 6 +++---
 recipes-bsp/pm-lld/pm-lld-rtos_git.bb            | 6 +++---
 recipes-bsp/pruss-lld/pruss-lld.inc              | 6 +++---
 recipes-bsp/sa-lld/sa-lld.inc                    | 6 +++---
 recipes-bsp/sciclient/sciclient-rtos_git.bb      | 6 +++---
 recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb  | 6 +++---
 recipes-bsp/spi-lld/spi-lld-rtos_git.bb          | 6 +++---
 recipes-bsp/starterware/starterware.inc          | 6 +++---
 recipes-bsp/transport-rtos/transport.inc         | 6 +++---
 recipes-bsp/uart-lld/uart-lld-rtos_git.bb        | 6 +++---
 recipes-bsp/udma-lld/udma-lld-rtos_git.bb        | 6 +++---
 recipes-bsp/usb-lld/usb-lld-rtos_git.bb          | 6 +++---
 recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb | 6 +++---
 24 files changed, 73 insertions(+), 73 deletions(-)

-- 
1.9.1


