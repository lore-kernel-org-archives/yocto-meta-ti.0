Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 26DB7E00D8B; Tue,  6 Aug 2019 11:54:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 70053E00D9F
	for <meta-ti@yoctoproject.org>; Tue,  6 Aug 2019 11:54:40 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x76IseUI025528
	for <meta-ti@yoctoproject.org>; Tue, 6 Aug 2019 13:54:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1565117680;
	bh=2WrO/RQtqg0r2ohNzlIctQqreDYhEmCPPhqMQ1FdyjQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=D28Vdfm3ztOhFNLun0GNUc5Y7S+W90NipBQbjWgs1XWniJVlBsSXmvL+zEx1Xj4uF
	GXDpYoFtKURGbEJWXt3PkpNHeAjLYkDS8PxasuiXC8ol6SWxslfiRUaZR04+ydYSZt
	nKfCOgFQI0LeFggs4aYGcorHdEgh9si+SWyowc6A=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x76IseCP058424
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 6 Aug 2019 13:54:40 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 6 Aug 2019 13:54:39 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 6 Aug 2019 13:54:39 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x76IsTFq070565
	for <meta-ti@yoctoproject.org>; Tue, 6 Aug 2019 13:54:39 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 6 Aug 2019 14:54:15 -0400
Message-ID: <1565117660-52661-21-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1565117660-52661-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1565117660-52661-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 20/25] tsip-lld-rtos: SRCREV update to 01.00.00.08A
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
X-List-Received-Date: Tue, 06 Aug 2019 18:54:41 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/tsip-lld/tsip-lld-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/tsip-lld/tsip-lld-rtos_git.bb b/recipes-bsp/tsip-lld/tsip-lld-rtos_git.bb
index 0e90e6a..6da80dd 100644
--- a/recipes-bsp/tsip-lld/tsip-lld-rtos_git.bb
+++ b/recipes-bsp/tsip-lld/tsip-lld-rtos_git.bb
@@ -12,14 +12,14 @@ TSIP_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/tsip-lld.git"
 TSIP_LLD_GIT_PROTOCOL = "git"
 TSIP_LLD_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.TSIP_LLD.01.00.00.08"
-TSIP_LLD_SRCREV = "f40c0153b711622e67ab4b36da5cf044f7bd9a8e"
+# Below commit ID corresponds to "DEV.TSIP_LLD.01.00.00.08A"
+TSIP_LLD_SRCREV = "368ff5fbd963f4b5d5c81bbfaf3daca23beb2a87"
 
 BRANCH = "${TSIP_LLD_GIT_BRANCH}"
 SRC_URI = "${TSIP_LLD_GIT_URI};protocol=${TSIP_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${TSIP_LLD_SRCREV}"
-PV = "01.00.00.08"
+PV = "01.00.00.08A"
 PR = "r0"
 
 # HTML doc link params
-- 
1.9.1


