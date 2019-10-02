Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D75FAE00D77; Tue,  1 Oct 2019 17:04:21 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D1776E00BB5
	for <meta-ti@yoctoproject.org>; Tue,  1 Oct 2019 17:04:20 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9204K6L033943
	for <meta-ti@yoctoproject.org>; Tue, 1 Oct 2019 19:04:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569974660;
	bh=zOpu919/YUXqPyzOs4QbLpjlnRbRFPE9ne8RINTWD04=;
	h=From:To:Subject:Date;
	b=QiilpjZ69VDtxDAAVkuMXe8dJ9ph2A3osS6BuRPsKe9saMGzqb4wJuv0GpAD7dNs0
	pUe9qpLxON2+VbWYVPGx9a/ZgxL9AYXWwUqDoos7hZv0qNFA/h2FOpakm+LyIJUPnn
	QWrq6sZm/mJGRjhFnt/Z51RTL3N8wUtdGWfSJP+A=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9204KiH063918
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 1 Oct 2019 19:04:20 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 1 Oct 2019 19:04:19 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 1 Oct 2019 19:04:19 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9204JGO007494
	for <meta-ti@yoctoproject.org>; Tue, 1 Oct 2019 19:04:19 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 1 Oct 2019 20:03:44 -0400
Message-ID: <1569974651-63945-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 00/27] *** RTOS Patchset for 6.1 release ***
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
X-List-Received-Date: Wed, 02 Oct 2019 00:04:21 -0000
Content-Type: text/plain

This is the RTOS patchset for Procsdk RTOS 6.1 release.
The build has been verified on am65xx-evm. am75xx-evm verification is going on. No problems so far

Mahesh Radhakrishnan (27):
  board-rtos: SRCREV update to 01.00.10.06C
  common-csl-ip: SRCREV to 03.03.00.16A
  dfe-lld:SRCREV to 01.00.00.09A
  emac-lld:SRCREV update to 01.00.03.18
  fatfs-rtos: SRCREV update to 01.00.00.15
  gpio-lld-rtos: SRCREV update to 01.00.00.16
  i2c-lld-rtos: SRCREV update to 01.00.00.16
  icss-emac-lld: SRCREV update to 01.00.00.17
  mcasp-lld-rtos: SRCREV update to 01.01.00.15
  mmap-lld: SRCREV update to 02.00.00.08C
  mmcsd-lld-rtos: SRCREV update to 01.00.00.17
  nwal-lld: SRCREV update to 02.01.00.13
  osal: SRCREV update to 01.00.00.16
  pcie-lld-rtos: SRCREV update to 02.03.00.05
  pm-lld-rtos: SRCREV update to 01.08.00.23
  pruss-lld: SRCREV update to 01.00.00.15
  sciclient-rtos: SRCREV update to 01.00.00.04
  serdes-diag-rtos: SRCREV update to 01.00.00.13
  spi-lld-rtos: SRCREV update to 01.00.00.16
  starterware: SRCREV update to 02.01.01.12
  transport-rtos: SRCREV update to 01.00.00.17
  uart-lld-rtos: SRCREV update to 01.00.00.16
  udma-lld-rtos: SRCREV update to 01.00.00.04
  usb-lld-rtos: SRCREV update to 01.00.00.19
  profiling-rtos: SRCREV update to 01.00.00.10
  multiprocmgr: SRCREV update to 3.0.5.0
  ti-pdk-build-rtos: SRCREV update to 01.00.00.14

 recipes-bsp/board-rtos/board-rtos_git.bb         | 6 +++---
 recipes-bsp/common-csl-ip/common-csl-ip.inc      | 6 +++---
 recipes-bsp/dfe-lld/dfe-lld.inc                  | 6 +++---
 recipes-bsp/emac-lld/emac-lld.inc                | 6 +++---
 recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb         | 6 +++---
 recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb        | 6 +++---
 recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb          | 6 +++---
 recipes-bsp/icss-emac-lld/icss-emac-lld.inc      | 6 +++---
 recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb      | 6 +++---
 recipes-bsp/mmap-lld/mmap-lld.inc                | 6 +++---
 recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb      | 6 +++---
 recipes-bsp/nwal-lld/nwal-lld.inc                | 6 +++---
 recipes-bsp/osal/osal.inc                        | 6 +++---
 recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb        | 6 +++---
 recipes-bsp/pm-lld/pm-lld-rtos_git.bb            | 6 +++---
 recipes-bsp/pruss-lld/pruss-lld.inc              | 6 +++---
 recipes-bsp/sciclient/sciclient-rtos_git.bb      | 8 ++++----
 recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb  | 6 +++---
 recipes-bsp/spi-lld/spi-lld-rtos_git.bb          | 6 +++---
 recipes-bsp/starterware/starterware.inc          | 6 +++---
 recipes-bsp/transport-rtos/transport.inc         | 6 +++---
 recipes-bsp/uart-lld/uart-lld-rtos_git.bb        | 6 +++---
 recipes-bsp/udma-lld/udma-lld-rtos_git.bb        | 6 +++---
 recipes-bsp/usb-lld/usb-lld-rtos_git.bb          | 6 +++---
 recipes-bsp/utils-rtos/profiling-rtos_git.bb     | 6 +++---
 recipes-ti/multiprocmgr/multiprocmgr.inc         | 6 +++---
 recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb | 6 +++---
 27 files changed, 82 insertions(+), 82 deletions(-)

-- 
1.9.1


