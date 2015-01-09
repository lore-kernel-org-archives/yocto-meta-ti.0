Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B5884E0090F; Fri,  9 Jan 2015 11:58:08 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 39563E0070B
	for <meta-ti@yoctoproject.org>; Fri,  9 Jan 2015 11:57:56 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 3879252A19; Fri,  9 Jan 2015 19:57:53 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150109195753.3879252A19@arago-project.org>
Date: Fri,  9 Jan 2015 19:57:53 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : pktlib: Update to explicitly include compile and install steps
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
X-List-Received-Date: Fri, 09 Jan 2015 19:58:08 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 160d356e18fb1a16592fee21a8959bf58ec3659c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=160d356e18fb1a16592fee21a8959bf58ec3659c

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Sat Jan 10 01:55:07 2015 +0000

pktlib: Update to explicitly include compile and install steps

- without this the compilation and install doesnot happen
  because of main make filename.
- Correct mistake on extra oemake options

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/pktlib/pktlib_git.bb |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/pktlib/pktlib_git.bb b/recipes-bsp/pktlib/pktlib_git.bb
index df68f76..aa21974 100644
--- a/recipes-bsp/pktlib/pktlib_git.bb
+++ b/recipes-bsp/pktlib/pktlib_git.bb
@@ -14,6 +14,12 @@ PV = "2.1.0.4"
 
 S = "${WORKDIR}/git/ti/runtime/pktlib"
 
-EXTRA_OEMAKE += "-f make=file_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}"
+EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}"
 
-MAKE_TARGETS = "lib"
+do_compile () {
+	oe_runmake lib
+}
+
+do_install () {
+	oe_runmake install
+}


