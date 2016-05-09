Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 30372E00736; Mon,  9 May 2016 09:34:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AFE9EE006D8
	for <meta-ti@yoctoproject.org>; Mon,  9 May 2016 09:33:59 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u49GXwdE017663
	for <meta-ti@yoctoproject.org>; Mon, 9 May 2016 11:33:58 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u49GXwmg022293
	for <meta-ti@yoctoproject.org>; Mon, 9 May 2016 11:33:58 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 9 May 2016 11:33:57 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u49GXvKj003292;	Mon, 9 May 2016 11:33:57 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 9 May 2016 12:33:50 -0400
Message-ID: <1462811630-25842-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [fido][PATCH] omap5-sgx-ddk-um-linux: Add DEPENDS based on REDEPENDS
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
X-List-Received-Date: Mon, 09 May 2016 16:34:03 -0000
Content-Type: text/plain

* The omap5-sgx-ddk-um-linux recipe installs pre-built libraries
* Because of this, the dependencies are given as RDEPENDS as they are
  not needed for building the recipe
* However, this may break recipes which depend on
  omap5-sgx-ddk-um-linux, as the omap5-sgx-ddk-um-linux dependencies
  may not yet be populated in the sysroot.
* This resolves the break in the dependency chain by translating the
  RDEPENDS into a list of DEPENDS

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb
index a79c61f..a4a00b9 100644
--- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb
+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb
@@ -19,9 +19,10 @@ INITSCRIPT_PARAMS = "defaults 8"
 
 inherit update-rc.d
 
-PR = "r8"
+PR = "r9"
 PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2"
 
+DEPENDS += "libdrm udev libgbm wayland libffi"
 RDEPENDS_${PN} += "libdrm libudev libgbm wayland libffi libdrm-omap"
 
 RREPLACES_${PN} = "libegl libgles1 libgles2"
-- 
2.7.4


