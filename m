Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8272BE008F1; Thu, 28 Jan 2016 06:46:52 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B4859E00803
	for <meta-ti@yoctoproject.org>; Thu, 28 Jan 2016 06:46:51 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0SEko6i021938
	for <meta-ti@yoctoproject.org>; Thu, 28 Jan 2016 08:46:51 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0SEkoYo002556
	for <meta-ti@yoctoproject.org>; Thu, 28 Jan 2016 08:46:50 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 28 Jan 2016 08:46:50 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u0SEko7m017188;	Thu, 28 Jan 2016 08:46:50 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 28 Jan 2016 09:46:48 -0500
Message-ID: <1453992408-23937-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] hplib-mod: Add to KERNEL_MODULE_AUTOLOAD
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
X-List-Received-Date: Thu, 28 Jan 2016 14:46:52 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/hplib/hplib-mod_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-bsp/hplib/hplib-mod_git.bb b/recipes-bsp/hplib/hplib-mod_git.bb
index 6603a2e..c7217d7 100644
--- a/recipes-bsp/hplib/hplib-mod_git.bb
+++ b/recipes-bsp/hplib/hplib-mod_git.bb
@@ -7,7 +7,7 @@ DEPENDS = "hplib"
 include hplib.inc
 
 # This package builds a kernel module, use kernel PR as base and append a local
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
 S ="${WORKDIR}/git/ti/runtime/hplib/module"
@@ -18,3 +18,5 @@ inherit module
 do_install () {
 	oe_runmake install INSTALL_MOD_PATH="${D}"
 }
+
+KERNEL_MODULE_AUTOLOAD += "hplibmod"
-- 
1.9.1


