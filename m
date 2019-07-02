Return-Path: <subhajit_paul@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6D6CAE00D74; Tue,  2 Jul 2019 10:48:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0172BE00C02
	for <meta-ti@yoctoproject.org>; Tue,  2 Jul 2019 10:48:09 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x62Hm9qn006124
	for <meta-ti@yoctoproject.org>; Tue, 2 Jul 2019 12:48:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562089689;
	bh=6JFA+fHn/IkH7SRYuIACg0ITL1IETiUfQB342x1uk4w=;
	h=From:To:CC:Subject:Date;
	b=aEEqNyU95ftSEKj6Yzwo40dUjRplaSEDIq+RBKVN2WBoN0gL1qFFZ95ABj+wpp7wn
	ZBVO7V9eUHEEUlAdfoKw+memdfl9GFolFH2Lrsj0rDtUQTaFiIamLsmchMrG/6bj8x
	Hnmq3LHeskS9FaSzvYG+/huM90rr4cTd6sqxaamA=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x62Hm93B087597
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 2 Jul 2019 12:48:09 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 2 Jul 2019 12:48:09 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 2 Jul 2019 12:48:09 -0500
Received: from uda0132170-dell.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x62Hm7P7093205;
	Tue, 2 Jul 2019 12:48:08 -0500
From: Subhajit Paul <subhajit_paul@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 2 Jul 2019 23:17:42 +0530
Message-ID: <1562089662-28014-1-git-send-email-subhajit_paul@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] cadence-mhdp-fw: fix install location for firmware
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
X-List-Received-Date: Tue, 02 Jul 2019 17:48:10 -0000
Content-Type: text/plain

Signed-off-by: Subhajit Paul <subhajit_paul@ti.com>
---
 recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb b/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
index e8d5c54..a703272 100644
--- a/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
+++ b/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
@@ -21,8 +21,8 @@ S = "${WORKDIR}/git"
 TARGET = "mhdp8546.bin"
 
 do_install() {
-	install -d ${D}${base_libdir}/firmware
-	install -m 0644 ${S}/cadence/${TARGET} ${D}${base_libdir}/firmware/${TARGET}
+	install -d ${D}${base_libdir}/firmware/cadence
+	install -m 0644 ${S}/cadence/${TARGET} ${D}${base_libdir}/firmware/cadence/${TARGET}
 }
 
 FILES_${PN} = "${base_libdir}/firmware"
-- 
2.7.4


