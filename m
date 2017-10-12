Return-Path: <jjhiblot@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D36DDE00A9C; Thu, 12 Oct 2017 09:44:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 501FFE007EF
	for <meta-ti@yoctoproject.org>; Thu, 12 Oct 2017 09:44:23 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9CGiNZR000674
	for <meta-ti@yoctoproject.org>; Thu, 12 Oct 2017 11:44:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507826663;
	bh=8Bg3CVNqeJYUVqXKa8rUByfPcvJoBHlfUZ8DapmC8wE=;
	h=From:To:Subject:Date;
	b=OmjVrhXX34g0NiBbz++qFelTT3V4pS4cWKBLfH9Prnlq8xmJ6aY87T3ZarBz3lbo+
	Xh+2fQooNB7mfjPpstvuexOLcIPMg4yb6jRYoqB1VOohL5f/cnav31gSdVNkC75Z4U
	1yTFKZidGt5Y4wg1AWEvPCTtBS0t7lFnZlM8YfXI=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9CGiNkt014836
	for <meta-ti@yoctoproject.org>; Thu, 12 Oct 2017 11:44:23 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 12 Oct 2017 11:44:23 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 12 Oct 2017 11:44:23 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9CGiMUx020586;
	Thu, 12 Oct 2017 11:44:22 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <meta-ti@yoctoproject.org>, <denys@ti.com>
Date: Thu, 12 Oct 2017 18:44:23 +0200
Message-ID: <1507826664-24649-1-git-send-email-jjhiblot@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [krogoth][PATCH 1/2] linux-ti-staging 4.4: update to the latest for ti2016.09-rc1
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
X-List-Received-Date: Thu, 12 Oct 2017 16:44:24 -0000
Content-Type: text/plain

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_4.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_4.4.bb b/recipes-kernel/linux/linux-ti-staging_4.4.bb
index 672801d..4dbc385 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.4.bb
@@ -82,8 +82,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.4.y"
 
-SRCREV = "96206b1c35877a54a5d22de90122788976d78a94"
-PV = "4.4.86+git${SRCPV}"
+SRCREV = "62b52b43e10f0f58abdc795f11751a92ff4f4c76"
+PV = "4.4.91+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a"
-- 
1.9.1


