Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B005FE013DE
	for <meta-ti@yoctoproject.org>; Mon, 19 Aug 2013 17:12:54 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 76ABA52A85; Tue, 20 Aug 2013 00:12:50 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130820001250.76ABA52A85@arago-project.org>
Date: Tue, 20 Aug 2013 00:12:50 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Ian Reinhart Geiser : xserver-xf86-config: Fix filespath usage
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
Branch: master
Commit: bb82b0b279b8f46fae1442d3f1acd471242242a3
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=bb82b0b279b8f46fae1442d3f1acd471242242a3

Author: Ian Reinhart Geiser <igeiser@devonit.com>
Date:   Sun Aug 11 19:41:35 2013 -0400

xserver-xf86-config: Fix filespath usage

The old way of setting THISDIR in a bbappend clobbers THISDIR for
other layers.  This change makes it use the new way that is done
in dylan.

Signed-off-by: Ian Reinhart Geiser <igeiser@devonit.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../xorg-xserver/xserver-xf86-config_0.1.bbappend  |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend b/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
index 1615df3..491d403 100644
--- a/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
+++ b/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
@@ -1,5 +1,2 @@
-PRINC = "2"
-
-THISDIR := "${@os.path.dirname(bb.data.getVar('FILE', d, True))}"
-FILESPATH =. "${@base_set_filespath(["${THISDIR}/${PN}"], d)}:"
-
+PRINC := "${@int(PRINC) + 1}"
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"


