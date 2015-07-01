Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AA477E009F3; Wed,  1 Jul 2015 08:20:08 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 69141E007A3
	for <meta-ti@yoctoproject.org>; Wed,  1 Jul 2015 08:20:01 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t61FK0UJ002490
	for <meta-ti@yoctoproject.org>; Wed, 1 Jul 2015 10:20:00 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t61FK0DR014262
	for <meta-ti@yoctoproject.org>; Wed, 1 Jul 2015 10:20:00 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 1 Jul 2015 10:19:55 -0500
Received: from localhost.localdomain (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t61FK0GS008827;	Wed, 1 Jul 2015 10:20:00 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 1 Jul 2015 11:19:54 -0400
Message-ID: <1435763994-842-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] ti-softhsmv2: Stop recipe from using headers from host build machine.
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
X-List-Received-Date: Wed, 01 Jul 2015 15:20:08 -0000
Content-Type: text/plain

* Without the "--with-zlib" configure option, the zlib header will be
  obtained from the build machines "/usr/include" directory if the
  header exists there.
* From ${S}/m4/acx_zlib.m4:

AC_DEFUN([ACX_ZLIB],[
        AC_ARG_WITH(zlib,
                AC_HELP_STRING([--with-zlib=PATH],[Specify prefix of path of zlib]),
                [
                        ZLIB_PATH="$withval"
                ],
                [
                        ZLIB_PATH="/usr"
                ])

        AC_MSG_CHECKING(what are the zlib includes)
        ZLIB_INCLUDES="-I$ZLIB_PATH/include"
...

* Therefore add configure option to point to staging sysroot for zlib
  header and add dependency on zlib.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
index 518508c..329fbaa 100644
--- a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
+++ b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
@@ -7,7 +7,7 @@ mntdir = "/mnt"
 
 inherit autotools pkgconfig
 
-DEPENDS = "openssl libdaemon"
+DEPENDS = "openssl libdaemon zlib"
 COMPATIBLE_MACHINE = "(tci6614-evm|keystone)"
 
 BRANCH="master"
@@ -15,12 +15,15 @@ SRC_URI = "git://git.ti.com/keystone-linux/ti-softhsmv2.git;protocol=git;branch=
 #Following commit corresponds to tag DEV.SOFTHSM-01.03.00.01
 SRCREV = "c79d93ac2a326567a7245dda1b903ef340b5650c"
 PV = "1.3.0.1"
+PR = "r1"
 
 S = "${WORKDIR}/git"
 
 CFLAGS += " -mno-unaligned-access"
 CPPFLAGS += " -mno-unaligned-access"
 
+EXTRA_OECONF += "--with-zlib=${STAGING_DIR_HOST}/usr"
+
 INITSCRIPT_NAME = "softhsm-daemon.sh"
 INITSCRIPT_PARAMS = "defaults 10"
 
-- 
1.7.9.5


