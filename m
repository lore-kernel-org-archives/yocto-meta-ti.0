Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0338AE008EA; Thu, 19 Feb 2015 13:46:20 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C6FDFE008BC
	for <meta-ti@yoctoproject.org>; Thu, 19 Feb 2015 13:46:16 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id D31EE52AB8; Thu, 19 Feb 2015 21:46:14 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150219214614.D31EE52AB8@arago-project.org>
Date: Thu, 19 Feb 2015 21:46:14 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : engine-pkcs11: Add recipe for PKCS11 engine
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
X-List-Received-Date: Thu, 19 Feb 2015 21:46:20 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 0b6676ff7389b807d197efdeaac541d496a43d9c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=0b6676ff7389b807d197efdeaac541d496a43d9c

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Wed Feb 11 05:04:35 2015 +0000

engine-pkcs11: Add recipe for PKCS11 engine

- Provides OpenSSL PKCS11 engine

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/engine-pkcs11/engine-pkcs11_git.bb |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/recipes-ti/engine-pkcs11/engine-pkcs11_git.bb b/recipes-ti/engine-pkcs11/engine-pkcs11_git.bb
new file mode 100644
index 0000000..226beac
--- /dev/null
+++ b/recipes-ti/engine-pkcs11/engine-pkcs11_git.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "OpenSSL PKCS11 engine"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://src/engine_pkcs11.h;startline=1;endline=26;md5=471dacb7f0586e35729f422b8098585f"
+SECTION = "libs"
+
+inherit autotools pkgconfig
+
+DEPENDS = "openssl libtool libp11"
+
+PV = "1.3.0.0"
+BRANCH="master"
+# Commit corresponds to DEV.ENGINE_PKCS11-01.03.00.00
+SRCREV = "0b14500b0ea8b37453b6d93aac02278465e7e732"
+
+SRC_URI = "git://git.ti.com/keystone-linux/engine-pkcs11.git;protocol=git;branch=${BRANCH}"
+S = "${WORKDIR}/git"
+
+FILES_${PN} += "${libdir}/engines/*.so*"
+FILES_${PN}-dbg += "${libdir}/engines/.debug"


