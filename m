Return-Path: <i-pang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9F27DE00B67; Tue, 13 Jun 2017 10:43:07 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3ADDBE00888
	for <meta-ti@yoctoproject.org>; Tue, 13 Jun 2017 10:43:06 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5DHh5RL013841
	for <meta-ti@yoctoproject.org>; Tue, 13 Jun 2017 12:43:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1497375785;
	bh=tosrGvcb5rp05QvTMHYs4E3NugmwUiqhNBzb0wPhvfc=;
	h=From:To:Subject:Date;
	b=HSufEaz1Zido0Ib+FfAAgnI5ubanCeU3LY9nBouKkRDqQdU0WipzWBBZ3j2L8AUJD
	MJVv4PoEr5AgubPp//aDOixZV7oGA3RrMp/OY34hPzBAcIfH9oy4c0Z1DXmuntEPPf
	cBT9/5J0zjdkVyL3lV42vAbi0uvEMAQLn4PhHAFA=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5DHh58e014124
	for <meta-ti@yoctoproject.org>; Tue, 13 Jun 2017 12:43:05 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 13 Jun 2017 12:43:05 -0500
Received: from uda0868762.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v5DHh5Pm018849	for <meta-ti@yoctoproject.org>; Tue, 13 Jun 2017 12:43:05
	-0500
From: Ivan Pang <i-pang@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 13 Jun 2017 12:43:05 -0500
Message-ID: <1497375785-18461-1-git-send-email-i-pang@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] ti-staging.inc: enable INHIBIT_SYSROOT_STRIP and INHIBIT_PACKAGE_DEBUG_SPLIT
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
X-List-Received-Date: Tue, 13 Jun 2017 17:43:07 -0000
Content-Type: text/plain

Signed-off-by: Ivan Pang <i-pang@ti.com>
---
 recipes-ti/includes/ti-staging.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-ti/includes/ti-staging.inc b/recipes-ti/includes/ti-staging.inc
index b588805..ae523ce 100644
--- a/recipes-ti/includes/ti-staging.inc
+++ b/recipes-ti/includes/ti-staging.inc
@@ -1,4 +1,6 @@
 INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_SYSROOT_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 
 ALLOW_EMPTY_${PN} = "1"
 ALLOW_EMPTY_${PN}-dev = "1"
-- 
1.9.1


