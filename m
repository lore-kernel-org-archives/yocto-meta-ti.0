Return-Path: <santa@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 85C83E00D98; Wed, 16 Oct 2019 11:38:31 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D7FBFE00D5F
	for <meta-ti@yoctoproject.org>; Wed, 16 Oct 2019 11:38:30 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9GIcUdx069322
	for <meta-ti@yoctoproject.org>; Wed, 16 Oct 2019 13:38:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1571251110;
	bh=zzHKbULPH+occ9cBIGqNBEGXtRRnw2CTX1qPRpcLqEk=;
	h=From:To:CC:Subject:Date;
	b=p5rltgtyzB/zmbwyGcMtraMLQZm/MZWcKC8FbLysTRkHFU0r9yyJxTScTUcDfD4ZO
	uxOLb6j0OD5bbV7yUD0omuQjOB7kR8cR6x6TsYDfvx2IxmxCHlPcXQ7rl6Z459pqaq
	MS8Mp+8/x6rQ3xf5qHN90/LmH3M4z18kNVWbkBsw=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9GIcUSV042181
	for <meta-ti@yoctoproject.org>; Wed, 16 Oct 2019 13:38:30 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 16 Oct 2019 13:38:23 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 16 Oct 2019 13:38:23 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9GIcQ3h056806; 
	Wed, 16 Oct 2019 13:38:27 -0500
From: Santhana Bharathi <santa@ti.com>
To: <meta-ti@yoctoproject.org>, <denys@ti.com>
Date: Thu, 17 Oct 2019 00:08:23 +0530
Message-ID: <1571251103-152990-1-git-send-email-santa@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: srk@ti.com, grygorii.strashko@ti.com, badri@ti.com, nsekhar@ti.com,
	prasad.jondhale@ti.com, santa@ti.com
Subject: [thud][PATCH V1] cpsw9g-eth-fw: update ethernet firmware
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
X-List-Received-Date: Wed, 16 Oct 2019 18:38:31 -0000
Content-Type: text/plain

 * Updated Ethernet firmware binary for 1.0 release

Signed-off-by: Santhana Bharathi <santa@ti.com>
---
 recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb b/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
index a521edf..5598e42 100644
--- a/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
+++ b/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
@@ -11,7 +11,7 @@ inherit update-alternatives
 
 PROTOCOL = "git"
 BRANCH = "master"
-SRCREV = "7f3af9b0b4c04edcb68c49cb64fcf0d65a860457"
+SRCREV = "792c06d9a0f2b9d4b150bce4651bdaae2413b28d"
 
 SRC_URI = "git://git.ti.com/glsdk/ti-eth-fw.git;protocol=${PROTOCOL};branch=${BRANCH}"
 
-- 
1.9.1


