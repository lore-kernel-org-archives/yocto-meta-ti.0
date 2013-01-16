Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 45CEDE006C3
	for <meta-ti@yoctoproject.org>; Wed, 16 Jan 2013 10:06:41 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 02A4152AA3; Wed, 16 Jan 2013 18:06:40 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130116180641.02A4152AA3@arago-project.org>
Date: Wed, 16 Jan 2013 18:06:40 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : netbase: fix file search path for 'interfaces' file
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
X-List-Received-Date: Wed, 16 Jan 2013 18:06:41 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: denzil
Commit: 95e9cf6299f5bae6965fe6fc4abe3eeb631df196
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=95e9cf6299f5bae6965fe6fc4abe3eeb631df196

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Jan 16 12:29:57 2013 -0500

netbase: fix file search path for 'interfaces' file

This .bbappend file is used to override the 'interfaces' file for certain
targets. The current version is broken in that it does not search the correct
path(s).

Thanks to Robert P. J. Day and Gary Thomas for spotting the issue and providing
patches.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-core/netbase/netbase_4.47.bbappend |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/recipes-core/netbase/netbase_4.47.bbappend b/recipes-core/netbase/netbase_4.47.bbappend
index 4b8d0e6..5622303 100644
--- a/recipes-core/netbase/netbase_4.47.bbappend
+++ b/recipes-core/netbase/netbase_4.47.bbappend
@@ -1,3 +1 @@
-THISDIR := "${@os.path.dirname(bb.data.getVar('FILE', d, True))}"
-FILESPATH =. "${@base_set_filespath(["${THISDIR}/${PN}"], d)}:"
-
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-${PV}:"


