Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3C06EE003E2
	for <meta-ti@yoctoproject.org>; Mon, 19 Aug 2013 17:12:51 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 3535B52A87; Tue, 20 Aug 2013 00:12:50 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130820001250.3535B52A87@arago-project.org>
Date: Tue, 20 Aug 2013 00:12:49 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Ian Reinhart Geiser : formfactor: Fix filespath usage
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
X-List-Received-Date: Tue, 20 Aug 2013 00:12:54 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: acf1d6a980186321e4467b9849bb9cb8d5dd8396
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=acf1d6a980186321e4467b9849bb9cb8d5dd8396

Author: Ian Reinhart Geiser <igeiser@devonit.com>
Date:   Sun Aug 11 19:41:34 2013 -0400

formfactor: Fix filespath usage

The old way of setting THISDIR in a bbappend clobbers THISDIR for
other layers.  This change makes it use the new way that is done
in dylan.

Signed-off-by: Ian Reinhart Geiser <igeiser@devonit.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/formfactor/formfactor_0.0.bbappend |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/formfactor/formfactor_0.0.bbappend b/recipes-bsp/formfactor/formfactor_0.0.bbappend
index 4b8d0e6..491d403 100644
--- a/recipes-bsp/formfactor/formfactor_0.0.bbappend
+++ b/recipes-bsp/formfactor/formfactor_0.0.bbappend
@@ -1,3 +1,2 @@
-THISDIR := "${@os.path.dirname(bb.data.getVar('FILE', d, True))}"
-FILESPATH =. "${@base_set_filespath(["${THISDIR}/${PN}"], d)}:"
-
+PRINC := "${@int(PRINC) + 1}"
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"


