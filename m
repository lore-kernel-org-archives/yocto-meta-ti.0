Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 33CDFE013BB
	for <meta-ti@yoctoproject.org>; Wed, 30 May 2012 15:19:26 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.48.117.33])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M4U00AQ8WNOWPAB@vms173015.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 30 May 2012 17:19:11 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 8F7D920015; Wed,
	30 May 2012 18:19:00 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 30 May 2012 18:18:54 -0400
Message-id: <1338416335-4453-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.7.8.6
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 1/2] tipspkernel: add extra level to FILESPATH with major version in the name
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 30 May 2012 22:19:26 -0000

From: Denys Dmytriyenko <denys@ti.com>

Add PMV variable to contain major version by extracting first 2 numbers from PV
Insert new level to FILESPATH - PN-PV-PR:PN-PV:PN-PMV:PN:files:.
Allow keeping patches and configs generic for the series (i.e. 3.2) while
incrementing stable releases (i.e. 3.2.18)
Drop use of BP and BPN, as they don't change for the kernel

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/tipspkernel.inc |   19 +++++++++++++++++--
 1 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/tipspkernel.inc b/recipes-kernel/linux/tipspkernel.inc
index c23fa57..ba93530 100644
--- a/recipes-kernel/linux/tipspkernel.inc
+++ b/recipes-kernel/linux/tipspkernel.inc
@@ -1,11 +1,26 @@
 # Include this file for kernel recipes that need to handle different defconfigs
 # and apply patches based on "tipspkernel" DISTRO_FEATURES
 
+def get_major_pv(p):
+	import re
+	r = re.compile("([0-9]+\.[0-9]+).*")
+	m = r.match(p);
+	if m:
+		return m.group(1)
+	return None
+
+PMV = "${@get_major_pv(d.getVar('PV', True))}"
+
+# First of all, set own FILESPATH avoiding unnecessary BP and BPN, but adding
+# extra level of major version
+FILESPATH = "${@base_set_filespath([ "${FILE_DIRNAME}/${PF}", "${FILE_DIRNAME}/${P}", "${FILE_DIRNAME}/${PN}-${PMV}", \
+"${FILE_DIRNAME}/${PN}", "${FILE_DIRNAME}/files", "${FILE_DIRNAME}" ], d)}"
+
 # We don't want "tipspkernel" to be another OVERRIDE, but rather a new level of
 # FILESPATH with all the OVERRIDES applied to it
 CONFIGS_PSP = "${@base_set_filespath(["${FILE_DIRNAME}/${PF}/tipspkernel", "${FILE_DIRNAME}/${P}/tipspkernel", \
-"${FILE_DIRNAME}/${PN}/tipspkernel", "${FILE_DIRNAME}/${BP}/tipspkernel", "${FILE_DIRNAME}/${BPN}/tipspkernel", \
-"${FILE_DIRNAME}/files/tipspkernel", "${FILE_DIRNAME}/tipspkernel"], d)}:"
+"${FILE_DIRNAME}/${PN}-${PMV}/tipspkernel", "${FILE_DIRNAME}/${PN}/tipspkernel", "${FILE_DIRNAME}/files/tipspkernel", \
+"${FILE_DIRNAME}/tipspkernel"], d)}:"
 
 # When "tipspkernel" is ENABLED, prepend additional set of directories to FILESPATH
 FILESPATH =. "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "${CONFIGS_PSP}", "", d)}"
-- 
1.7.8.6


