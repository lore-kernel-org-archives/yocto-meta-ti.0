Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 77196E0074B; Fri, 24 Aug 2018 14:12:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 307AEE0043F
	for <meta-ti@yoctoproject.org>; Fri, 24 Aug 2018 14:12:51 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7OLCpba047672
	for <meta-ti@yoctoproject.org>; Fri, 24 Aug 2018 16:12:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535145171;
	bh=9BrF22yaRmNgIjMYNlSOzY/BKWJv6Gzxqyq/LAVws/Y=;
	h=From:To:CC:Subject:Date;
	b=CJugdBfendjXBZPn0/Nv+pa2DKzFQNWSxKDItJhD/XCQtjrn+YfIUn6adTGQIUDze
	SlxDAUhxTseoySdpByuV+uwpK93CKZdGYdUCPrNHPGt0RfMT3lFYljp+zOrGy4F3un
	Eh9H8wezdO58bJZDqJu1uI6kk+g3mVkm5+PiI65g=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7OLCpRP021364
	for <meta-ti@yoctoproject.org>; Fri, 24 Aug 2018 16:12:51 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 24 Aug 2018 16:12:51 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 24 Aug 2018 16:12:51 -0500
Received: from uda0862859a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7OLCovT024601;
	Fri, 24 Aug 2018 16:12:51 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 24 Aug 2018 17:12:49 -0400
Message-ID: <1535145169-26688-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko][PATCH] sciclient: Recipe cleanup
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
X-List-Received-Date: Fri, 24 Aug 2018 21:12:54 -0000
Content-Type: text/plain

- Remove redundant description
- remove redundant defines

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/sciclient/sciclient-rtos_git.bb | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-bsp/sciclient/sciclient-rtos_git.bb
index e899b66..e059f4b 100644
--- a/recipes-bsp/sciclient/sciclient-rtos_git.bb
+++ b/recipes-bsp/sciclient/sciclient-rtos_git.bb
@@ -1,5 +1,4 @@
 SUMMARY = "TI RTOS low level driver for SCICLIENT"
-DESCRIPTION = "TI RTOS low level driver for SCICLIENT "
 
 inherit ti-pdk
 
@@ -37,13 +36,8 @@ export PDK_SCICLIENT_ROOT_PATH = "${SCICLIENT_PACKAGE_BASE}/package/all/pdk_/pac
 #export PDK_SCICLIENT_ROOT_PATH ="${WORKDIR}/build"
 #export DEST_ROOT="${S}"
 
-LIMSOCS = "am65xx"
 LIMSOCS_am65xx-evm = "am65xx"
-
-LIMBOARDS = "am65xx_evm"
 LIMBOARDS_am65xx-evm = "am65xx_evm"
-
-BOARD_PACKAGE = ""
 BOARD_PACKAGE_am65xx-evm = "am65xx_evm"
 
 # HTML doc link params
-- 
1.9.1


