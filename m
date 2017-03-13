Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BB3DEE007EE; Mon, 13 Mar 2017 14:13:07 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 54522E00655
	for <meta-ti@yoctoproject.org>; Mon, 13 Mar 2017 14:13:05 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2DLD5Xd021387
	for <meta-ti@yoctoproject.org>; Mon, 13 Mar 2017 16:13:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489439585;
	bh=CzEeBPPmwKlx9EgnsXWso8oFuOuvXMC5jdLu4f/awLw=;
	h=From:To:CC:Subject:Date;
	b=jsApmpQgx8ZRH0zwsNqwwcj3RuYY9snmQ+zaf+JjE29RG2e3ZYVK4GgnZIt+eeYaO
	mWc0WUk1eMUxIq257s8iX8K6b1p0IXtA3Dmas6AzQjaEjFogj4NBIgLERB9rGfAnyw
	tmOKLMdAegzVHyjOiv3LLBCM27gyKGTBYj2JfhKI=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2DLD33F021970
	for <meta-ti@yoctoproject.org>; Mon, 13 Mar 2017 16:13:05 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 13 Mar 2017 16:13:04 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v2DLD40e021528;	Mon, 13 Mar 2017 16:13:04 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 13 Mar 2017 17:13:02 -0400
Message-ID: <1489439582-46689-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH krogoth/morty/master] ti-ipc-rtos: Update to remove host-user-contaminated warnings
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
X-List-Received-Date: Mon, 13 Mar 2017 21:13:07 -0000
Content-Type: text/plain

Update to copy NOT to preserve ownership (but to preserve mode and
timestamps)

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/ipc/ti-ipc-rtos.inc    | 2 +-
 recipes-ti/ipc/ti-ipc-rtos_git.bb | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
index 7f029a7..b29e984 100644
--- a/recipes-ti/ipc/ti-ipc-rtos.inc
+++ b/recipes-ti/ipc/ti-ipc-rtos.inc
@@ -37,7 +37,7 @@ S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
 RELEASE_TYPE = "GA"
 RELEASE_SUFFIX = ""
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 DEPENDS_append_keystone = " ti-cgt6x-native \
                             gcc-arm-none-eabi-native \
diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rtos_git.bb
index f0ccb10..018634c 100644
--- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
+++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -62,13 +62,14 @@ do_compile() {
 }
 
 do_install() {
+  CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
   IPC_VERSION=`echo ${PV}${RELEASE_SUFFIX} | sed -e 's|\.|_|g'`
   # Copy docs and other meta files
   install -d ${D}${IPC_INSTALL_DIR_RECIPE}
-  cp -pPrf  ${IPC_PACKAGE_DIR}/* -d ${D}${IPC_INSTALL_DIR_RECIPE}
+  cp ${CP_ARGS} ${IPC_PACKAGE_DIR}/* -d ${D}${IPC_INSTALL_DIR_RECIPE}
 
   install -d ${D}${base_libdir}/firmware/ipc
-  cp -pPrf ${S}/packages/ti/ipc/tests/bin/* ${D}${base_libdir}/firmware/ipc || true
+  cp ${CP_ARGS} ${S}/packages/ti/ipc/tests/bin/* ${D}${base_libdir}/firmware/ipc || true
 }
 
 ALTERNATIVE_PRIORITY = "5"
-- 
1.9.1


