Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EC56AE00B87; Wed, 21 May 2014 13:58:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 1.3 RDNS_NONE Delivered to internal network by a host
	with no rDNS
Received: from arago-project.org (unknown [184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ADB8DE00B85
	for <meta-ti@yoctoproject.org>; Wed, 21 May 2014 13:58:33 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 92D1552A73; Wed, 21 May 2014 20:58:33 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140521205833.92D1552A73@arago-project.org>
Date: Wed, 21 May 2014 20:58:33 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVyIGZvcm1mYWN0b3I6IDogcmVtb3ZlIFBSSU5D?=
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
X-List-Received-Date: Wed, 21 May 2014 20:58:36 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 0784e22039dcf52cfd34bd244bc94c9ac92c7676
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=0784e22039dcf52cfd34bd244bc94c9ac92c7676

Author: Andreas Müller <schnitzeltony@googlemail.com>
Date:   Thu May  8 17:19:48 2014 +0000

formfactor: : remove PRINC

last oe-core PR-bump was commited May 2nd

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/formfactor/formfactor_0.0.bbappend |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/formfactor/formfactor_0.0.bbappend b/recipes-bsp/formfactor/formfactor_0.0.bbappend
index 491d403..72d991c 100644
--- a/recipes-bsp/formfactor/formfactor_0.0.bbappend
+++ b/recipes-bsp/formfactor/formfactor_0.0.bbappend
@@ -1,2 +1 @@
-PRINC := "${@int(PRINC) + 1}"
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"


