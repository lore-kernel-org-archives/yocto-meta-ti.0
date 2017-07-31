Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 90D92E00C2E; Mon, 31 Jul 2017 08:54:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 691AAE00C2C
	for <meta-ti@yoctoproject.org>; Mon, 31 Jul 2017 08:54:19 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6VFsJ9b021559
	for <meta-ti@yoctoproject.org>; Mon, 31 Jul 2017 10:54:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1501516459;
	bh=mcskqFXbvMRTktA/i3RxVwSSkxR7pv250ZEgqQVFSEc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=vISpr9EMH5YmJtrHiCvXu619Cmxykhpu/+pfxImxM+CyJ3uF/lRKceSl5jC7Ax4h+
	51Qo0Ot+gZ4BB5zZk50ze0dvhbkm6oaotf+T1AfyA7KDZvvM3SUsSd5vKS7anWuROu
	s+1na5ApIEPpGBg1yLPIa2UzbIUaCjEjFGhhzGos=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6VFsJFt032088
	for <meta-ti@yoctoproject.org>; Mon, 31 Jul 2017 10:54:19 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 31 Jul 2017 10:54:18 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6VFsIBJ026006;	Mon, 31 Jul 2017 10:54:18 -0500
Received: from localhost ([172.22.148.78])	by legion.dal.design.ti.com
	(8.11.7p1+Sun/8.11.7) with ESMTP id v6VFsI329031;
	Mon, 31 Jul 2017 10:54:18 -0500 (CDT)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 31 Jul 2017 10:54:13 -0500
Message-ID: <20170731155413.25696-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170731155413.25696-1-dmurphy@ti.com>
References: <20170731155413.25696-1-dmurphy@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] u-boot-ti-staging: update to ti2017.03-rc3 tag
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
X-List-Received-Date: Mon, 31 Jul 2017 15:54:21 -0000
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
index 813e291c..b3adeda8 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r10"
+PR = "r11"
 
 BRANCH = "ti-u-boot-2017.01"
 
-SRCREV = "6f3f23b509123062d958bed78a226ba54c5b559e"
+SRCREV = "403d60c7e7253ead11c9e081d8b88cc93322fc72"
-- 
2.13.2.516.ge629a7d28


