Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 25481E0083D; Mon,  1 May 2017 14:46:10 -0700 (PDT)
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
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CC72BE0083D
	for <meta-ti@yoctoproject.org>; Mon,  1 May 2017 14:46:08 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v41Lk8So008468
	for <meta-ti@yoctoproject.org>; Mon, 1 May 2017 16:46:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493675168;
	bh=/dhRJ4xgZYxwVafh8NadTBXwi6IOZDfYcP9c9RRyAyg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=NUdVymdQI/ohVWraqn0RjATzEQ7Bu2VEimsLg1brTXDgK0uCt/mdpinoosKqhsdud
	3rGvjj/qD8Ftk6T2pfWWq8enJBeXrjr4sOh4cznaGY8JA2e5CNnRRvzm/vJGfcEVr5
	baEtHTLfB9ZMszCoDplgHU9nbR3ShQF3XJ3hbhEM=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v41Lk8Im017786
	for <meta-ti@yoctoproject.org>; Mon, 1 May 2017 16:46:08 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 1 May 2017 16:46:07 -0500
Received: from a0866445-vm1.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v41Ljxej028441;	Mon, 1 May 2017 16:46:07 -0500
From: Justin Sobota <jsobota@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 1 May 2017 17:45:51 -0400
Message-ID: <1493675152-31383-7-git-send-email-jsobota@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493675152-31383-1-git-send-email-jsobota@ti.com>
References: <1493675152-31383-1-git-send-email-jsobota@ti.com>
MIME-Version: 1.0
Subject: [PATCH 7/8] sa-lld: Update to version 3.0.0.17
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
X-List-Received-Date: Mon, 01 May 2017 21:46:10 -0000
Content-Type: text/plain

Signed-off-by: Justin Sobota <jsobota@ti.com>
---
 recipes-bsp/sa-lld/sa-lld.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/sa-lld/sa-lld.inc b/recipes-bsp/sa-lld/sa-lld.inc
index 853abdd..2f2c671 100644
--- a/recipes-bsp/sa-lld/sa-lld.inc
+++ b/recipes-bsp/sa-lld/sa-lld.inc
@@ -8,14 +8,14 @@ SA_LLD_GIT_PROTOCOL = "git"
 SA_LLD_GIT_BRANCH = "master"
 SA_LLD_GIT_DESTSUFFIX = "git/ti/drv/sa"
 
-# Below commit ID corresponds to "DEV.SA_LLD.03.00.00.16"
-SA_LLD_SRCREV = "eb1508714586f92e66bf5a8a4c212e8277f6b065"
+# Below commit ID corresponding to "DEV.SA_LLD.03.00.00.17"
+SA_LLD_SRCREV = "5f153253b1874420b04bd8f95450a2b0c8c11335"
 
 BRANCH = "${SA_LLD_GIT_BRANCH}"
 SRC_URI = "${SA_LLD_GIT_URI};destsuffix=${SA_LLD_GIT_DESTSUFFIX};protocol=${SA_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${SA_LLD_SRCREV}"
 
-PV = "03.00.00.16"
+PV = "03.00.00.17"
 INC_PR = "r0"
 
 S = "${WORKDIR}/${SA_LLD_GIT_DESTSUFFIX}"
-- 
2.7.4


