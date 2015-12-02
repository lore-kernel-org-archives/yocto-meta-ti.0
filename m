Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 818BAE00349; Wed,  2 Dec 2015 10:36:36 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EA3A0E00321
	for <meta-ti@yoctoproject.org>; Wed,  2 Dec 2015 10:36:32 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id tB2IaWCk009695
	for <meta-ti@yoctoproject.org>; Wed, 2 Dec 2015 12:36:32 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tB2IaWO9016663
	for <meta-ti@yoctoproject.org>; Wed, 2 Dec 2015 12:36:32 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 2 Dec 2015 12:36:31 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tB2IaTNT005645;	Wed, 2 Dec 2015 12:36:31 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 2 Dec 2015 13:36:28 -0500
Message-ID: <1449081388-3366-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1449081388-3366-1-git-send-email-j-stiffler@ti.com>
References: <1449081388-3366-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] dspdce-fw: Bump SRCREV for build fix
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
X-List-Received-Date: Wed, 02 Dec 2015 18:36:36 -0000
Content-Type: text/plain

* fix issue where dspdce-fw would rebuild dependencies

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/dspdce-fw/dspdce-fw_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/dspdce-fw/dspdce-fw_git.bb b/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
index 3beb4fb..cf4c34c 100644
--- a/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
+++ b/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
@@ -6,7 +6,7 @@ COMPATIBLE_MACHINE = "dra7xx"
 
 SRC_URI = "git://git.ti.com/glsdk/dspdce.git;protocol=git"
 
-SRCREV = "71e8fbf8e4f91b60680cf18a0c202a222e9ae3ba"
+SRCREV = "88705fd4584edd1289e4bb50658def936de90433"
 
 PV = "1.00.00.06"
 
@@ -15,7 +15,7 @@ S = "${WORKDIR}/git"
 require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-staging.inc
 
-PR = "r0"
+PR = "r1"
 inherit update-alternatives
 
 DEPENDS = "ti-xdctools ti-sysbios ti-codec-engine ti-framework-components ti-xdais ti-ipc-rtos ti-osal ti-cgt6x-native"
-- 
1.9.1


