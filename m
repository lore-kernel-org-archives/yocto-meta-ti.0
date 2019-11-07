Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D8B76E00E0B; Thu,  7 Nov 2019 10:09:50 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 28EC5E0083C
	for <meta-ti@yoctoproject.org>; Thu,  7 Nov 2019 10:09:46 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9k0Y020086
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573150186;
	bh=ZblZUb8/kGW5uvFXx5Wuox9Xn4iMLQHkXCmBwpg/oNs=;
	h=From:To:CC:Subject:Date;
	b=atOmmFANChlFizhI8P/XQRGPGR4/IVlAt8m/VboEvFbePS0Xz5rGrmnN3BXCoOFpo
	dpfFHT0a+KHxMTNEU8vIouPRYygEpRs7p5dCM455XhuByHfnFyvEKuneoyRaRAwVBw
	9sfBekgemm2PWQxbISY6gUrrNVNev55PiyAYVAkQ=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA7I9kJo070918
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:46 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 7 Nov 2019 12:09:30 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 7 Nov 2019 12:09:30 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9jI6067418;
	Thu, 7 Nov 2019 12:09:45 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 7 Nov 2019 12:49:55 -0500
Message-ID: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][RFC 00/42] Unify PDK sources
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
X-List-Received-Date: Thu, 07 Nov 2019 18:09:51 -0000
Content-Type: text/plain

The PDK sources have been unified in a single git repository. To
simplify maintenance, a bbclass is added to specify the source
information. This class also extends the unpack task so that each
recipe is only presented with its component sources. This leaves
subsequent tasks (do_compile, etc) identical to previous sources.

The source repo is not yet available, so submit as an RFC for now.

Jacob Stiffler (42):
  ti-pdk-fetch: add class for common pdk sources
  aif2-lld: migrate to ti-pdk-fetch.bbclass
  bcp-lld: migrate to ti-pdk-fetch.bbclass
  board-rtos: migrate to ti-pdk-fetch.bbclass
  cppi-lld: migrate to ti-pdk-fetch.bbclass
  dfe-lld: migrate to ti-pdk-fetch.bbclass
  emac-lld: migrate to ti-pdk-fetch.bbclass
  fatfs-rtos: migrate to ti-pdk-fetch.bbclass
  fftc-lld: migrate to ti-pdk-fetch.bbclass
  gpio-lld: migrate to ti-pdk-fetch.bbclass
  gpmc-lld: migrate to ti-pdk-fetch.bbclass
  hyplnk-lld: migrate to ti-pdk-fetch.bbclass
  i2c-lld: migrate to ti-pdk-fetch.bbclass
  icss-emac-lld: migrate to ti-pdk-fetch.bbclass
  ipc-lld: migrate to ti-pdk-fetch.bbclass
  iqn2-lld: migrate to ti-pdk-fetch.bbclass
  mcasp-lld: migrate to ti-pdk-fetch.bbclass
  mcbsp-lld: migrate to ti-pdk-fetch.bbclass
  mmcsd-lld: migrate to ti-pdk-fetch.bbclass
  nwal-lld: migrate to ti-pdk-fetch.bbclass
  osal: migrate to ti-pdk-fetch.bbclass
  pa-lld: migrate to ti-pdk-fetch.bbclass
  pcie-lld: migrate to ti-pdk-fetch.bbclass
  pru: migrate to ti-pdk-fetch.bbclass
  prueth-fw: migrate to ti-pdk-fetch.bbclass
  pruss-lld: migrate to ti-pdk-fetch.bbclass
  qmss-lld: migrate to ti-pdk-fetch.bbclass
  rm-lld: migrate to ti-pdk-fetch.bbclass
  sciclient: migrate to ti-pdk-fetch.bbclass
  spi-lld: migrate to ti-pdk-fetch.bbclass
  srio-lld: migrate to ti-pdk-fetch.bbclass
  tcp3d-lld: migrate to ti-pdk-fetch.bbclass
  transport-rtos: migrate to ti-pdk-fetch.bbclass
  tsip-lld: migrate to ti-pdk-fetch.bbclass
  uart-lld: migrate to ti-pdk-fetch.bbclass
  udma-lld: migrate to ti-pdk-fetch.bbclass
  usb-lld: migrate to ti-pdk-fetch.bbclass
  utils-rtos: migrate to ti-pdk-fetch.bbclass
  ti-pdk-build: migrate to ti-pdk-fetch.bbclass
  cal-lld: TI RTOS low level driver for CAL
  fvid2: TI RTOS Video Driver Interface
  iolink-lld: TI RTOS low level driver for IO-Link Master

 classes/ti-pdk-fetch.bbclass                     | 30 ++++++++++
 recipes-bsp/aif2-lld/aif2-lld.inc                | 16 +----
 recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb          | 18 +-----
 recipes-bsp/board-rtos/board-rtos_git.bb         | 14 +----
 recipes-bsp/cal-lld/cal-lld-rtos_git.bb          | 76 ++++++++++++++++++++++++
 recipes-bsp/cppi-lld/cppi-lld.inc                | 16 +----
 recipes-bsp/dfe-lld/dfe-lld.inc                  | 16 +----
 recipes-bsp/emac-lld/emac-lld.inc                | 15 +----
 recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb         | 16 +----
 recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb        | 20 +------
 recipes-bsp/fvid2/fvid2-rtos_git.bb              | 68 +++++++++++++++++++++
 recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb        | 18 +-----
 recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb        | 15 +----
 recipes-bsp/hyplnk-lld/hyplnk-lld.inc            | 18 ++----
 recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb          | 17 +-----
 recipes-bsp/icss-emac-lld/icss-emac-lld.inc      | 16 +----
 recipes-bsp/iolink-lld/iolink-lld-rtos_git.bb    | 31 ++++++++++
 recipes-bsp/ipc-lld/ipc-lld.inc                  | 18 ++----
 recipes-bsp/iqn2-lld/iqn2-lld.inc                | 16 +----
 recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb      | 17 +-----
 recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb      | 18 +-----
 recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb      | 17 +-----
 recipes-bsp/nwal-lld/nwal-lld.inc                | 17 ++----
 recipes-bsp/osal/osal-rtos_git.bb                |  2 -
 recipes-bsp/osal/osal-test_git.bb                |  2 -
 recipes-bsp/osal/osal.inc                        | 16 ++---
 recipes-bsp/osal/osal_git.bb                     |  2 -
 recipes-bsp/pa-lld/pa-lld.inc                    | 16 +----
 recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb        | 18 +-----
 recipes-bsp/pru/pru-pwm-fw_git.bb                |  9 +--
 recipes-bsp/pru/pru-swuart-fw_git.bb             | 10 ++--
 recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb     |  6 +-
 recipes-bsp/prueth-fw/prueth-fw_git.bb           |  7 ++-
 recipes-bsp/pruss-lld/pruss-lld-apps_git.bb      |  2 -
 recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb      |  2 -
 recipes-bsp/pruss-lld/pruss-lld-test_git.bb      |  2 -
 recipes-bsp/pruss-lld/pruss-lld.inc              | 15 +----
 recipes-bsp/pruss-lld/pruss-lld_git.bb           |  2 -
 recipes-bsp/qmss-lld/qmss-lld.inc                | 16 +----
 recipes-bsp/rm-lld/rm-lld.inc                    | 16 +----
 recipes-bsp/sciclient/sciclient-rtos_git.bb      | 18 ++----
 recipes-bsp/spi-lld/spi-lld-rtos_git.bb          | 16 +----
 recipes-bsp/srio-lld/srio-lld.inc                | 16 +----
 recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb      | 19 +-----
 recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb  |  4 +-
 recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb |  4 +-
 recipes-bsp/transport-rtos/nimu-rtos_git.bb      |  4 +-
 recipes-bsp/transport-rtos/timesync-rtos_git.bb  | 32 ++++++++++
 recipes-bsp/transport-rtos/transport.inc         | 14 +----
 recipes-bsp/tsip-lld/tsip-lld-rtos_git.bb        | 16 +----
 recipes-bsp/uart-lld/uart-lld-rtos_git.bb        | 16 +----
 recipes-bsp/udma-lld/udma-lld-rtos_git.bb        | 18 ++----
 recipes-bsp/usb-lld/usb-lld-rtos_git.bb          | 16 +----
 recipes-bsp/utils-rtos/profiling-rtos_git.bb     | 16 +----
 recipes-bsp/utils-rtos/trace-rtos_git.bb         | 16 +----
 recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb | 19 +-----
 56 files changed, 372 insertions(+), 538 deletions(-)
 create mode 100644 classes/ti-pdk-fetch.bbclass
 create mode 100644 recipes-bsp/cal-lld/cal-lld-rtos_git.bb
 create mode 100755 recipes-bsp/fvid2/fvid2-rtos_git.bb
 create mode 100644 recipes-bsp/iolink-lld/iolink-lld-rtos_git.bb
 create mode 100644 recipes-bsp/transport-rtos/timesync-rtos_git.bb

-- 
2.7.4


