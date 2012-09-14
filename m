Return-Path: <denys@ti.com>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9BE2FE01430
	for <meta-ti@yoctoproject.org>; Thu, 13 Sep 2012 23:47:30 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MAB00CT0UUDNIZ3@vms173005.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 14 Sep 2012 01:47:01 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id F3C5620031; Fri,
	14 Sep 2012 02:47:00 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Fri, 14 Sep 2012 02:46:51 -0400
Message-id: <1347605211-12813-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 1.7.8.6
In-reply-to: <20120914064306.GC26968@edge>
References: <20120914064306.GC26968@edge>
Subject: [RFC: PATCH 1] ti-hw-bringup-image: fix 'no LICENSE' parsing error when meta-angstrom is not used
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
X-List-Received-Date: Fri, 14 Sep 2012 06:47:30 -0000

When meta-angstrom is not used in BBLAYERS, parsing of ti-hw-bringup-image and
all other cloud9-*image recipes in recipes-misc/ fails with "No LICENSE field
set" error message, as they use the base systemd-image recipe from meta-angstrom
that sets the license.

This workaround makes the recipes parse by duplicating the license info locally.
They still cannot be built though, as the base systemd-image is not available
w/o referencing meta-angstrom.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-misc/images/ti-hw-bringup-image.bb |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/recipes-misc/images/ti-hw-bringup-image.bb b/recipes-misc/images/ti-hw-bringup-image.bb
index 9490098..0590445 100644
--- a/recipes-misc/images/ti-hw-bringup-image.bb
+++ b/recipes-misc/images/ti-hw-bringup-image.bb
@@ -2,6 +2,10 @@
 
 include recipes-images/angstrom/systemd-image.bb
 
+# Repeat the license info here, if systemd-image.bb from meta-angstrom is not available
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+
 EXTRA_MACHINE_IMAGE_INSTALL ?= ""
 
 # Hokey-pokey workaround for MUSB bugs
-- 
1.7.8.6


