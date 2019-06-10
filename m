Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0FFF8E00D39; Mon, 10 Jun 2019 16:22:27 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 83E85E00D39
	for <meta-ti@yoctoproject.org>; Mon, 10 Jun 2019 16:22:26 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5ANMPJx079962
	for <meta-ti@yoctoproject.org>; Mon, 10 Jun 2019 18:22:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560208945;
	bh=r1mIJkc2ZV+Jo9KBN2cl/DuPQ8ZEt86/zoqg0qUsLk4=;
	h=From:To:CC:Subject:Date;
	b=x+3NnPudQ+PAJn3zYaKT3rN9jZ9+B6yB/Lv8rpU6hriCGJ76s/6s/2qmGXi1rtgXV
	sezSC3d5GrBYFM2UEctEdhc6nY6WmCBMCIDCsv2B4MSUwKuAjSuEZyoV33FInuUh6l
	dbcnDvbpc3QZHlAjwnilv+cu5Mnk2rV2fslCdCck=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5ANMPIh111384
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 10 Jun 2019 18:22:25 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 10 Jun 2019 18:22:25 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 10 Jun 2019 18:22:25 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5ANMPBr015621;
	Mon, 10 Jun 2019 18:22:25 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 10 Jun 2019 23:10:02 +0000
Message-ID: <20190610231006.29913-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 0/4] Initial support for J7 (J721e SoC) platform
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
X-List-Received-Date: Mon, 10 Jun 2019 23:22:27 -0000
Content-Type: text/plain

Add initial J7 (J721e SoC) platform support.

For more details regarding the SoC, please see the first patch in the series,
that adds OE machine configuration.

Denys Dmytriyenko (4):
  j7-evm: add config for J7 (J721e) machine
  arm-trusted-firmware: update to the latest with support for J7
  u-boot-ti-staging: update to the latest with support for J7
  linux-ti-staging: update to the latest with support for J7

 conf/machine/j7-evm.conf                      | 28 +++++++++++++++++++
 .../arm-trusted-firmware_2.0.bb               |  4 +--
 .../u-boot/u-boot-ti-staging_2019.01.bb       |  6 ++--
 .../linux/linux-ti-staging-rt_4.19.bb         |  2 +-
 recipes-kernel/linux/linux-ti-staging_4.19.bb |  4 +--
 5 files changed, 36 insertions(+), 8 deletions(-)
 create mode 100644 conf/machine/j7-evm.conf

-- 
2.17.1


