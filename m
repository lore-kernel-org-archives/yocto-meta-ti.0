Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7B71DE00E35; Fri, 30 Aug 2019 09:54:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 45C0CE00E10
	for <meta-ti@yoctoproject.org>; Fri, 30 Aug 2019 09:54:04 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7UGs4Yj056176
	for <meta-ti@yoctoproject.org>; Fri, 30 Aug 2019 11:54:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1567184044;
	bh=xB+LzM1HVC6AFVS4J0LOyat60ttUAlFPv5iTkyebjl4=;
	h=From:To:CC:Subject:Date;
	b=PFMqsKr5yxHy6TwCTlyWMLoXOwDZR07nqnhiC3gnXtMH8zzK2zuGHQd7o+ujF7zKH
	dxZLTvgYevvNuXrDcwgwaKR/NXv1e1PswbboPlFk/R4falgz1Sz62FPo/kUvgcaWo5
	ARWPnow/4AFZBpqETfLDH0U8qoAdGA/CX6J8/Wgk=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7UGs4bO084955
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 30 Aug 2019 11:54:04 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 30 Aug 2019 11:54:04 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 30 Aug 2019 11:54:04 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7UGs3EL024127;
	Fri, 30 Aug 2019 11:54:04 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 30 Aug 2019 12:32:45 -0400
Message-ID: <1567182767-3817-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH v4 1/3] jailhouse: remove earlycon bootargs for all k3
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
X-List-Received-Date: Fri, 30 Aug 2019 16:54:07 -0000
Content-Type: text/plain

* Also update to ti2019.03-rc4

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v4 changes:
* rebase
* update to ti2019.03-rc4

 recipes-kernel/jailhouse/jailhouse_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb b/recipes-kernel/jailhouse/jailhouse_git.bb
index e1d5263..aba4b3e 100644
--- a/recipes-kernel/jailhouse/jailhouse_git.bb
+++ b/recipes-kernel/jailhouse/jailhouse_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 PV = "0.10+git${SRCPV}"
-SRCREV = "96329f098e655cd42d7d0dbb3cd2cc7c3492d633"
+SRCREV = "6dce20f902f73fe9ce53ba0c41262a4defa8d328"
 BRANCH = "ti-jailhouse-0.10"
 
 SRC_URI = " \
@@ -60,7 +60,6 @@ JH_SYSCONFIG_CELL_j7-evm ?= "k3-j721e-evm.cell"
 
 JH_CMDLINE ?= ""
 JH_CMDLINE_k3 ?= "console=ttyS1,115200n8 root=/dev/mmcblk0p2 rw rootfstype=ext4 rootwait"
-JH_CMDLINE_j7-evm ?= "console=ttyS1,115200n8 root=/dev/mmcblk0p2 rw rootfstype=ext4 rootwait earlycon=ns16550a,mmio32,0x2810000"
 
 do_configure() {
 	if [ -d ${STAGING_DIR_HOST}/${CELLCONF_DIR} ]; 
-- 
2.7.4


