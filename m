Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 09937E00B56; Tue,  3 Nov 2015 11:47:48 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8C51CE00B2F
	for <meta-ti@yoctoproject.org>; Tue,  3 Nov 2015 11:47:47 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA3JllsF014598
	for <meta-ti@yoctoproject.org>; Tue, 3 Nov 2015 13:47:47 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA3Jllb1001888
	for <meta-ti@yoctoproject.org>; Tue, 3 Nov 2015 13:47:47 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 3 Nov 2015 13:47:47 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tA3Jla7N022118;	Tue, 3 Nov 2015 13:47:46 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 3 Nov 2015 14:47:29 -0500
Message-ID: <1446580053-16935-24-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446580053-16935-1-git-send-email-j-stiffler@ti.com>
References: <1446580053-16935-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 23/27] sa-lld-test: Only build binaries relevent to the machine
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
X-List-Received-Date: Tue, 03 Nov 2015 19:47:48 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/sa-lld/sa-lld-test_git.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/sa-lld/sa-lld-test_git.bb b/recipes-bsp/sa-lld/sa-lld-test_git.bb
index 4f74ab6..eeab6ff 100644
--- a/recipes-bsp/sa-lld/sa-lld-test_git.bb
+++ b/recipes-bsp/sa-lld/sa-lld-test_git.bb
@@ -4,9 +4,13 @@ DEPENDS = "common-csl-ip cppi-lld qmss-lld pa-lld sa-lld"
 
 include sa-lld.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
-DEVICELIST = "k2h k2k k2l k2e"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+DEVICELIST_k2hk-evm = "k2h k2k"
+DEVICELIST_k2l-evm  = "k2l"
+DEVICELIST_k2e-evm  = "k2e"
 
 CHOICELIST = "no yes"
 
-- 
1.9.1


