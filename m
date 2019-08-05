Return-Path: <jbergsagel@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0F6FAE00D47; Mon,  5 Aug 2019 16:06:29 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 79FB6E0049C
	for <meta-ti@yoctoproject.org>; Mon,  5 Aug 2019 16:06:28 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x75N6RLM040526
	for <meta-ti@yoctoproject.org>; Mon, 5 Aug 2019 18:06:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1565046387;
	bh=ew3yI0ihHche9oRx8cA2BZn8d+pMGas32gdieMFupR0=;
	h=From:To:CC:Subject:Date;
	b=qNCsN8fa5zaDrtkk7X2sY+p7HyGwlOCcF3b4E1BPVR/cW9lUO7eTbw5ERlP9KbFNM
	z2HoNQk7g/PI7ryp3X3TjZtB9TZR6ByCihvN1a+WubZJJ+RPdMrcfCMd7lX+wuumfY
	AZ4or+OKXbGMMnYaDcxiDsbpBgZCRIZcoZqUnsj4=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x75N6R4g036796
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 5 Aug 2019 18:06:27 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 5 Aug 2019 18:06:27 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 5 Aug 2019 18:06:27 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x75N6RqF065593;
	Mon, 5 Aug 2019 18:06:27 -0500
Received: from localhost (udc0211050.dhcp.ti.com [128.247.77.185])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x75N6RZ27717; Mon, 5 Aug 2019 18:06:27 -0500 (CDT)
From: Jonathan Bergsagel <jbergsagel@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 5 Aug 2019 18:04:23 -0500
Message-ID: <20190805230423.2564-1-jbergsagel@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Suman Anna <s-anna@ti.com>, Santosh Jha <sjha@ti.com>
Subject: [PATCH] ipc-lld: firmware binary updates with WFI fix
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
X-List-Received-Date: Mon, 05 Aug 2019 23:06:29 -0000
Content-Type: text/plain

Updated IPC/LLD firmware binaries for AM65xx and
J721E to support WFI state for proper remote core
power-down and power-up.

Signed-off-by: Jonathan Bergsagel <jbergsagel@ti.com>
---
 recipes-bsp/ipc-lld/ipc-lld-fw_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb b/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb
index 4c8743d021f3..dd1f57b3ba3a 100644
--- a/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb
+++ b/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb
@@ -13,7 +13,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 PROTOCOL = "git"
 BRANCH = "master"
-SRCREV = "81392da08fab2b5cfc23d63dbe71b7244a6af477"
+SRCREV = "c9f7cfe61b67998a053fe145344ce0c9b5bb22aa"
 
 SRC_URI = "git://git.ti.com/keystone-rtos/ipc-lld.git;protocol=${PROTOCOL};branch=${BRANCH}"
 
-- 
2.17.1


