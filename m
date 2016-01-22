Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A5E4DE00803; Thu, 21 Jan 2016 21:52:25 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B9988E00803
	for <meta-ti@yoctoproject.org>; Thu, 21 Jan 2016 21:52:18 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 95708529A5; Fri, 22 Jan 2016 05:52:17 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160122055217.95708529A5@arago-project.org>
Date: Fri, 22 Jan 2016 05:52:17 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Paul Barker : ti-softhsmv2: Use target includes for zlib and openssl
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
X-List-Received-Date: Fri, 22 Jan 2016 05:52:25 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 80ad03680a5758a2d0db462cb98552a669b5ca06
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=80ad03680a5758a2d0db462cb98552a669b5ca06

Author: Paul Barker <paul.barker@commagility.com>
Date:   Wed Jan 20 20:04:26 2016 +0000

ti-softhsmv2: Use target includes for zlib and openssl

ti-softhsmv2 needs to look at the target include directories instead of the host
include directories for zlib and openssl header files. By using
STAGING_EXECPREFIXDIR we can support changes to exec_prefix.

Signed-off-by: Paul Barker <paul.barker@commagility.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
index c1e1654..3143acd 100644
--- a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
+++ b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
@@ -21,7 +21,10 @@ S = "${WORKDIR}/git"
 CFLAGS += " -mno-unaligned-access"
 CPPFLAGS += " -mno-unaligned-access"
 
-EXTRA_OECONF += "--with-zlib=${STAGING_DIR_HOST}/usr"
+EXTRA_OECONF += " \
+    --with-zlib=${STAGING_EXECPREFIXDIR} \
+    --with-openssl=${STAGING_EXECPREFIXDIR} \
+    "
 
 INITSCRIPT_NAME = "softhsm-daemon.sh"
 INITSCRIPT_PARAMS = "defaults 10"


