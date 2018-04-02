Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5FA35E00A6A; Mon,  2 Apr 2018 07:47:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B32B1E00857
	for <meta-ti@yoctoproject.org>; Mon,  2 Apr 2018 07:47:20 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w32ElJBL029734
	for <meta-ti@yoctoproject.org>; Mon, 2 Apr 2018 09:47:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1522680440;
	bh=2Qty/hhiomrrsOVxAtP+2g/ipoyRv4a2m+z4ScZvX2k=;
	h=From:To:CC:Subject:Date;
	b=KUCdcUmTds4BNibFlgzM7yLE7IC3mhKtq4uCG1M+7/DKdjhZeoHCq8aDwIMFYtLBr
	e1AJWrLbp+S0VOtgDPkXxo9d9ibGL1WrpyiZiMwPNDMjsCUYf0o4Hi+QCVYFrsjikO
	New6c+3nIDF0HlTWWAP6ydAPH8b9Z0TMfliTxOzg=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w32ElJi6000999
	for <meta-ti@yoctoproject.org>; Mon, 2 Apr 2018 09:47:19 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 2 Apr 2018 09:47:19 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 2 Apr 2018 09:47:19 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w32ElJ0w023094;
	Mon, 2 Apr 2018 09:47:19 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 2 Apr 2018 10:38:49 -0400
Message-ID: <1522679929-16750-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] ti-ndk: skip file-rdeps check
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
X-List-Received-Date: Mon, 02 Apr 2018 14:47:21 -0000
Content-Type: text/plain

* pre-packaged binaries depend on libc.so.6

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/ndk/ti-ndk.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-ti/ndk/ti-ndk.inc b/recipes-ti/ndk/ti-ndk.inc
index 09d9ea0..dfb09de 100644
--- a/recipes-ti/ndk/ti-ndk.inc
+++ b/recipes-ti/ndk/ti-ndk.inc
@@ -18,4 +18,4 @@ do_install() {
 ALLOW_EMPTY_${PN} = "1"
 FILES_${PN}-dev += "${NDK_INSTALL_DIR_RECIPE}"
 
-INSANE_SKIP_${PN}-dev = "arch ldflags staticdev"
+INSANE_SKIP_${PN}-dev = "arch ldflags staticdev file-rdeps"
-- 
2.7.4


