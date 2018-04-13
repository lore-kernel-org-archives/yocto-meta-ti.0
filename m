Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AF967E00BF7; Fri, 13 Apr 2018 10:12:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 638A6E00932
	for <meta-ti@yoctoproject.org>; Fri, 13 Apr 2018 10:12:42 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3DHCfGu008116
	for <meta-ti@yoctoproject.org>; Fri, 13 Apr 2018 12:12:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1523639561;
	bh=Kaun8nM7qY2biQeqiqHRnj2nZe6A4dAfkPWceqgoGAk=;
	h=From:To:CC:Subject:Date;
	b=Cy/WQiFl4aKenSVy7199fzFi/EOL8HGjbxI5z044LVqu22WnVjGAJ9Bd7qHWVlNeP
	C05EGjSBe7CWmrcdA8sqmMvx1rDx25YkpKCiFYe4faoBt9bubcaJDjsFGbfndJqAWY
	UMfWSovZMCKQp8Yxg0RVXzwlqNSvuCrcv3Ffrcec=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3DHCfgs031807
	for <meta-ti@yoctoproject.org>; Fri, 13 Apr 2018 12:12:41 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 13 Apr 2018 12:12:41 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 13 Apr 2018 12:12:41 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3DHCfLw020225;
	Fri, 13 Apr 2018 12:12:41 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 13 Apr 2018 13:01:56 -0400
Message-ID: <1523638939-28861-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 00/23] TI RTOS Updates
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
X-List-Received-Date: Fri, 13 Apr 2018 17:12:43 -0000
Content-Type: text/plain


Mahesh Radhakrishnan (23):
  common-csl-ip: Updating to version 03.03.00.10
  emac-lld-rtos: Updating to version 01.00.03.10A
  edma3-lld:Updating to version 02.12.05.30C
  fatfs-rtos: Updating to version 01.00.00.09
  gpio-lld-rtos: Updating to version 01.00.00.10
  i2c-lld-rtos: Updating to version 01.00.00.10 & dependency updates
  icss-emac-lld: Updating to version 01.00.00.11B
  mcasp-lld-rtos: Update to version 01.01.00.09
  mcbsp-lld-rtos:Updating to version 01.00.00.09
  mmcsd-lld-rtos: Update to version 01.00.00.11
  pcie-lld-rtos: Update to version 02.02.00.12
  pruss-lld: Updating to version 01.00.00.09A
  pm-lld-rtos: Updating to version 01.04.00.04 & 01.08.00.17 for
    am57xx/dra7xx
  sa-lld: Updating to version 03.00.00.20
  serdes-diag-rtos: Update to version 01.00.00.10
  spi-lld-rtos: Update to version 01.00.00.10A
  uart-lld-rtos: Updating to version 01.00.00.10A
  usb-lld-rtos: Update to version 01.00.00.13
  board-rtos: Updating to version 01.00.10.00A
  transport-rtos: Udpate to version 1.0.0.11A
  osal: Update to version 01.00.00.10A
  starterware:starterware-rtos: Udpate to version 02.01.01.06C & rtos
    updates
  ti-pdk-build-rtos: Updating to version 01.00.00.08E which uses make
    install internally

 recipes-bsp/board-rtos/board-rtos_git.bb           |  13 +-
 .../common-csl-ip/common-csl-ip-rtos_git.bb        |   2 +-
 recipes-bsp/common-csl-ip/common-csl-ip.inc        |   6 +-
 recipes-bsp/edma3-lld/edma3-lld.inc                |   6 +-
 recipes-bsp/emac-lld/emac-lld-rtos_git.bb          |   6 +-
 recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb           |   6 +-
 recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb          |   6 +-
 recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb            |  12 +-
 recipes-bsp/icss-emac-lld/icss-emac-lld.inc        |   6 +-
 recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb        |   6 +-
 recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb        |   6 +-
 recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb        |   6 +-
 recipes-bsp/osal/osal.inc                          |   6 +-
 recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb          |   6 +-
 recipes-bsp/pm-lld/pm-lld-rtos_git.bb              |  12 +-
 recipes-bsp/pruss-lld/pruss-lld.inc                |   6 +-
 recipes-bsp/sa-lld/sa-lld.inc                      |   6 +-
 recipes-bsp/serdes-diag/serdes-diag-rtos_git.bb    |   6 +-
 recipes-bsp/spi-lld/spi-lld-rtos_git.bb            |   6 +-
 recipes-bsp/starterware/starterware-rtos_git.bb    |   7 +-
 recipes-bsp/starterware/starterware.inc            |   6 +-
 recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb    |   2 +-
 recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb   |   2 +-
 recipes-bsp/transport-rtos/nimu-rtos_git.bb        |   2 +-
 recipes-bsp/transport-rtos/transport.inc           |   6 +-
 recipes-bsp/uart-lld/uart-lld-rtos_git.bb          |   6 +-
 recipes-bsp/usb-lld/usb-lld-rtos_git.bb            |   6 +-
 recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb   | 199 +--------------------
 28 files changed, 97 insertions(+), 268 deletions(-)

-- 
2.7.4


