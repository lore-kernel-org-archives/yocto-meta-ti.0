Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E8C80E00B9D; Thu,  6 Jul 2017 08:57:01 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ABC30E00B2F
	for <meta-ti@yoctoproject.org>; Thu,  6 Jul 2017 08:56:57 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v66Fuvrq008604
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 10:56:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499356617;
	bh=4NVNEVv9wLsQLwwfvX4Enr51a3je8BvY4zTijClW1vY=;
	h=From:To:CC:Subject:Date;
	b=TR/JxdZ+ohJGFVdSi2wvn/HDgdWo/wgVjE4fDDFmRD3dwjGhV77GgavbX+iHhe+ta
	Keb7NwJFzztrU2UHatMxaMZtFziLjK2a69oPnKWLw2CPjwxpgElD0mh1sRr2cXSZOM
	1PLgJgJ2bvAjYht06EA776larzccoU7h53vWJdKw=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v66FuvHP002798
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 10:56:57 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Jul 2017 10:56:56 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v66FuuBx027029;	Thu, 6 Jul 2017 10:56:56 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 6 Jul 2017 11:56:55 -0400
Message-ID: <1499356615-18413-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] pktlib-rtos: Add support for c66x
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
X-List-Received-Date: Thu, 06 Jul 2017 15:57:02 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/pktlib/pktlib-rtos_git.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/recipes-bsp/pktlib/pktlib-rtos_git.bb b/recipes-bsp/pktlib/pktlib-rtos_git.bb
index a7db402..7151616 100644
--- a/recipes-bsp/pktlib/pktlib-rtos_git.bb
+++ b/recipes-bsp/pktlib/pktlib-rtos_git.bb
@@ -1,9 +1,12 @@
 inherit ti-pdk
 require pktlib.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 DEPENDS_append = " rm-lld-rtos \
                    qmss-lld-rtos \
                    cppi-lld-rtos \
 "
+COMPATIBLE_MACHINE_append = "|c66x"
+
+
-- 
1.9.1


