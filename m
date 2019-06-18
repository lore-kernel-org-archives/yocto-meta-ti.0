Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 64603E00D9E; Tue, 18 Jun 2019 12:16:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7D036E00CD5
	for <meta-ti@yoctoproject.org>; Tue, 18 Jun 2019 12:16:21 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5IJGKSX055494
	for <meta-ti@yoctoproject.org>; Tue, 18 Jun 2019 14:16:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560885380;
	bh=+xrBCYTTzghPssqMI/Is4J39jfHHouCZDD8x0to5Ei4=;
	h=From:To:CC:Subject:Date;
	b=osi/Bya1lo3lkNY5lilgQbwSFsvii2suU2qOZucHdIG1I5fTGiDWBOeznzO53MyAD
	ZYRnIr4zpRWwqjBr6ygDFIVvitwpS3kGr4AmXExKZCfE9uZfUSUdaANlI87al4l0/v
	iHVCRC0Vh/u2hoRToMUE3mlrA5wJw0K2tK3jNlBI=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5IJGKBr092884
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 18 Jun 2019 14:16:20 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 18 Jun 2019 14:16:20 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 18 Jun 2019 14:16:20 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5IJGKUX113016;
	Tue, 18 Jun 2019 14:16:20 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 18 Jun 2019 15:00:13 -0400
Message-ID: <1560884418-23216-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: rogerq@ti.com
Subject: [master/thud][PATCH 0/5] Build am65xx prueth-fw from source
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
X-List-Received-Date: Tue, 18 Jun 2019 19:16:23 -0000
Content-Type: text/plain

Build prueth-fw for am65xx from sources and remove existing prebuilt
firmware recipe.

Jacob Stiffler (5):
  emac-lld-rtos: update to version 01.00.03.15
  emac-lld: separate SRC_URI in inc file
  prueth-fw-am65xx: build am65xx prueth-fw from source
  linux-ti-staging: switch RDEPENDS to prueth-fw-am65xx
  prueth-fw-bin: remove prebuilt firmware recipe

 recipes-bsp/emac-lld/emac-lld-rtos_git.bb     | 18 +++--------
 recipes-bsp/emac-lld/emac-lld.inc             | 17 +++++++++++
 recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb  | 44 +++++++++++++++++++++++++++
 recipes-bsp/prueth-fw/prueth-fw-bin_git.bb    | 32 -------------------
 recipes-kernel/linux/linux-ti-staging_4.19.bb |  2 +-
 5 files changed, 66 insertions(+), 47 deletions(-)
 create mode 100644 recipes-bsp/emac-lld/emac-lld.inc
 create mode 100644 recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
 delete mode 100644 recipes-bsp/prueth-fw/prueth-fw-bin_git.bb

-- 
2.7.4


