Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E0155E00C09; Thu, 27 Sep 2018 08:23:51 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 89B18E00BC4
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 08:23:27 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RFNRX3109190
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 10:23:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538061807;
	bh=XqZy7zEph+K66Yilp80ykqiTR5V5ec3csukZlJFhI8c=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=xdRcoJs06l/yM7NJ60GDQ9j40L3YZLqBXPOvpQGHKN690SrTr2qc06j9L3o1htsVG
	bsNELS6Z1dZ1bNXvD0T3r3nVsPacJOVB/kmFctPbSgQLoXXIGE+SqoIkbbGsXPlOap
	uydD3IQeLySWF6GQOpdGpRffxythLCzFCea/MaEQ=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RFNRBF018663
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 10:23:27 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 10:23:26 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 27 Sep 2018 10:23:27 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RFNIJP014983
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 10:23:26 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 27 Sep 2018 11:22:29 -0400
Message-ID: <1538061764-54977-16-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1538061764-54977-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1538061764-54977-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 15/30] mcbsp-lld-rtos: Update to version 01.00.00.11A
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
X-List-Received-Date: Thu, 27 Sep 2018 15:23:51 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb b/recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb
index f65e22a..277ec13 100644
--- a/recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb
+++ b/recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb
@@ -13,14 +13,14 @@ MCBSP_LLD_GIT_PROTOCOL = "git"
 MCBSP_LLD_GIT_BRANCH = "master"
 MCBSP_LLD_GIT_DESTSUFFIX = "git/ti/drv/mcbsp"
 
-# Below commit ID corresponds to "DEV.MCBSP_LLD.01.00.00.10"
-MCBSP_LLD_SRCREV = "4b53ebb479c769dac4908b759191f62b3b90ce4d"
+# Below commit ID corresponds to "DEV.MCBSP_LLD.01.00.00.11A"
+MCBSP_LLD_SRCREV = "fb654c63ec9cf0c9b898a901abc176ecd9a06517"
 
 BRANCH = "${MCBSP_LLD_GIT_BRANCH}"
 SRC_URI = "${MCBSP_LLD_GIT_URI};destsuffix=${MCBSP_LLD_GIT_DESTSUFFIX};protocol=${MCBSP_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${MCBSP_LLD_SRCREV}"
-PV = "01.00.00.10"
+PV = "01.00.00.11A"
 PR = "r0"
 
 S = "${WORKDIR}/${MCBSP_LLD_GIT_DESTSUFFIX}"
-- 
1.9.1


