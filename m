Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 883EBE00B5E; Thu, 27 Sep 2018 08:23:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 39A4DE00B9F
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 08:23:26 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RFNP7D128094
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 10:23:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538061805;
	bh=uzZlC4Z7+hpRxc9NoeFy3qSr9spS458K1fd1g1Hk+IU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=RXHMI/O6iZu4sgEkM/bFqPont9d3bmbJqRyQ5/RFasf69c0p8gh3mKMWUt6Te0ih7
	nek+0V2dbHFwzLnyXk18p614WwrLsjmMIPivQAyknTRYPu/Z+5YOiGqGNkiKZhknUs
	knDng6d0AgNz9IbgoGkKGAiWOfCDhwZTRXNoKkOI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RFNPqs016481
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 10:23:25 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 10:23:26 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 27 Sep 2018 10:23:25 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RFNIJJ014983
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 10:23:25 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 27 Sep 2018 11:22:23 -0400
Message-ID: <1538061764-54977-10-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1538061764-54977-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1538061764-54977-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 09/30] icss-emac-lld: Update to version 01.00.00.13
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
X-List-Received-Date: Thu, 27 Sep 2018 15:23:26 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/icss-emac-lld/icss-emac-lld.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld.inc b/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
index d7ca641..0d1afb8 100644
--- a/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
+++ b/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
@@ -10,7 +10,7 @@ ICSS_EMAC_LLD_GIT_BRANCH = "master"
 ICSS_EMAC_LLD_GIT_DESTSUFFIX = "git/ti/drv/icss_emac"
 
 # Below commit ID corresponds to "DEV.ICSS_EMAC_LLD.01.00.00.13"
-ICSS_EMAC_LLD_SRCREV = "a4071ded3edb0cfebaa62b1f1f35686ea24585b1"
+ICSS_EMAC_LLD_SRCREV = "999692b6d60fd54a0390b1cf4724f1620e757fdf"
 
 BRANCH = "${ICSS_EMAC_LLD_GIT_BRANCH}"
 SRC_URI = "${ICSS_EMAC_LLD_GIT_URI};destsuffix=${ICSS_EMAC_LLD_GIT_DESTSUFFIX};protocol=${ICSS_EMAC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
-- 
1.9.1


