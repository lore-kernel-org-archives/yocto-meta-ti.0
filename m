Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C88BCE0130D; Thu, 19 Jul 2018 10:24:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B672AE01726
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 10:24:32 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6JHOWBI071115
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532021072;
	bh=YIpLIJyYVx38Gbawq/itxb1/QQFAJHZnnVepG/CRIqI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=VNySBaSOMAQVzi5ULxc+BNvTzu0m7GX7LrC20BPGJ/1WVHxcgaEsavp2+uoXUf+Ck
	xn++i9Hhn5LW6M2LzZBOIF3e3sO+7QmWyh/QZqXxJxQ1ZAifl2lo4swqHDWFbLpwzU
	q7O1AT6wkYNh/Z4PzLfy1wS+FRfBtJCjSU1wPWH4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHOWfK015521
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:32 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 19 Jul 2018 12:24:31 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 19 Jul 2018 12:24:31 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHOOS8023684
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:31 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 19 Jul 2018 13:24:11 -0400
Message-ID: <1532021058-48916-39-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532021058-48916-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1532021058-48916-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 38/45] transport-rtos: Update to version 1.0.0.12
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
X-List-Received-Date: Thu, 19 Jul 2018 17:24:38 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/transport-rtos/transport.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/transport-rtos/transport.inc b/recipes-bsp/transport-rtos/transport.inc
index 8d1b327..61772bd 100644
--- a/recipes-bsp/transport-rtos/transport.inc
+++ b/recipes-bsp/transport-rtos/transport.inc
@@ -6,12 +6,12 @@ TRANSPORT_GIT_URI = "git://git.ti.com/keystone-rtos/transport.git"
 TRANSPORT_GIT_PROTOCOL = "git"
 TRANSPORT_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.TRANSPORT.01.00.00.11A"
-TRANSPORT_SRCREV = "472efde60b5ede35c0746c432001d8e3673a6bb9"
+# Below commit ID corresponds to "DEV.TRANSPORT.01.00.00.12"
+TRANSPORT_SRCREV = "0e0f30a30388ea34b3a00beb69c9bfccc26dfaa0"
 
 BRANCH = "${TRANSPORT_GIT_BRANCH}"
 SRC_URI = "${TRANSPORT_GIT_URI};protocol=${TRANSPORT_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${TRANSPORT_SRCREV}"
-PV = "01.00.00.11A"
+PV = "01.00.00.12"
 INC_PR = "r0"
-- 
1.9.1


