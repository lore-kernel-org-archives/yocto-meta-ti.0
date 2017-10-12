Return-Path: <jjhiblot@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5CEDAE00A9C; Thu, 12 Oct 2017 09:44:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 37738E00C65
	for <meta-ti@yoctoproject.org>; Thu, 12 Oct 2017 09:44:25 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9CGiPE6026605
	for <meta-ti@yoctoproject.org>; Thu, 12 Oct 2017 11:44:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507826665;
	bh=v7Wa7qI+rOs7j1vsjX/G7bTaVmTc7oWDzIaYZOI5bdc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=BIA8QxOufs2bv4BRp9QZsghlYaXAgKt3CgUZAY129xL8taPfSBjwZ7B1bivSYoDAh
	eiis1BYKv23bb4VwkgJd4hjDopGLuqER7AjHnooPtwbN0SeN/ynUaf/Hyi+1xDSnW3
	C8KtSpkj1d549Jr7viCF7GydetBKH/W7eQL9ux5M=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9CGiP4R014865
	for <meta-ti@yoctoproject.org>; Thu, 12 Oct 2017 11:44:25 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 12 Oct 2017 11:44:24 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 12 Oct 2017 11:44:24 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9CGiNPh028719;
	Thu, 12 Oct 2017 11:44:24 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <meta-ti@yoctoproject.org>, <denys@ti.com>
Date: Thu, 12 Oct 2017 18:44:24 +0200
Message-ID: <1507826664-24649-2-git-send-email-jjhiblot@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1507826664-24649-1-git-send-email-jjhiblot@ti.com>
References: <1507826664-24649-1-git-send-email-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [krogoth][PATCH 2/2] u-boot-ti-staging: update to ti2016.09-rc1 tag
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
X-List-Received-Date: Thu, 12 Oct 2017 16:44:27 -0000
Content-Type: text/plain

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb
index 0c786c3..7d987c8 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb
@@ -7,14 +7,14 @@ DESCRIPTION = "u-boot bootloader for TI devices"
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
 
-PR = "r34"
+PR = "r35"
 PV_append = "+git${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
 
 BRANCH ?= "ti-u-boot-2016.05"
 
-SRCREV = "299ebd66e11c2481a29ddcbfe65e196f6c9e0b41"
+SRCREV = "340c262b4bed7adac127e572f857e6f931ef18b2"
 
 # Support for secure devices - detailed info is in doc/README.ti-secure
 TI_SECURE_DEV_PKG ?= ""
-- 
1.9.1


