Return-Path: <g-tammana@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7A289E00D8A; Wed, 18 Sep 2019 09:15:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	*  0.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 57C49E008D9
	for <meta-ti@yoctoproject.org>; Wed, 18 Sep 2019 09:15:52 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8IGFpNk108130
	for <meta-ti@yoctoproject.org>; Wed, 18 Sep 2019 11:15:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568823351;
	bh=Ltu9rWTm7sZdAhMf6JuUM7zUBiXI6FLFmgLXHK5rbBs=;
	h=From:To:CC:Subject:Date;
	b=wVPGZalCV1DE8RxcDGCqQIN+Wpc0HtrHkmXC+6LoQyowr8Vj6eJy22XzvDkdhwfZp
	RX0Tg9tm7HY/kmqqcoakbrc0DEOFcLZU7mQhtibyjw6Pvw6LqO9tS8l0Btb5xUPSOI
	IK3F3W7AS6Hkxt7s43w0cnKZEajfvMtwLYLUUI0M=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8IGFpfO005501
	for <meta-ti@yoctoproject.org>; Wed, 18 Sep 2019 11:15:51 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 18 Sep 2019 11:15:48 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 18 Sep 2019 11:15:48 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8IGFpoK083564;
	Wed, 18 Sep 2019 11:15:51 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.77.97])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x8IGFpZ02431; Wed, 18 Sep 2019 11:15:51 -0500 (CDT)
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-ti@yoctoproject.org>, Denys Dmytriyenko <denys@ti.com>
Date: Wed, 18 Sep 2019 11:17:47 -0500
Message-ID: <20190918161747.32544-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Erick Narvaez <a0226667@ti.com>
Subject: [thud][PATCH] ti-img-rogue-driver: Update srcrev to pick get_order fix
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
X-List-Received-Date: Wed, 18 Sep 2019 16:15:54 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

`__get_order()` API got changed to `get_order()` in the newer kernel
4.19.73. Updating the srcrev to pick the corresponding fix in the
driver.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 .../powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb
index 5b9f7c08..986d0137 100644
--- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb
+++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=15;endline=20;md5=0403c7dea01a2b8232
 
 inherit module
 
-MACHINE_KERNEL_PR_append = "b"
+MACHINE_KERNEL_PR_append = "c"
 PR = "${MACHINE_KERNEL_PR}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -22,7 +22,7 @@ SRC_URI = "git://git.ti.com/graphics/ti-img-rogue-driver.git;branch=${BRANCH} \
 "
 S = "${WORKDIR}/git"
 
-SRCREV = "12594852f8a46ead75b5ce3309372e4a1054be05"
+SRCREV = "2d0f0959c1e449de0c38ce988881437f7d5fcf65"
 
 PVR_SOC = "j721e_linux"
 PVR_BVNC = "22.104.208.318"
-- 
2.23.0


