Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D6206E00A48; Fri, 28 Apr 2017 09:12:13 -0700 (PDT)
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
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6E7BCE009AA
	for <meta-ti@yoctoproject.org>; Fri, 28 Apr 2017 09:12:11 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3SGCBrE021124
	for <meta-ti@yoctoproject.org>; Fri, 28 Apr 2017 11:12:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493395931;
	bh=pb6iomiPLKyK4fo1iUjeTItjN6v0viN3ywRvu8p/8zQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=nnBpMMqck4yErWltUhbbHAGB9lZnivCy8aSb3EGkjijEIs15uFFUPq3DACC6BdBJY
	YhQKA29JvuKO5oIAHug79KsFaGVgRGbuZ+pZ3M/EeAh46CsFut2CxBFxxk23YdaUEO
	OAQv0cY5ZmjwOIOdglo91671do7FnK0I+63gZPvQ=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3SGCBJB013108
	for <meta-ti@yoctoproject.org>; Fri, 28 Apr 2017 11:12:11 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 28 Apr 2017 11:12:10 -0500
Received: from a0866445-vm1.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v3SGC8eg021789;	Fri, 28 Apr 2017 11:12:11 -0500
From: Justin Sobota <jsobota@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 28 Apr 2017 12:11:54 -0400
Message-ID: <1493395920-21543-2-git-send-email-jsobota@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493395920-21543-1-git-send-email-jsobota@ti.com>
References: <1493395920-21543-1-git-send-email-jsobota@ti.com>
MIME-Version: 1.0
Subject: [master/morty][PATCH 2/8] edma3-lld: Update to version 2.12.3.27
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
X-List-Received-Date: Fri, 28 Apr 2017 16:12:13 -0000
Content-Type: text/plain

Signed-off-by: Justin Sobota <jsobota@ti.com>
---
 recipes-bsp/edma3-lld/edma3-lld.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/edma3-lld/edma3-lld.inc b/recipes-bsp/edma3-lld/edma3-lld.inc
index 4efcefc..63f1cac 100644
--- a/recipes-bsp/edma3-lld/edma3-lld.inc
+++ b/recipes-bsp/edma3-lld/edma3-lld.inc
@@ -6,12 +6,12 @@ EDMA3_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/edma3_lld.git"
 EDMA3_LLD_GIT_PROTOCOL = "git"
 EDMA3_LLD_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to tag "DEV_EDMA3_LLD_02_12_02_26"
-EDMA3_LLD_SRCREV = "1c67565620f5a5305cf3293bba669c6aa1a7e40a"
+# Below commit ID corresponds to tag "DEV_EDMA3_LLD_02_12_03_27"
+EDMA3_LLD_SRCREV = "ed434ef4019b696b753dae0f98fe6594a7ce35a3"
 
 BRANCH = "${EDMA3_LLD_GIT_BRANCH}"
 SRC_URI = "${EDMA3_LLD_GIT_URI};protocol=${EDMA3_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${EDMA3_LLD_SRCREV}"
 
-PV = "2.12.02.26"
+PV = "2.12.03.27"
 INC_PR = "r0"
-- 
2.7.4


