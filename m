Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9C1BBE00ADD; Sun,  6 Oct 2019 09:53:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 06B69E00ADD
	for <meta-ti@yoctoproject.org>; Sun,  6 Oct 2019 09:52:55 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x96GqtTG100608
	for <meta-ti@yoctoproject.org>; Sun, 6 Oct 2019 11:52:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1570380775;
	bh=bN9vj5N9dNAwpnFNw6c4Gy/dzdHBDOJQgeHZV1fqLV8=;
	h=From:To:Subject:Date;
	b=hwSDf9tlgMEqmyHTyJJMDUvIhVSxqGePnjHKYZ4/6atsW77GpWZFbW+tLjb3u7x8X
	H36knn4zqyXf+VGeINygNTRxT2rKlCK5DdvFf/164HTbMkIs4XpV1R0tQwgXT2IYBB
	Er6Gp5mrkIHaVGlnltA6Te/xo1qrE2RNxBkYlln0=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x96Gqt9G077752
	for <meta-ti@yoctoproject.org>; Sun, 6 Oct 2019 11:52:55 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Sun, 6 Oct 2019 11:52:53 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Sun, 6 Oct 2019 11:52:53 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x96GqsJv103999
	for <meta-ti@yoctoproject.org>; Sun, 6 Oct 2019 11:52:54 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Sun, 6 Oct 2019 12:52:38 -0400
Message-ID: <1570380771-1351-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 00/13] *** 6.1 RTOS Patchset-2 ***
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
X-List-Received-Date: Sun, 06 Oct 2019 16:53:00 -0000
Content-Type: text/plain

This is the RTOS Patchset #2 which address the below 
 - Critical Bug fixes for 6.1
 - Static analysis issues
 - Doxygen issues

Mahesh Radhakrishnan (13):
  board-rtos: SRCREV update to 01.00.10.06D
  common-csl-ip: SRCREV update to 03.03.00.16B
  emac-lld: SRCREV udpate to 01.00.03.18
  gpio-llld-rtos: SRCREV udpate to 01.00.00.16B
  i2c-lld-rtos: SRCREV update to 01.00.00.16A
  mcasp-lld-rtos: SRCREV update to 01.01.00.15A
  mmcsd-lld-rtos: SRCREV uppdate to 01.00.00.17C
  osal: SRCREV udpate to 01.00.00.16B
  pruss-lld: SRCREV update to 01.00.00.15A
  sa-lld: SRCREV update to 04.00.00.03B
  spi-lld-rtos: SRCREV update to 01.00.00.16A
  uart-lld-rtos: SRCREV update to 01.00.00.16B
  ti-pdk-build-rtos: SRCREV update to 01.00.00.14A

 recipes-bsp/board-rtos/board-rtos_git.bb         | 6 +++---
 recipes-bsp/common-csl-ip/common-csl-ip.inc      | 6 +++---
 recipes-bsp/emac-lld/emac-lld.inc                | 6 +++---
 recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb        | 6 +++---
 recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb          | 6 +++---
 recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb      | 6 +++---
 recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb      | 6 +++---
 recipes-bsp/osal/osal.inc                        | 6 +++---
 recipes-bsp/pruss-lld/pruss-lld.inc              | 6 +++---
 recipes-bsp/sa-lld/sa-lld.inc                    | 6 +++---
 recipes-bsp/spi-lld/spi-lld-rtos_git.bb          | 6 +++---
 recipes-bsp/uart-lld/uart-lld-rtos_git.bb        | 6 +++---
 recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb | 6 +++---
 13 files changed, 39 insertions(+), 39 deletions(-)

-- 
1.9.1


