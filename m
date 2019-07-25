Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4FAEFE00D46; Thu, 25 Jul 2019 09:12:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C0653E00C27
	for <meta-ti@yoctoproject.org>; Thu, 25 Jul 2019 09:12:47 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6PGClxg029110
	for <meta-ti@yoctoproject.org>; Thu, 25 Jul 2019 11:12:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1564071167;
	bh=2bRw5Xdb+vB72Xwcu7Q47rbGU+IPkFQFJ2lqCW2AbHI=;
	h=From:To:Subject:Date;
	b=DiTUcAuvYUjyR4hgkVV/nSf6OaMVXJOcuOOopPdxcf9YQtvBaZt3l+F4qoX9a2qOG
	sBguqpcb6dc96oOEgKFhCjsipavwvEr98NOE8Wd2LKb7a/s8ZycMFhJNsr6etvHfva
	EbRgcJ1KY7/pyGqn5I5Tdpnl69laxS53ZswZW5jY=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6PGClkL099937
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 25 Jul 2019 11:12:47 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 25 Jul 2019 11:12:46 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 25 Jul 2019 11:12:46 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6PGCkYL078061
	for <meta-ti@yoctoproject.org>; Thu, 25 Jul 2019 11:12:46 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 25 Jul 2019 12:12:41 -0400
Message-ID: <1564071161-22003-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] ibl-boot-rtos: SRCREV update
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
X-List-Received-Date: Thu, 25 Jul 2019 16:12:48 -0000
Content-Type: text/plain

---
 recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb b/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb
index ed30ef4..b70ea6c 100644
--- a/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb
+++ b/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb
@@ -9,15 +9,20 @@ LIC_FILES_CHKSUM = "file://src/ibl.h;beginline=1;endline=34;md5=ee7d7a3305d1e524
 
 require recipes-ti/includes/ti-paths.inc
 
-DEPENDS = "ti-cgt6x-7-native"
+DEPENDS = " ti-cgt6x-7-native \
+            bison-native \
+            flex-native \
+"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE = "c66x"
 
+CLEANBROKEN = "1"
+
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/keystone-rtos/ibl.git;protocol=git;branch=${BRANCH}"
-SRCREV = "f7ed32cc8911e3353dd01080da9b725b44a12285"
-PR = "r0"
+SRCREV = "8a3c14da3f0808854367cae38afe9d47ab80dce6"
+PR = "r1"
 
 S = "${WORKDIR}/git"
 
-- 
1.9.1


