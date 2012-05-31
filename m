Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C3395E013D4
	for <meta-ti@yoctoproject.org>; Thu, 31 May 2012 15:34:01 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 23263529DA; Thu, 31 May 2012 22:33:59 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120531223400.23263529DA@arago-project.org>
Date: Thu, 31 May 2012 22:33:59 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : tipspkernel: add extra level to FILESPATH with major version in the name
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
X-List-Received-Date: Thu, 31 May 2012 22:34:02 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 16e8d191973677957ca9ebf2f998326f169ebd50
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=16e8d191973677957ca9ebf2f998326f169ebd50

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed May 30 18:01:41 2012 -0400

tipspkernel: add extra level to FILESPATH with major version in the name

Add PMV variable to contain major version by extracting first 2 numbers from PV
Insert new level to FILESPATH - PN-PV-PR:PN-PV:PN-PMV:PN:files:.
Allow keeping patches and configs generic for the series (i.e. 3.2) while
incrementing stable releases (i.e. 3.2.18)
Drop use of BP and BPN, as they don't change for the kernel

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Koen Kooi <koen@circuitco.com>

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


