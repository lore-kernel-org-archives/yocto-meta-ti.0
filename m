Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3CE4DE00D70; Wed, 13 Dec 2017 12:58:54 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0451CE00D17
	for <meta-ti@yoctoproject.org>; Wed, 13 Dec 2017 12:58:52 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBDKwgLT004096
	for <meta-ti@yoctoproject.org>; Wed, 13 Dec 2017 14:58:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513198722;
	bh=uklBdHPxcZak5kj6yUsr5kzSy8MVK8JU/WSuiADb/yo=;
	h=From:To:Subject:Date;
	b=qsFmq82Kt6/wV7PBRBlLF1mhSkGmp1dvP5LrAmLQf+foLz4nydjamBrYbKVyyAQ+g
	Hm4jvDwqMTuPp4opG0imqKDMSCIxk4+PKsCRO/L384bLogGTGtpVqWUPdySKo4RKmQ
	UB8GyL/t9gXcWPKJS9+r/ryhPdIqI6Kc38+4Shq4=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDKwWiY032715
	for <meta-ti@yoctoproject.org>; Wed, 13 Dec 2017 14:58:37 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 13 Dec 2017 14:58:36 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 13 Dec 2017 14:58:36 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDKwaiZ012073
	for <meta-ti@yoctoproject.org>; Wed, 13 Dec 2017 14:58:36 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 13 Dec 2017 15:58:35 -0500
Message-ID: <1513198715-18815-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/master][PATCH] pruss-lld: Update to version 1.0.0.8
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
X-List-Received-Date: Wed, 13 Dec 2017 20:58:54 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/pruss-lld/pruss-lld.inc | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/pruss-lld/pruss-lld.inc b/recipes-bsp/pruss-lld/pruss-lld.inc
index 44d84b8..bbd060d 100644
--- a/recipes-bsp/pruss-lld/pruss-lld.inc
+++ b/recipes-bsp/pruss-lld/pruss-lld.inc
@@ -9,12 +9,13 @@ PRUSS_LLD_GIT_PROTOCOL = "git"
 PRUSS_LLD_GIT_BRANCH = "master"
 PRUSS_LLD_GIT_DESTSUFFIX = "git/ti/drv/pruss"
 
-# Below commit ID corresponds to "DEV.PRUSS_LLD.01.00.00.07"
-PRUSS_LLD_SRCREV = "636bb5645014723c54c08245cf8c2ee401eceb4f"
+# Below commit ID corresponds to "DEV.PRUSS_LLD.01.00.00.08"
+PRUSS_LLD_SRCREV = "40d886b30f9b34bd86a76c6d7c04c37a9db7365b"
 
 BRANCH = "${PRUSS_LLD_GIT_BRANCH}"
 SRC_URI = "${PRUSS_LLD_GIT_URI};destsuffix=${PRUSS_LLD_GIT_DESTSUFFIX};protocol=${PRUSS_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${PRUSS_LLD_SRCREV}"
-PV = "01.00.00.07"
+PV = "01.00.00.08"
 INC_PR = "r0"
+
-- 
1.9.1


