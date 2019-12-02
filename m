Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.5968.1575313496085114724
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 Dec 2019 11:04:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=SlWlrepS;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: j-stiffler@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9DB4EE01101; Mon,  2 Dec 2019 11:04:55 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 887ABE0107E
	for <meta-ti@yoctoproject.org>; Mon,  2 Dec 2019 11:04:54 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB2J4rG9122986
	for <meta-ti@yoctoproject.org>; Mon, 2 Dec 2019 13:04:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1575313493;
	bh=hlmEi3hhcu2ulyT99u7yiTi3RLHgxQ3l19rqv7EUf9I=;
	h=From:To:CC:Subject:Date;
	b=SlWlrepShV4UcLJc1EJuimTQ5DXifc4V6a8zzdZeInlq2iB9Kt5xEuxoCg3Uyt5te
	 wBF7SEB/g7WnYCNbkjAhkr9G1RNq3lxvMlYqqI3/bL89eRQEoPgcrbOlQzxe9IcFuf
	 ge6G7m9FtXDwrFm7PK0gIWzojpHlOx3ICrcFjPW0=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB2J4rTb009323
	for <meta-ti@yoctoproject.org>; Mon, 2 Dec 2019 13:04:53 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 2 Dec
 2019 13:04:53 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 2 Dec 2019 13:04:53 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB2J4rlf070019;
	Mon, 2 Dec 2019 13:04:53 -0600
From: "Jacob Stiffler" <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
CC: <m-radhakrishnan2@ti.com>, Jacob Stiffler <j-stiffler@ti.com>
Subject: [master/thud][PATCH v2 01/42] ti-pdk-fetch: add class for common pdk sources
Date: Mon, 2 Dec 2019 13:45:05 -0500
Message-ID: <1575312346-16973-1-git-send-email-j-stiffler@ti.com>
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
v2 changes:

To be more efficient, use ti-pdk-source to unpack sources once to a
common "work-shared" area. Then each recipe will hard-link only the
necessary sources. Follow the example set by gcc-source in oe-core.

 classes/ti-pdk-fetch.bbclass                   | 43 ++++++++++++++++++++++++++
 recipes-bsp/ti-pdk-source/ti-pdk-source_git.bb | 33 ++++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 classes/ti-pdk-fetch.bbclass
 create mode 100644 recipes-bsp/ti-pdk-source/ti-pdk-source_git.bb

diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass
new file mode 100644
index 0000000..d845ccc
--- /dev/null
+++ b/classes/ti-pdk-fetch.bbclass
@@ -0,0 +1,43 @@
+TI_PDK_GIT_URI ?= "git://git.ti.com/processor-sdk/pdk.git"
+TI_PDK_GIT_BRANCH ?= "master"
+TI_PDK_GIT_PROTOCOL ?= "git"
+TI_PDK_SRCREV ?= "a1d6fab78b8c9e9dcaec5bd6df54af8d196a901a"
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

