Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 107ACE00B6D; Mon,  1 May 2017 14:46:26 -0700 (PDT)
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
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 706D5E00B23
	for <meta-ti@yoctoproject.org>; Mon,  1 May 2017 14:46:22 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v41LkCcV007047
	for <meta-ti@yoctoproject.org>; Mon, 1 May 2017 16:46:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493675172;
	bh=g9VZZIJOLZK8z6UCblbFKHQa2Pc5ChB/3Xyx/m1/TDc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=eBaEzbFpT0i4/feC7H+SIyZJz7WxoUgLUprsBsyuOiTLEgUAxxyi0kBAu0z2UqJM/
	hFfFvWc2JkltGRPHoa7KbsMY5WHy/DV5VwySw5C5V6nSEXNCfYQxBR5O3FjRtpE74c
	mvbrg/2kBKdUHfLLbFVFgn++qcjV0hvjlMGsFzJw=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v41Lk7OW017778
	for <meta-ti@yoctoproject.org>; Mon, 1 May 2017 16:46:07 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 1 May 2017 16:46:06 -0500
Received: from a0866445-vm1.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v41Ljxei028441;	Mon, 1 May 2017 16:46:06 -0500
From: Justin Sobota <jsobota@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 1 May 2017 17:45:50 -0400
Message-ID: <1493675152-31383-6-git-send-email-jsobota@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493675152-31383-1-git-send-email-jsobota@ti.com>
References: <1493675152-31383-1-git-send-email-jsobota@ti.com>
MIME-Version: 1.0
Subject: [PATCH 6/8] qmss-lld: Update to version 2.1.0.15A
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
X-List-Received-Date: Mon, 01 May 2017 21:46:26 -0000
Content-Type: text/plain

Signed-off-by: Justin Sobota <jsobota@ti.com>
---
 recipes-bsp/qmss-lld/qmss-lld.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/qmss-lld/qmss-lld.inc b/recipes-bsp/qmss-lld/qmss-lld.inc
index 560f114..f2ef968 100644
--- a/recipes-bsp/qmss-lld/qmss-lld.inc
+++ b/recipes-bsp/qmss-lld/qmss-lld.inc
@@ -9,14 +9,14 @@ QMSS_LLD_GIT_PROTOCOL = "git"
 QMSS_LLD_GIT_BRANCH = "master"
 QMSS_LLD_GIT_DESTSUFFIX = "git/ti/drv/qmss"
 
-# commit ID corresponding to "DEV.QMSS_LLD.02.01.00.14B"
-QMSS_LLD_SRCREV = "04095405680f4ec92eeef9312ba04f7808b1c813"
+# Below commit ID corresponding to "DEV.QMSS_LLD.02.01.00.15A"
+QMSS_LLD_SRCREV = "72fe9dc35b9e128a95b4e3e4403cb197616e2e88"
 
 BRANCH ="${QMSS_LLD_GIT_BRANCH}"
 SRC_URI = "${QMSS_LLD_GIT_URI};destsuffix=${QMSS_LLD_GIT_DESTSUFFIX};protocol=${QMSS_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${QMSS_LLD_SRCREV}"
 
-PV = "02.01.00.14B"
+PV = "02.01.00.15A"
 INC_PR = "r0"
 
 DEVICELIST = "k2h k2k k2l k2e"
-- 
2.7.4


