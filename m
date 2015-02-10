Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BAABDE00993; Tue, 10 Feb 2015 12:54:15 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 54924E00949
	for <meta-ti@yoctoproject.org>; Tue, 10 Feb 2015 12:54:05 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 2493252A5C; Tue, 10 Feb 2015 20:54:05 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150210205405.2493252A5C@arago-project.org>
Date: Tue, 10 Feb 2015 20:54:05 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : libp11: Add recipe for libp11
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
X-List-Received-Date: Tue, 10 Feb 2015 20:54:15 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 24dab89ad8b7efa914621309ff3f951e0bb21fb1
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=24dab89ad8b7efa914621309ff3f951e0bb21fb1

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Wed Feb 11 02:50:56 2015 +0000

libp11: Add recipe for libp11

- Provides PKCS11 abstraction library

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/libp11/libp11_git.bb |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/recipes-ti/libp11/libp11_git.bb b/recipes-ti/libp11/libp11_git.bb
new file mode 100644
index 0000000..459c751
--- /dev/null
+++ b/recipes-ti/libp11/libp11_git.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "PKCS11 abstraction library"
+LICENSE = "LGPL2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fad9b3332be894bab9bc501572864b29"
+SECTION = "libs"
+
+inherit autotools pkgconfig
+
+DEPENDS = "openssl libtool"
+RDEPENDS_${PN} = "ti-softhsmv2"
+
+SRC_URI = "git://git.ti.com/keystone-linux/libp11.git;protocol=git;branch=${BRANCH}"
+BRANCH="master"
+# Following commit corresponds to DEV.LIBP11-01.03.00.00
+SRCREV = "43c4f63a8d803fde2bcd8e4f8969e5fe9edf0e33"
+PV = "1.3.0.0"
+
+S = "${WORKDIR}/git"


