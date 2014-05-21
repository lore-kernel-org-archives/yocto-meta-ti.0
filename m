Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6296DE00BEA; Wed, 21 May 2014 13:58:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 1.3 RDNS_NONE Delivered to internal network by a host
	with no rDNS
Received: from arago-project.org (unknown [184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 19921E00B94
	for <meta-ti@yoctoproject.org>; Wed, 21 May 2014 13:58:40 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id BB05452A6F; Wed, 21 May 2014 20:58:39 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140521205839.BB05452A6F@arago-project.org>
Date: Wed, 21 May 2014 20:58:39 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVyIHhzZXJ2ZXIteGY4Ni1jb25maWdfMC4xOiByZW1vdmUgUFJJTkM=?=
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
X-List-Received-Date: Wed, 21 May 2014 20:58:46 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: dd71096bb3a3964f8b0a3413a7d867547081bba6
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=dd71096bb3a3964f8b0a3413a7d867547081bba6

Author: Andreas Müller <schnitzeltony@googlemail.com>
Date:   Thu May  8 17:19:47 2014 +0000

xserver-xf86-config_0.1: remove PRINC

last oe-core PR-bump was commited May 2nd

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../xorg-xserver/xserver-xf86-config_0.1.bbappend  |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend b/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
index 491d403..72d991c 100644
--- a/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
+++ b/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
@@ -1,2 +1 @@
-PRINC := "${@int(PRINC) + 1}"
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"


