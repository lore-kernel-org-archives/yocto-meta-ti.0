Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2F41BE00B58; Mon, 16 Apr 2018 13:39:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D61CAE00C27
	for <meta-ti@yoctoproject.org>; Mon, 16 Apr 2018 13:38:56 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3GKcuOO025842
	for <meta-ti@yoctoproject.org>; Mon, 16 Apr 2018 15:38:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1523911136;
	bh=AbtJyZ3CyzyUuHCyVE0kskGkKu8c3slfLvtjqXjwmOw=;
	h=From:To:CC:Subject:Date;
	b=aZFbIEt2AWEsEBQXVFRhrvrgbF9yzDDeq+rMySHOCa43adBzJiKKtrWnyBBtqYzam
	ezBsuxsfw5tcgVBy1Di2xhjWU/P7V1QkM0KookslQFoNJDjRXerq9Sy/AQH97zFHj8
	oJkPxf80qLtP4G/f9VSoViZ2L/BfvnoflefiXvZQ=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3GKcuN7012389
	for <meta-ti@yoctoproject.org>; Mon, 16 Apr 2018 15:38:56 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 16 Apr 2018 15:38:55 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 16 Apr 2018 15:38:55 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3GKctFf008806;
	Mon, 16 Apr 2018 15:38:55 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 16 Apr 2018 16:28:35 -0400
Message-ID: <1523910515-27143-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] nimu-rtos: add missing cppi dependency for c667x-evm
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
X-List-Received-Date: Mon, 16 Apr 2018 20:39:52 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/transport-rtos/nimu-rtos_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/transport-rtos/nimu-rtos_git.bb b/recipes-bsp/transport-rtos/nimu-rtos_git.bb
index c60606b..e792123 100644
--- a/recipes-bsp/transport-rtos/nimu-rtos_git.bb
+++ b/recipes-bsp/transport-rtos/nimu-rtos_git.bb
@@ -23,7 +23,7 @@ DEPENDS_append_k2e-evm = " pa-lld-rtos"
 DEPENDS_append_k2l-evm = " pa-lld-rtos"
 DEPENDS_append_k2g = " emac-lld-rtos"
 DEPENDS_append_c665x-evm = " emac-lld-rtos"
-DEPENDS_append_c667x-evm = " pa-lld-rtos"
+DEPENDS_append_c667x-evm = " pa-lld-rtos cppi-lld-rtos"
 DEPENDS_append_omapl1 = " emac-lld-rtos"
 DEPENDS_append_dra7xx-evm = " emac-lld-rtos"
 
-- 
2.7.4


