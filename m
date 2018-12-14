Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 45BE2E00D5D; Fri, 14 Dec 2018 11:31:52 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3AD04E00CEA
	for <meta-ti@yoctoproject.org>; Fri, 14 Dec 2018 11:31:51 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBEJVo7r040550
	for <meta-ti@yoctoproject.org>; Fri, 14 Dec 2018 13:31:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544815910;
	bh=JLrIVXpvHWbW/5u/atB6X5p4IVYb7gMrpFqw8ViiUo8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=McD8XAKDZjyEUPak6vBUXQU9gKPhErtORPohUR2RRI541hvnno6hD9K1CEh+/cbyN
	2XCLFxo7X2mITTJ45UdjkkAVEiAK1jxdTqHAHKLbwLDyZF+QXi8hHXk2Ta/n/6o61a
	cPHGk/xN+TtrSQB0wyHI8cSmwxX41d5eF22ZPvc0=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBEJVofD098487
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 14 Dec 2018 13:31:50 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 14 Dec 2018 13:31:50 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 14 Dec 2018 13:31:50 -0600
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBEJVmdA031115
	for <meta-ti@yoctoproject.org>; Fri, 14 Dec 2018 13:31:50 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 14 Dec 2018 14:31:19 -0500
Message-ID: <1544815903-10792-11-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1544815903-10792-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1544815903-10792-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 10/34] gpio-lld-rtos: SRCREV update to 01.00.00.13A, added sciclient dependency for k3
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
X-List-Received-Date: Fri, 14 Dec 2018 19:31:52 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb b/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb
index 822b773..508cca9 100644
--- a/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb
+++ b/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb
@@ -13,14 +13,14 @@ GPIO_LLD_GIT_PROTOCOL = "git"
 GPIO_LLD_GIT_BRANCH = "master"
 GPIO_LLD_GIT_DESTSUFFIX = "git/ti/drv/gpio"
 
-# Below commit ID corresponds to "DEV.GPIO_LLD.01.00.00.12"
-GPIO_LLD_SRCREV = "49a25da3341c83bec5e5db586217e534de9e2063"
+# Below commit ID corresponds to "DEV.GPIO_LLD.01.00.00.13A"
+GPIO_LLD_SRCREV = "74c3b87c0cd6e25e3f830c74e20264f5eb776bce"
 
 BRANCH = "${GPIO_LLD_GIT_BRANCH}"
 SRC_URI = "${GPIO_LLD_GIT_URI};destsuffix=${GPIO_LLD_GIT_DESTSUFFIX};protocol=${GPIO_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${GPIO_LLD_SRCREV}"
-PV = "01.00.00.12"
+PV = "01.00.00.13A"
 PR = "r0"
 
 S = "${WORKDIR}/${GPIO_LLD_GIT_DESTSUFFIX}"
@@ -31,6 +31,8 @@ DEPENDS_append_ti33x = " starterware-rtos \
 "
 DEPENDS_append_ti43x = " starterware-rtos \
 "
+DEPENDS_append_k3 = " sciclient-rtos \
+"
 
 # Build with make instead of XDC
 TI_PDK_XDCMAKE = "0"
-- 
1.9.1


