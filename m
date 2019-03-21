Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C62E6E00CE0; Thu, 21 Mar 2019 06:16:19 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E36F2E00BB7
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 06:16:18 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2LDGI4p080809
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 08:16:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553174178;
	bh=IuyzeiVH7LBdmqCyJUSGDfegKNKaKFc/7ZKdt/RyClM=;
	h=From:To:Subject:Date;
	b=N/6rmb2kChrIyxYJtDy+Zrm6uTnQj6IpV7CfUNOUid0ZQf2rGfVVY6G4A/PTtqXH/
	h4ugMLxdSt06ZoVat2EhmLDy6CWeyh64eu9AawnB4oe3MnAC81tWTWTGotomKUfIPb
	GOycdDU65JyvOo/bA5tOmjQk14vVjPcI5/SNVCjs=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2LDGIuE043654
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 08:16:18 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 21 Mar 2019 08:16:18 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend
	Transport; Thu, 21 Mar 2019 08:16:18 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2LDGHZe025094
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 08:16:17 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 21 Mar 2019 09:15:44 -0400
Message-ID: <1553174173-28679-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 00/29] RTOS Patches for 5.3 release
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
X-List-Received-Date: Thu, 21 Mar 2019 13:16:19 -0000
Content-Type: text/plain

RTOS driver patches for 5.3 release

Mahesh Radhakrishnan (29):
  board-rtos: SRCREV bump to 01.00.10.04, added dependency on osal-rtos
    for all targets
  common-csl-rtos:SRCREV bump to 03.03.00.14B
  emac-lld-rtos: SRCREV bump to 01.00.03.14A
  fatfs-rtos: SRCREV update to 01.00.00.13, added osal-rtos dependency
  gpio-lld-rtos: SRCREV updater to 01.00.00.14
  gpmc-lld-rtos:SRCREV udpate to 01.00.00.03A
  i2c-lld-rtos: SRCREV update to 01.00.00.14
  icss-emac-lld: SRCREV update to 01.00.00.15
  mcasp-lld-rtos: SRCREV update to 01.01.00.13
  mcbsp-lld-rtos: SRCREV update to 01.00.00.12
  mmcsd-lld-rtos: SRCREV update to 01.00.00.15
  osal: SRCREV update to 01.00.00.14A
  pcie-lld-rtos: SRCREV update to 02.03.00.03
  pm-lld-rtos: SRCREV update to 01.08.00.21 & 01.04.00.05C (for
    ti33x,ti43x,k2g)
  pruss-lld:SRCREV update to 01.00.00.13
  sa-lld: SRCREV update to 04.00.00.02, added osal-rtos dependency for
    rtos
  sciclient-rtos: SRCREV update to 01.00.00.02A
  spi-lld-rtos: SRCREV update to 01.00.00.14A
  starterware:SRCREV update to 02.01.01.10, added dependency to
    ti-xdctools-native
  transport: SRCREV update to 01.00.00.15
  uart-lld-rtos: SRCREV update to 01.00.00.14
  udma-lld-rtos: SRCREV update to 01.00.00.02
  usb-lld-rtos: SRCREV update to 01.00.00.17
  profiling-rtos: SRCREV update to 01.00.00.08
  vps-lld-rtos: SRCREV update to 01.00.01.13A
  dsplib: Recipe enhancements to facilitate AUTOREV
  mathlib: Enhancements to facilitate AUTOREV
  swtools: Enhancements to facilitate AUTOREV
  ti-pdk-build-rtos: SRCREV update to 01.00.00.12

 recipes-bsp/board-rtos/board-rtos_git.bb         | 12 +++++-------
 recipes-bsp/common-csl-ip/common-csl-ip.inc      |  6 +++---
 recipes-bsp/emac-lld/emac-lld-rtos_git.bb        |  6 +++---
 recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb         | 10 ++++++----
 recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb        |  6 +++---
 recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb        |  6 +++---
 recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb          |  9 ++++++---
 recipes-bsp/icss-emac-lld/icss-emac-lld.inc      |  6 +++---
 recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb      |  6 +++---
 recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb      |  6 +++---
 recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb      |  6 +++---
 recipes-bsp/osal/osal.inc                        |  6 +++---
 recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb        |  6 +++---
 recipes-bsp/pm-lld/pm-lld-rtos_git.bb            | 14 +++++++-------
 recipes-bsp/pruss-lld/pruss-lld.inc              |  6 +++---
 recipes-bsp/sa-lld/sa-lld-rtos_git.bb            |  2 +-
 recipes-bsp/sa-lld/sa-lld.inc                    |  6 +++---
 recipes-bsp/sciclient/sciclient-rtos_git.bb      |  6 +++---
 recipes-bsp/spi-lld/spi-lld-rtos_git.bb          |  6 +++---
 recipes-bsp/starterware/starterware-rtos_git.bb  |  2 +-
 recipes-bsp/starterware/starterware.inc          |  6 +++---
 recipes-bsp/transport-rtos/transport.inc         |  6 +++---
 recipes-bsp/uart-lld/uart-lld-rtos_git.bb        |  8 ++++----
 recipes-bsp/udma-lld/udma-lld-rtos_git.bb        |  6 +++---
 recipes-bsp/usb-lld/usb-lld-rtos_git.bb          |  6 +++---
 recipes-bsp/utils-rtos/profiling-rtos_git.bb     |  6 +++---
 recipes-bsp/vps-lld/vps-lld-rtos_git.bb          |  6 +++---
 recipes-ti/dsplib/dsplib.inc                     | 12 +++++++++---
 recipes-ti/mathlib/mathlib.inc                   | 12 +++++++++---
 recipes-ti/swtools/swtools_git.bb                | 15 +++++++++++----
 recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb |  6 +++---
 31 files changed, 122 insertions(+), 100 deletions(-)

-- 
1.9.1


