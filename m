Return-Path: <e-ruei1@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 03753E00D5E; Wed, 26 Oct 2016 13:19:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6A9E0E00D59
	for <meta-ti@yoctoproject.org>; Wed, 26 Oct 2016 13:19:38 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u9QKJcjT003388
	for <meta-ti@yoctoproject.org>; Wed, 26 Oct 2016 15:19:38 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9QKJc3F009776
	for <meta-ti@yoctoproject.org>; Wed, 26 Oct 2016 15:19:38 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 26 Oct 2016 15:19:37 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u9QKJbkf027762	for <meta-ti@yoctoproject.org>; Wed, 26 Oct 2016 15:19:37
	-0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 26 Oct 2016 16:19:33 -0400
Message-ID: <1477513173-11563-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] ti-gc320-libs: add all libraries to FILES
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
X-List-Received-Date: Wed, 26 Oct 2016 20:19:41 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
index 45c8d51..90b27e9 100644
--- a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
+++ b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
@@ -26,7 +26,7 @@ python __anonymous() {
 
 TARGET_PRODUCT_omap-a15 = "jacinto6evm"
 
-PR = "r1"
+PR = "r2"
 
 S = "${WORKDIR}/git"
 
@@ -36,4 +36,6 @@ do_install() {
     oe_runmake install
 }
 
+FILES_${PN} += "${libdir}/*"
+
 INSANE_SKIP_${PN} += "ldflags"
-- 
1.9.1


