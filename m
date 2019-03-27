Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 28C4EE00D12; Wed, 27 Mar 2019 13:07:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E5787E00D11
	for <meta-ti@yoctoproject.org>; Wed, 27 Mar 2019 13:07:21 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2RK7LgM072942
	for <meta-ti@yoctoproject.org>; Wed, 27 Mar 2019 15:07:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553717241;
	bh=43TexSdYgzHXgcoSKR0Av11VJTdadspFGLZgDJzq8AI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Svp7EdtDzZWWTT8n43vXk2lUNkk4mZysn7dJTlcCLfOiW0TRPXu+l9g3w8nhRq/Z5
	dhCRqbRzPgGwG6aIm4Jvtp9f3zDGUd/fLayx/laz/IqCsvJdT90VKpoAyoqo/S0ohW
	qwwT5SIZgnWyoCE8d9xWFNEgnWuKuEMSjan0bs8U=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2RK7Lmb123389
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 27 Mar 2019 15:07:21 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 27 Mar 2019 15:07:21 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 27 Mar 2019 15:07:21 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x2RK7KuU093438;
	Wed, 27 Mar 2019 15:07:21 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 27 Mar 2019 15:07:18 -0500
Message-ID: <20190327200718.10742-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20190327200718.10742-1-dmurphy@ti.com>
References: <20190327200718.10742-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 2/2] u-boot-ti-staging: update to ti2019.00-rc4 tag
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
X-List-Received-Date: Wed, 27 Mar 2019 20:07:23 -0000
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb
index c6e825a6..57f03cc9 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r4"
+PR = "r5"
 
 BRANCH = "ti-u-boot-2019.01"
 
-SRCREV = "2947de9e99fc223ecc8cd8ae888ab9b9019333c6"
+SRCREV = "a0e49036fcd6c81c913f38a4611613d0ed8aafcf"
-- 
2.19.0


