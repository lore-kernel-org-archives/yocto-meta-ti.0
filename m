Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2D57DE00ACE; Tue,  3 Nov 2015 11:47:44 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 55078E00AA5
	for <meta-ti@yoctoproject.org>; Tue,  3 Nov 2015 11:47:43 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA3Jlhha027119
	for <meta-ti@yoctoproject.org>; Tue, 3 Nov 2015 13:47:43 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA3JlgxU001674
	for <meta-ti@yoctoproject.org>; Tue, 3 Nov 2015 13:47:43 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 3 Nov 2015 13:47:43 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tA3Jla78022118;	Tue, 3 Nov 2015 13:47:42 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 3 Nov 2015 14:47:14 -0500
Message-ID: <1446580053-16935-9-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446580053-16935-1-git-send-email-j-stiffler@ti.com>
References: <1446580053-16935-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 08/27] hplib: Only build binaries relevent to the machine
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
X-List-Received-Date: Tue, 03 Nov 2015 19:47:44 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/hplib/hplib.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/recipes-bsp/hplib/hplib.inc b/recipes-bsp/hplib/hplib.inc
index 7ed47a5..e5fe567 100644
--- a/recipes-bsp/hplib/hplib.inc
+++ b/recipes-bsp/hplib/hplib.inc
@@ -1,6 +1,9 @@
 COMPATIBLE_MACHINE = "keystone"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-DEVICELIST = "k2h k2k k2l k2e"
+DEVICELIST_k2hk-evm = "k2h k2k"
+DEVICELIST_k2l-evm  = "k2l"
+DEVICELIST_k2e-evm  = "k2e"
 
 HPLIB_GIT_URI = "git://git.ti.com/keystone-rtos/hplib.git"
 HPLIB_GIT_PROTOCOL = "git"
-- 
1.9.1


