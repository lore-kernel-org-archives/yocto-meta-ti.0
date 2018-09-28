Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5AB01E00AB9; Fri, 28 Sep 2018 09:26:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0B1FFE009D9
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 09:26:33 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8SGQXWK058348
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 11:26:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538151993;
	bh=j8gkdUyLzNzCox+G4w6TgBCK2sTimaziNrC0nYD/EZU=;
	h=From:To:Subject:Date;
	b=mWVRtOB7lKY1LocCl/QpGPLpwJ5y805VkDPbA4R6mVd7M+K1URLLZTG9IjHHQTUhv
	iMVw0nxkeXLaBpsp4AJ1bCfJKfMint6GhvGhJ8nZ3nD1Zo9U4IL6A9qgRm5OM4K+Bp
	GeeLPJeHISo4Tvh5olXKEXq9qL8cu9aBwj+QrtU8=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8SGQXiv000659
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 11:26:33 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 28 Sep 2018 11:26:33 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 28 Sep 2018 11:26:33 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8SGQWMC011688
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 11:26:33 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 28 Sep 2018 12:26:01 -0400
Message-ID: <1538151990-44823-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH v3 00/29] RTOS patches(V3) for Procsdk 5.1 release
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
X-List-Received-Date: Fri, 28 Sep 2018 16:26:35 -0000
Content-Type: text/plain

This is the version 3 of the RTOS patches with the following differences from v2
1) ti-pdk.bbclass patch is removed as the changes on the v1/v2 patches are not needed.
Hence this patchset contains only 29 patches (the v1/v2 had 30 patches in them)
2) board-rtos: Corrected the DEPENDS_append_am65xx --> DEPENDS_append_k3 as per review comments
3) mcasp-lld-rtos & pcie-lld-rtos: Mentioned the LIC checksum change details (due to copyright header) in the commit description
4) Used -M01 -C01 option while sending the patches to highlight the renaming of ti-ndk_2.xxx -> ti-ndk_3.xx


Mahesh Radhakrishnan (29):
  common-csl-ip: Update to version 03.03.00.12
  osal: SRCREV update to 01.00.00.12.r1
  ti-pdk-build: Update to version 01.00.00.10A
  uart-lld-rtos: Update to version 01.00.00.12
  board-rtos: Update to version 01.00.10.02 and added support to k3
  i2c-lld-rtos: Update to version 01.00.00.02 and added support to k3
  gpio-lld-rtos: Update to version 01.00.00.12 and added support to k3
  icss-emac-lld: Update to version 01.00.00.13
  emac-lld-rtos:Update to version 01.00.03.12A and added support to k3
  starterware: Update to version 02.01.01.08
  mmcsd-lld-rtos: Update to version 01.00.00.13 and added k3 support
  mcasp-lld-rtos: Update to 01.00.00.11A and add support to k3
  fatfs-rtos: Update to version 01.00.00.11 & added k3 support
  mcbsp-lld-rtos: Update to version 01.00.00.11A
  pa-lld: Update to version 03.00.02.07
  pm-lld-rtos: Update to version 01.08.00.19 and k3 support
  udma-lld-rtos: Added support for udma-lld on rtos  (initial version)
  spi-lld-rtos: Update to version 01.00.00.12A and added k3 support
  pcie-lld-rtos: Update to version 02.03.00.01 and added k3 support
  pruss-lld: pruss-lld-rtos: Update to version 01.00.00.11 and added k3
    support for rtos
  sa-lld: sa-lld-rtos: Updated to version 04.00.00.00A, added k3 support
    and makefile build for k3
  transport-rtos: nimu-rtos: Updated to version 01.00.00.13 & added k3
    support
  sciclient-rtos: SRCREV update
  usb-lld-rtos: update to versin 01.00.00.15A and added k3 support
  profiling-rtos: Update to version 01.00.00.07 and added k3 support
  vps-lld-rtos: Updated to version 01.00.01.13
  ti-ndk: Upgrading to 3.40.01.01
  ti-ns: Adding support for TI network services
  cmb-addon: Update to version 01.01.00.02

 recipes-bsp/board-rtos/board-rtos_git.bb           | 15 +++--
 recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb        |  6 +-
 recipes-bsp/common-csl-ip/common-csl-ip.inc        |  7 +-
 recipes-bsp/emac-lld/emac-lld-rtos_git.bb          | 11 ++--
 recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb           |  8 +--
 recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb          |  8 +--
 recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb            |  8 +--
 recipes-bsp/icss-emac-lld/icss-emac-lld.inc        |  2 +-
 recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb        | 15 +++--
 recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb        |  6 +-
 recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb        |  9 +--
 recipes-bsp/osal/osal.inc                          |  4 +-
 recipes-bsp/pa-lld/pa-lld.inc                      |  6 +-
 recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb          | 13 ++--
 recipes-bsp/pm-lld/pm-lld-rtos_git.bb              | 30 +++++----
 recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb        |  1 +
 recipes-bsp/pruss-lld/pruss-lld.inc                |  6 +-
 recipes-bsp/sa-lld/sa-lld-rtos_git.bb              | 14 +++-
 recipes-bsp/sa-lld/sa-lld.inc                      |  6 +-
 recipes-bsp/sciclient/sciclient-rtos_git.bb        |  6 +-
 recipes-bsp/spi-lld/spi-lld-rtos_git.bb            | 12 ++--
 recipes-bsp/starterware/starterware.inc            |  6 +-
 recipes-bsp/transport-rtos/nimu-rtos_git.bb        |  3 +-
 recipes-bsp/transport-rtos/transport.inc           |  6 +-
 recipes-bsp/uart-lld/uart-lld-rtos_git.bb          | 11 ++--
 .../udma-lld-rtos_git.bb}                          | 75 +++++++++-------------
 recipes-bsp/usb-lld/usb-lld-rtos_git.bb            |  8 +--
 recipes-bsp/utils-rtos/profiling-rtos_git.bb       |  8 +--
 recipes-bsp/vps-lld/vps-lld-rtos_git.bb            |  6 +-
 recipes-ti/includes/ti-paths.inc                   |  2 +
 .../{ti-ndk_2.26.00.08.bb => ti-ndk_3.40.01.01.bb} |  8 +--
 .../ti-pdk-build-rtos_git.bb => ns/ti-ns.inc}      | 48 ++++----------
 .../ti-ns_2.40.01.02.bb}                           | 11 ++--
 recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb   |  6 +-
 34 files changed, 204 insertions(+), 187 deletions(-)
 copy recipes-bsp/{sciclient/sciclient-rtos_git.bb => udma-lld/udma-lld-rtos_git.bb} (22%)
 copy recipes-ti/ndk/{ti-ndk_2.26.00.08.bb => ti-ndk_3.40.01.01.bb} (31%)
 copy recipes-ti/{ti-pdk-build/ti-pdk-build-rtos_git.bb => ns/ti-ns.inc} (5%)
 rename recipes-ti/{ndk/ti-ndk_2.26.00.08.bb => ns/ti-ns_2.40.01.02.bb} (21%)

-- 
1.9.1


