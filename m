Return-Path: <gthomas@mail.chez-thomas.org>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8D9B0E0147F
	for <meta-ti@yoctoproject.org>; Sat, 29 Dec 2012 04:36:30 -0800 (PST)
Received: by mail.chez-thomas.org (Postfix, from userid 996)
	id 0BF3BF81188; Sat, 29 Dec 2012 05:36:30 -0700 (MST)
From: Gary Thomas <gary@mlbassoc.com>
To: meta-ti@yoctoproject.org
Date: Sat, 29 Dec 2012 05:36:29 -0700
Message-Id: <1356784589-14296-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] netbase: Fix file search path for 'interfaces'
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
X-List-Received-Date: Sat, 29 Dec 2012 12:36:30 -0000

This .bbappend file is used to override the 'interfaces' file for
certain targets.  The current version is broken in that it does not
search the correct path(s).  This patch fixes that, as well as marking
the resulting package as target specific.

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 recipes-core/netbase/netbase_5.0.bbappend |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/recipes-core/netbase/netbase_5.0.bbappend b/recipes-core/netbase/netbase_5.0.bbappend
index 4b8d0e6..e5fa909 100644
--- a/recipes-core/netbase/netbase_5.0.bbappend
+++ b/recipes-core/netbase/netbase_5.0.bbappend
@@ -1,3 +1,2 @@
-THISDIR := "${@os.path.dirname(bb.data.getVar('FILE', d, True))}"
-FILESPATH =. "${@base_set_filespath(["${THISDIR}/${PN}"], d)}:"
-
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-${PV}:"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.7.7.6


