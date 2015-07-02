Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 98450E009D7; Thu,  2 Jul 2015 16:13:00 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3B322E00947
	for <meta-ti@yoctoproject.org>; Thu,  2 Jul 2015 16:13:00 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id DD51052A4B; Thu,  2 Jul 2015 23:12:59 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150702231259.DD51052A4B@arago-project.org>
Date: Thu,  2 Jul 2015 23:12:59 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : ti-softhsmv2: Stop recipe from using headers from host build machine.
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
X-List-Received-Date: Thu, 02 Jul 2015 23:13:00 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: b28b085864b8da9af09b3d8e55e591f475ab3415
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=b28b085864b8da9af09b3d8e55e591f475ab3415

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Jul  1 21:19:54 2015 +0000

ti-softhsmv2: Stop recipe from using headers from host build machine.

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
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

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
 


