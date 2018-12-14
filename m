Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 54D60E00DE2; Fri, 14 Dec 2018 11:31:57 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 69779E00B45
	for <meta-ti@yoctoproject.org>; Fri, 14 Dec 2018 11:31:49 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBEJVmZk040518
	for <meta-ti@yoctoproject.org>; Fri, 14 Dec 2018 13:31:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544815908;
	bh=7nOSOqdlBgfW6bj5QCVECuEBvdPLY5386rjJCtmdINk=;
	h=From:To:Subject:Date;
	b=jHK+xpT/4mKqkkx1NSd/viZ6xquKrVV5Xi4J7xpJ+aKimmU9iGbmaSYXUt+HfHX0N
	eSRTMlojFy4fpgq3yuFJQinRmDLZSUe6i5oEVpfebVwratWIovnwEd/Z0JP4d9bxoC
	IAb8FWPh04/ktVh1sxIhB5ZJQVrt8P31uebJSchk=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBEJVmq2087379
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 14 Dec 2018 13:31:48 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 14 Dec 2018 13:31:48 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 14 Dec 2018 13:31:48 -0600
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBEJVmd0031115
	for <meta-ti@yoctoproject.org>; Fri, 14 Dec 2018 13:31:48 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 14 Dec 2018 14:31:09 -0500
Message-ID: <1544815903-10792-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 00/34] RTOS patches for procsdk 5.2 release
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
X-List-Received-Date: Fri, 14 Dec 2018 19:31:57 -0000
Content-Type: text/plain

The below is the patchset for RTOS PROCSDK 5.2 release

Mahesh Radhakrishnan (34):
  aif2-lld: SRCREV update to 01.02.00.02A
  bcp-lld-rtos: SRCREV update to 02.01.00.07A
  board-rtos: SRCREV update to 01.00.10.03
  cmb-addon-rtos: SRCREV update to 01.01.00.03
  common-csl-ip: SRCREV update to 03.03.00.13 and use 'release' branch
  cppi-lld: SRCREV update to 02.01.00.14
  emac-lld-rtos: SRCREV update to  01.00.03.13A
  fatfs-rtos: SRCREV update to 01.00.00.12A
  fftc-lld-rtos: SRCREV update to 02.02.00.07A
  gpio-lld-rtos: SRCREV update to 01.00.00.13A, added sciclient
    dependency for k3
  i2c-lld-rtos: SRCREV update to 01.00.00.13
  icss-emac-lld: SRCREV update to 01.00.00.14
  mcasp-lld-rtos: SRCREV update to 01.01.00.12
  mmcsd-lld-rtos: SRCREV udpate to 01.00.00.14, added sciclient
    dependency for k3
  osal: SRCREV udpate to 01.00.00.13
  pa-lld: SRCREV update to 03.00.02.08
  pcie-lld-rtos: SRCREV update to 02.03.00.02
  pm-lld-rtos: SRCREV udpate to 01.08.00.20
  prueth-fw: SRCREV update to ICSS EMAC version 01.00.00.14
  pruss-lld: SRCREV update to 01.00.00.12
  rm-lld: SRCREV update to 02.02.00.03A
  sa-lld: SRCREV update to 04.00.00.01
  sciclient-rtos: SRCREV udpate to 01.00.00.01
  serdes-diag-rtos: SRCREV update to 01.00.00.11A
  spi-lld-rtos: SRCREV update to 01.00.00.13, added dependencies to
    pruss-lld-rtos & gpio-lld-rtos for am33x/am43x
  starterware: SRCREV update to 02.01.01.09
  tcp3d-lld-rtos: SRCREV update to 02.01.00.06A
  transport-rtos: SRCREV update to 01.00.00.14
  uart-lld-rtos: SRCREV update to 01.00.00.13
  nimu-rtos: Adding dependency to pruss-lld-rtos for k3
  udma-lld-rtos: SRCREV update to 01.00.00.01
  usb-lld-rtos: SRCREV update to 01.00.00.16B, add dependency to
    sciclient-rtos for k3
  ipc: SRCREV updates for version 03.50.03.04
  ti-pdk-build-rtos: SCREV update to 01.00.00.11

 recipes-bsp/aif2-lld/aif2-lld.inc                |  6 +++---
 recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb          |  6 +++---
 recipes-bsp/board-rtos/board-rtos_git.bb         |  6 +++---
 recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb      |  6 +++---
 recipes-bsp/common-csl-ip/common-csl-ip.inc      | 10 +++++-----
 recipes-bsp/cppi-lld/cppi-lld.inc                |  6 +++---
 recipes-bsp/emac-lld/emac-lld-rtos_git.bb        |  6 +++---
 recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb         |  6 +++---
 recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb        |  6 +++---
 recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb        |  8 +++++---
 recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb          |  6 +++---
 recipes-bsp/icss-emac-lld/icss-emac-lld.inc      |  6 +++---
 recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb      |  6 +++---
 recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb      |  9 ++++++---
 recipes-bsp/osal/osal.inc                        |  8 ++++----
 recipes-bsp/pa-lld/pa-lld.inc                    |  6 +++---
 recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb        |  6 +++---
 recipes-bsp/pm-lld/pm-lld-rtos_git.bb            |  6 +++---
 recipes-bsp/prueth-fw/prueth-fw_git.bb           |  6 +++---
 recipes-bsp/pruss-lld/pruss-lld.inc              |  6 +++---
 recipes-bsp/rm-lld/rm-lld.inc                    |  6 +++---
 recipes-bsp/sa-lld/sa-lld.inc                    |  6 +++---
 recipes-bsp/sciclient/sciclient-rtos_git.bb      |  8 ++++----
 recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb  |  6 +++---
 recipes-bsp/spi-lld/spi-lld-rtos_git.bb          | 10 +++++-----
 recipes-bsp/starterware/starterware.inc          |  6 +++---
 recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb      |  6 +++---
 recipes-bsp/transport-rtos/nimu-rtos_git.bb      |  2 +-
 recipes-bsp/transport-rtos/transport.inc         |  6 +++---
 recipes-bsp/uart-lld/uart-lld-rtos_git.bb        |  6 +++---
 recipes-bsp/udma-lld/udma-lld-rtos_git.bb        |  6 +++---
 recipes-bsp/usb-lld/usb-lld-rtos_git.bb          |  7 ++++---
 recipes-ti/ipc/ipc-transport.inc                 |  8 ++++----
 recipes-ti/ipc/ti-ipc-common.inc                 |  2 +-
 recipes-ti/ipc/ti-ipc-rtos.inc                   |  8 ++++----
 recipes-ti/ipc/ti-ipc.inc                        |  4 ++--
 recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb |  6 +++---
 37 files changed, 120 insertions(+), 114 deletions(-)

-- 
1.9.1


