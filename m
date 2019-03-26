Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8DD03E00D11; Tue, 26 Mar 2019 15:34:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5DDCFE00A54
	for <meta-ti@yoctoproject.org>; Tue, 26 Mar 2019 15:34:58 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2QMYvAw112698
	for <meta-ti@yoctoproject.org>; Tue, 26 Mar 2019 17:34:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553639697;
	bh=/e2cxZGgM5CUgrHjO89conDHu5ZdaO3J3KcOwyv1Qb0=;
	h=From:To:Subject:Date;
	b=G1r2cCdujqGqH7tlWhn00InRjUae9KDGB5uIRa24JSUpgsbKx0cEfOIsO3JSPjsMS
	ddKqAu+7wmon/9jxzlOxKC+jviE2cB6FXhSxGBetMNcsj9TQjJM//vnkkzij+iBOJi
	wjBN2b4AzpNI1kZvRQPgK81bnKvKujSCrJzPDnCM=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2QMYveq052906
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 26 Mar 2019 17:34:57 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 26 Mar 2019 17:34:57 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 26 Mar 2019 17:34:56 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x2QMYuVO126272
	for <meta-ti@yoctoproject.org>; Tue, 26 Mar 2019 17:34:56 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 26 Mar 2019 18:34:47 -0400
Message-ID: <1553639694-36968-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 0/7] RTOS Patchset-2 for 5.3 release
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
X-List-Received-Date: Tue, 26 Mar 2019 22:34:59 -0000
Content-Type: text/plain

RTOS Patchset-2 contains bug fixes and HS support on top of Patchset-1 submitted a week ago

Mahesh Radhakrishnan (7):
  common-csl-ip: SRCREV bump to 03.03.00.14C
  emac-lld-rtos: SRCREV bump to 01.00.03.14B
  mmcsd-lld-rtos: SRCREV bump to 01.00.00.15A
  transport-rtos: SRCREV bump to version 01.00.00.15A
  ti-pdk-build-rtos: SRCREV bump to version 01.00.00.12A
  icss-emac-lld: SRCREV bump to 01.00.00.15
  sciclient-rtos: SRCREV bump to 01.00.00.02B

 recipes-bsp/common-csl-ip/common-csl-ip.inc      | 6 +++---
 recipes-bsp/emac-lld/emac-lld-rtos_git.bb        | 6 +++---
 recipes-bsp/icss-emac-lld/icss-emac-lld.inc      | 6 +++---
 recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb      | 6 +++---
 recipes-bsp/sciclient/sciclient-rtos_git.bb      | 6 +++---
 recipes-bsp/transport-rtos/transport.inc         | 6 +++---
 recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb | 6 +++---
 7 files changed, 21 insertions(+), 21 deletions(-)

-- 
1.9.1


