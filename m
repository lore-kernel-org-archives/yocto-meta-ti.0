Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F1EC8E00BE2; Thu, 17 Oct 2019 10:58:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2DC50E0098A
	for <meta-ti@yoctoproject.org>; Thu, 17 Oct 2019 10:58:09 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9HHw9GT052727
	for <meta-ti@yoctoproject.org>; Thu, 17 Oct 2019 12:58:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1571335089;
	bh=4uFQQkTaLDwAmJDWBQ1U5cxHwMMWrf77lD7xx76nOpA=;
	h=From:To:CC:Subject:Date;
	b=QUIVn67HkMFGn7yxKmt2KOnsvWHRr8NYmfCED4CSrMAXmZu5FIUvZdj93a/LNj3bs
	BnTxXke7sCD4x9hPNKuDKZinA2VgEqfa9T9Kjuop6DsLjGxZjqkP6oiEu8Ddjpfx9w
	vT+pybLwOgm10JF2FTr6V4i00s0WYiw3Ynm8MIIE=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9HHw9u5050766
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 17 Oct 2019 12:58:09 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 17 Oct 2019 12:58:00 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 17 Oct 2019 12:58:08 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9HHw8Bk057398;
	Thu, 17 Oct 2019 12:58:08 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 17 Oct 2019 17:41:09 +0000
Message-ID: <20191017174109.17002-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] ti-display-sharing-fw: update to 06.01.00.00
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
X-List-Received-Date: Thu, 17 Oct 2019 17:58:12 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../ti-display-sharing-fw/ti-display-sharing-fw_git.bb        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/ti-display-sharing-fw/ti-display-sharing-fw_git.bb b/recipes-bsp/ti-display-sharing-fw/ti-display-sharing-fw_git.bb
index db095d90..9115b6b4 100644
--- a/recipes-bsp/ti-display-sharing-fw/ti-display-sharing-fw_git.bb
+++ b/recipes-bsp/ti-display-sharing-fw/ti-display-sharing-fw_git.bb
@@ -3,7 +3,7 @@ SUMMARY = "TI Display Sharing Firmware"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
 
-PV = "00.09.00.00-git${SRCPV}"
+PV = "06.01.00.00+git${SRCPV}"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit deploy
@@ -11,7 +11,7 @@ inherit update-alternatives
 
 PROTOCOL = "git"
 BRANCH = "ti-linux-firmware"
-SRCREV = "4a86f16df9b44798851e51fa465825710cda76cf"
+SRCREV = "e7be1ab85266c47236330e2909997d20fc62e312"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=${PROTOCOL};branch=${BRANCH}"
 
-- 
2.17.1


