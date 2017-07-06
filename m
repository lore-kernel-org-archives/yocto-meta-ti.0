Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 569DEE00B9D; Thu,  6 Jul 2017 08:55:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C345BE00B2F
	for <meta-ti@yoctoproject.org>; Thu,  6 Jul 2017 08:55:42 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v66Ftg0o008439
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 10:55:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499356542;
	bh=iYRVQiKMH2eX7MbDnRWc2VzRn1kfzXDkyy/zQGn00MI=;
	h=From:To:CC:Subject:Date;
	b=Y5u8tUWkxYtRIGtFxRA3htpvpCI4TUsCQD6fdCqXQVEtGNSsAWUIyttmBYfCOgkY4
	2uYTkTlWFun5xEsjOzPY1gVJlYa5QD7AmXXhR2hkuCakQjos1Yxw1mADeKkT9BGHZk
	xSFtmKJjSkRz/ej/72zkKtnwwv8hVUPHcpn4twkI=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v66FtgGB012645
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 10:55:42 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Jul 2017 10:55:41 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v66Ftfr5029438;	Thu, 6 Jul 2017 10:55:41 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 6 Jul 2017 11:55:39 -0400
Message-ID: <1499356539-17799-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] cppi-lld-rtos: Add support for c66x
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
X-List-Received-Date: Thu, 06 Jul 2017 15:55:43 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb b/recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb
index e29b087..1cdaf3a 100644
--- a/recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb
+++ b/recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb
@@ -1,7 +1,9 @@
 inherit ti-pdk
 require cppi-lld.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
+
+COMPATIBLE_MACHINE_append = "|c66x"
 
 DEPENDS_append = " rm-lld-rtos \
                    qmss-lld-rtos \
-- 
1.9.1


