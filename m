Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.9670.1575664297408810551
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 06 Dec 2019 12:31:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ZmerQYyi;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: j-stiffler@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB6KVaCd005829
	for <meta-ti@lists.yoctoproject.org>; Fri, 6 Dec 2019 14:31:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1575664296;
	bh=ZjTy4XIeR6z+BsEmQKrkVeYuLpkGSU9ELrJgS+vHQNM=;
	h=From:To:CC:Subject:Date;
	b=ZmerQYyiF9wxF87ky1f05v6A4E9X15VKhjUuVfaYxsgElEq+rNzZdLC5M7fX5sPKh
	 DpoEfxepTyTSinytKYwCFN264ZGTCdIl//xOYThHZtnYOAQZimfC4knrDMqAW3MDGG
	 KBEu0KJra3MP9HY91ABw7F3zf+73TTjYXawgBI/s=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB6KVaps004126
	for <meta-ti@lists.yoctoproject.org>; Fri, 6 Dec 2019 14:31:36 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 6 Dec
 2019 14:31:36 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 6 Dec 2019 14:31:36 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB6KVZHl111678;
	Fri, 6 Dec 2019 14:31:36 -0600
From: "Jacob Stiffler" <j-stiffler@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <m-radhakrishnan2@ti.com>, Jacob Stiffler <j-stiffler@ti.com>
Subject: [master/thud][PATCH v3 01/42] ti-pdk-fetch: add class for common pdk sources
Date: Fri, 6 Dec 2019 15:11:49 -0500
Message-ID: <1575663150-19448-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Recently individual components and LLD sources have been combined
into a single PDK repo. Use this class to specify the common source.
Also use this class to keep the sources separate from each other when
building. This keeps the build identical to previous recipes while
keeping control on interdependencies.

Similar to gcc-source, use the ti-pdk-source recipe to unpack the
sources into a "work-shared" area. Then hard-link only the necessary
files into a recipe's WORKDIR.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v3 changes:
* adjust TI_PDK_SRCREV to fix pru-pwm-fw build issue.

 classes/ti-pdk-fetch.bbclass                   | 43 ++++++++++++++++++++++++++
 recipes-bsp/ti-pdk-source/ti-pdk-source_git.bb | 33 ++++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 classes/ti-pdk-fetch.bbclass
 create mode 100644 recipes-bsp/ti-pdk-source/ti-pdk-source_git.bb

diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass
new file mode 100644
index 0000000..e7f8875
--- /dev/null
+++ b/classes/ti-pdk-fetch.bbclass
@@ -0,0 +1,43 @@
+TI_PDK_GIT_URI ?= "git://git.ti.com/processor-sdk/pdk.git"
+TI_PDK_GIT_BRANCH ?= "master"
+TI_PDK_GIT_PROTOCOL ?= "git"
+TI_PDK_SRCREV ?= "69b8b56273fe0c9085fb92d9bfcb7367b724c8af"
+
+TI_PDK_VERSION ?= "2019.11.0"
+
+PV = "${TI_PDK_VERSION}"
+
+TI_PDK_COMP ?= ""
+TI_PDK_COMP_PATH = "${@'${TI_PDK_COMP}'.replace('.','/')}"
+
+TI_PDK_SOURCE_PN = "ti-pdk-source"
+TI_PDK_SOURCE_WORKDIR = "${TMPDIR}/work-shared/ti-pdk-${PV}"
+TI_PDK_SOURCE = "${TI_PDK_SOURCE_WORKDIR}/git"
+
+S = "${WORKDIR}/git/${TI_PDK_COMP_PATH}"
+
+# Hard-link only required sources from PDK
+python do_unpack_append() {
+    if len(d.getVar('TI_PDK_COMP') or '') > 0:
+        import shutil
+
+        # Get src/dst paths
+        src = os.path.join(d.getVar('TI_PDK_SOURCE'),'packages',d.getVar('TI_PDK_COMP_PATH'))
+        s = d.getVar('S')
+
+        # Set up the directory structure, except for the root of the sources
+        # hard-linked.
+        bb.utils.mkdirhier(s)
+        os.rmdir(s)
+
+        # Recursively hard-link the sources
+        shutil.copytree(src, s, copy_function=os.link)
+}
+
+# Make sure that ti-pdk-source is unpacked before we set up the hardlinks.
+python __anonymous () {
+    pn = d.getVar('PN')
+    pdk_src_pn = d.getVar('TI_PDK_SOURCE_PN')
+    if pn != pdk_src_pn:
+        d.appendVarFlag('do_unpack', 'depends', ' ${TI_PDK_SOURCE_PN}:do_unpack')
+}
diff --git a/recipes-bsp/ti-pdk-source/ti-pdk-source_git.bb b/recipes-bsp/ti-pdk-source/ti-pdk-source_git.bb
new file mode 100644
index 0000000..f4b3da9
--- /dev/null
+++ b/recipes-bsp/ti-pdk-source/ti-pdk-source_git.bb
@@ -0,0 +1,33 @@
+# Recipe to fetch/unpack sources used by ti-pdk-fetch recipes.
+#
+# Mimic gcc-source.inc from oe-core.
+
+# These shources will be unpacked to a "work-shared" directory. Then each
+# "ti-pdk-fetch" recipe will hard-link only the sources it requires.
+
+deltask do_configure
+deltask do_compile
+deltask do_install
+deltask do_populate_sysroot
+deltask do_populate_lic
+
+RM_WORK_EXCLUDE += "${PN}"
+EXCLUDE_FROM_WORLD = "1"
+
+inherit nopackages ti-pdk-fetch
+
+LICENSE = "BSD-3-Clause"
+
+PN = "${TI_PDK_SOURCE_PN}"
+WORKDIR = "${TI_PDK_SOURCE_WORKDIR}"
+SSTATE_SWSPEC = "sstate:ti-pdk::${PV}:${PR}::${SSTATE_VERSION}:"
+
+STAMP = "${STAMPS_DIR}/work-shared/ti-pdk-${PV}"
+STAMPCLEAN = "${STAMPS_DIR}/work-shared/ti-pdk-${PV}*"
+
+INHIBIT_DEFAULT_DEPS = "1"
+DEPENDS = ""
+PACKAGES = ""
+
+SRC_URI = "${TI_PDK_GIT_URI};branch=${TI_PDK_GIT_BRANCH};protocol=${TI_PDK_GIT_PROTOCOL}"
+SRCREV = "${TI_PDK_SRCREV}"
-- 
2.7.4

