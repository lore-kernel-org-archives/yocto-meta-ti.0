Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E6029E00A9B; Fri, 28 Apr 2017 09:12:19 -0700 (PDT)
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
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9607AE009CE
	for <meta-ti@yoctoproject.org>; Fri, 28 Apr 2017 09:12:17 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3SGCGRB015489
	for <meta-ti@yoctoproject.org>; Fri, 28 Apr 2017 11:12:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493395936;
	bh=/dhRJ4xgZYxwVafh8NadTBXwi6IOZDfYcP9c9RRyAyg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Xm3u1KhS20F4SbHgWAvBAdsWyubRhlCG0uSFkXirkQuCKFMcHPyGoMzZ0+VLc8dT1
	Kf58VsLDx+DpvLXvdtFrwh1a7Nh+kiwa9n+6Rwm+gxDXl7naiscEzMAzVCYRq++qAQ
	j9k0Z2+sCmW8qUIOilNE9INVkEwa7vkextKWXtKU=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3SGCGCL013224
	for <meta-ti@yoctoproject.org>; Fri, 28 Apr 2017 11:12:16 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 28 Apr 2017 11:12:16 -0500
Received: from a0866445-vm1.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v3SGC8el021789;	Fri, 28 Apr 2017 11:12:16 -0500
From: Justin Sobota <jsobota@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 28 Apr 2017 12:11:59 -0400
Message-ID: <1493395920-21543-7-git-send-email-jsobota@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493395920-21543-1-git-send-email-jsobota@ti.com>
References: <1493395920-21543-1-git-send-email-jsobota@ti.com>
MIME-Version: 1.0
Subject: [master/morty][PATCH 7/8] sa-lld: Update to version 3.0.0.17
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
X-List-Received-Date: Fri, 28 Apr 2017 16:12:20 -0000
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


