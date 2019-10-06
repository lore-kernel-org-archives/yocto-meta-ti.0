Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2781AE00DA9; Sun,  6 Oct 2019 09:53:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 94817E00DAE
	for <meta-ti@yoctoproject.org>; Sun,  6 Oct 2019 09:52:57 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x96Gqv1w054371
	for <meta-ti@yoctoproject.org>; Sun, 6 Oct 2019 11:52:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1570380777;
	bh=A6F8IRVw7JDJo/rT72B/5X5sy3cUriUvdQzO/cBqLvs=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=cjB9HnpMHbIgpFqUn4Uj7DmOJ2qyOcgY37hPRoiII/XalXLiwdIgydSRDsSr/xCcx
	UKIMbxhozNb+GMplcHlrlngIkEG+XqNL4N9z//elNerdveESX5pXPyHuHru+VRvsW9
	RxkQOjR4cE5+904/611Iu1QeEcgk7MmfXoCKfmGs=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x96GqvxG005871
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Sun, 6 Oct 2019 11:52:57 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Sun, 6 Oct 2019 11:52:57 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Sun, 6 Oct 2019 11:52:55 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x96GqsK9103999
	for <meta-ti@yoctoproject.org>; Sun, 6 Oct 2019 11:52:57 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Sun, 6 Oct 2019 12:52:50 -0400
Message-ID: <1570380771-1351-13-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1570380771-1351-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1570380771-1351-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 12/13] uart-lld-rtos: SRCREV update to 01.00.00.16B
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
X-List-Received-Date: Sun, 06 Oct 2019 16:53:03 -0000
Content-Type: text/plain

---
 recipes-bsp/uart-lld/uart-lld-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/uart-lld/uart-lld-rtos_git.bb b/recipes-bsp/uart-lld/uart-lld-rtos_git.bb
index d475eb5..f279a67 100644
--- a/recipes-bsp/uart-lld/uart-lld-rtos_git.bb
+++ b/recipes-bsp/uart-lld/uart-lld-rtos_git.bb
@@ -13,14 +13,14 @@ UART_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/uart-lld.git"
 UART_LLD_GIT_PROTOCOL = "git"
 UART_LLD_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.UART_LLD.01.00.00.16"
-UART_LLD_SRCREV = "7e606f1db126af3e4e8e6f8a9173e1004a844e97"
+# Below commit ID corresponds to "DEV.UART_LLD.01.00.00.16B"
+UART_LLD_SRCREV = "227feb6e1da72bf0a785d95b7aaffd3216885f95"
 
 BRANCH = "${UART_LLD_GIT_BRANCH}"
 SRC_URI = "${UART_LLD_GIT_URI};protocol=${UART_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${UART_LLD_SRCREV}"
-PV = "01.00.00.16"
+PV = "01.00.00.16B"
 PR = "r0"
 
 DEPENDS_append = " edma3-lld-rtos \
-- 
1.9.1


