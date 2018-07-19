Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5E2EBE0160B; Thu, 19 Jul 2018 10:24:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 07BFDE00E04
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 10:24:25 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6JHOPYP021988
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532021065;
	bh=BOH8YCHdH5BGs/Re210+OPO8F5xjanmUaG7SVETX+OQ=;
	h=From:To:Subject:Date;
	b=Bf1Vd61xgrYpXrP1Xm72pktZzpscX7V6bu82Czrt8v64etFaEEA7wypYCGejMUEPa
	0d21h4kbRqOU6Z8vs8DwVACQVGtlsiOTNT1vclzvkVgWfsgRQ/wo/qzQiOKo3Jg1cq
	yZndlQdtVpj8FeJDvEoSXstGc3KVVkzjfWCCYjeI=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHOPhT011509
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:25 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 19 Jul 2018 12:24:24 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 19 Jul 2018 12:24:24 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHOORU023684
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:24 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 19 Jul 2018 13:23:33 -0400
Message-ID: <1532021058-48916-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 00/45] SRCREV updates for RTOS recipes
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
X-List-Received-Date: Thu, 19 Jul 2018 17:24:30 -0000
Content-Type: text/plain

This patchset contains SRCREV updates for Processor SDK RTOS 5.0 release components

Mahesh Radhakrishnan (45):
  mmap-lld: Update to version 2.0.0.8A & adding rtos recipe
  aif2-lld: Update to version 1.2.0.2
  bcp-lld-rtos: Update to version 2.1.0.7
  board-rtos: Update to version 1.0.10.1
  cmb-addon-rtos: Update to version 1.1.0.1
  common-csl-ip: Update to version 3.3.0.11A
  cppi-lld: Update to version 2.1.0.13
  dfe-lld: Update to version 1.0.0.9
  emac-lld-rtos:Update to version 1.0.3.11
  fatfs-rtos: Update to version 1.0.0.10
  faultmanagement-rtos: Update to version 1.0.1.4
  fftc-lld-rtos: Update to version 2.2.0.7
  gpio-lld-rtos: Update to version 1.0.0.11
  gpmc-lld-rtos: Update to version 1.0.0.2
  hyplnk-lld: Update to version 2.1.0.8
  i2c-lld-rtos: Update to version 1.0.0.11
  icss-emac-lld: Update to version 1.0.0.12
  iqn2-lld: Update to version 1.0.0.11
  mcasp-lld-rtos: Update to version 1.1.0.10
  mcbsp-lld-rtos: Update to version 1.0.0.10 after adding support for
    ompal1,makefile based build
  mmcsd-lld-rtos: Update to version 1.0.0.12
  nwal-lld: Update to version 2.1.0.12
  osal: Update to version 1.0.0.11
  pa-lld: Update to version 3.0.2.6
  pcie-lld-rtos: Update to version 2.2.0.13
  pktlib: Update to version 2.1.0.8A
  pm-lld-rtos: Update to version 1.4.0.5A and 1.8.0.18 (am57xx & dra7xx)
  pruss-lld: Update to version 1.0.0.10
  qmss-lld: Update to version 2.1.0.16
  rm-lld: Update to 2.2.0.3 & recipe update to rtos recipe (html doc
    link)
  sa-lld: Update to version 3.0.0.21
  serdes-diag-rtos: Update to version 1.0.0.11
  spi-lld-rtos: Update to version 1.0.0.11
  srio-lld: Update to version 2.0.0.17
  starterware: Update to version 2.1.1.7
  tcp3d-lld-rtos: Update to version 2.1.0.6
  traceframework: Update to version 1.1.1.9
  transport-rtos: Update to version 1.0.0.12
  tsip-lld-rtos: Update to version 1.0.0.8
  uart-lld-rtos: Update to version 1.0.0.11
  usb-lld-rtos: Update to version 1.0.0.14
  profiling-rtos: Update to version 1.0.0.6
  vps-lld-rtos: Update to version 1.0.1.11A
  wdtimer-rtos: Update to version 1.0.0.4
  ti-pdk-build-rtos: Update to version 1.0.0.9A

 recipes-bsp/aif2-lld/aif2-lld.inc                       |  6 +++---
 recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb                 |  6 +++---
 recipes-bsp/board-rtos/board-rtos_git.bb                |  6 +++---
 recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb             |  6 +++---
 recipes-bsp/common-csl-ip/common-csl-ip.inc             |  6 +++---
 recipes-bsp/cppi-lld/cppi-lld.inc                       |  8 ++++----
 recipes-bsp/dfe-lld/dfe-lld.inc                         |  6 +++---
 recipes-bsp/emac-lld/emac-lld-rtos_git.bb               |  6 +++---
 recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb                |  6 +++---
 recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb |  6 +++---
 recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb               |  6 +++---
 recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb               |  6 +++---
 recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb               |  6 +++---
 recipes-bsp/hyplnk-lld/hyplnk-lld.inc                   |  6 +++---
 recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb                 |  6 +++---
 recipes-bsp/icss-emac-lld/icss-emac-lld.inc             |  6 +++---
 recipes-bsp/iqn2-lld/iqn2-lld.inc                       |  6 +++---
 recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb             |  6 +++---
 recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb             | 13 +++++++++----
 recipes-bsp/mmap-lld/mmap-lld-rtos_git.bb               | 10 ++++++++++
 recipes-bsp/mmap-lld/mmap-lld.inc                       |  6 +++---
 recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb             |  6 +++---
 recipes-bsp/nwal-lld/nwal-lld.inc                       |  6 +++---
 recipes-bsp/osal/osal.inc                               |  6 +++---
 recipes-bsp/pa-lld/pa-lld.inc                           |  6 +++---
 recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb               |  6 +++---
 recipes-bsp/pktlib/pktlib.inc                           |  8 ++++----
 recipes-bsp/pm-lld/pm-lld-rtos_git.bb                   | 12 ++++++------
 recipes-bsp/pruss-lld/pruss-lld.inc                     |  6 +++---
 recipes-bsp/qmss-lld/qmss-lld.inc                       |  6 +++---
 recipes-bsp/rm-lld/rm-lld-rtos_git.bb                   |  6 +++++-
 recipes-bsp/rm-lld/rm-lld.inc                           |  8 ++++----
 recipes-bsp/sa-lld/sa-lld.inc                           |  6 +++---
 recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb         |  6 +++---
 recipes-bsp/spi-lld/spi-lld-rtos_git.bb                 |  6 +++---
 recipes-bsp/srio-lld/srio-lld.inc                       |  8 ++++----
 recipes-bsp/starterware/starterware.inc                 |  6 +++---
 recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb             |  6 +++---
 recipes-bsp/traceframework/traceframework.inc           |  8 ++++----
 recipes-bsp/transport-rtos/transport.inc                |  6 +++---
 recipes-bsp/tsip-lld/tsip-lld-rtos_git.bb               |  6 +++---
 recipes-bsp/uart-lld/uart-lld-rtos_git.bb               |  6 +++---
 recipes-bsp/usb-lld/usb-lld-rtos_git.bb                 |  6 +++---
 recipes-bsp/utils-rtos/profiling-rtos_git.bb            |  6 +++---
 recipes-bsp/vps-lld/vps-lld-rtos_git.bb                 |  6 +++---
 recipes-bsp/wdtimer/wdtimer-rtos_git.bb                 |  6 +++---
 recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb        |  6 +++---
 47 files changed, 164 insertions(+), 145 deletions(-)
 create mode 100644 recipes-bsp/mmap-lld/mmap-lld-rtos_git.bb

-- 
1.9.1


