Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 27B8FE00E39; Fri, 30 Aug 2019 09:54:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8E9BCE00E16
	for <meta-ti@yoctoproject.org>; Fri, 30 Aug 2019 09:54:05 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7UGs4VI055024
	for <meta-ti@yoctoproject.org>; Fri, 30 Aug 2019 11:54:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1567184044;
	bh=Xr6hSXislVdPx6dEpRDkqQPjpDGSUL2H7Qe0PHvkrYk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=VYZPpEUXbkKXTUYlRYLGHjG1Wdt/xqzXNSb3BOOEGIOZm0raMPQkk3o5/solf3kbN
	0sGR2ByxmUzDyQH5FlWMWRg55ZBBkZe9qWA/g4jfvhndaHGfh7wiTBVb/nAk/eTckr
	hMtrhmeg0CF9QDh9Dpsml6K78c8RE7v58syvIPRg=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7UGs49X121696
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 30 Aug 2019 11:54:04 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 30 Aug 2019 11:54:04 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 30 Aug 2019 11:54:04 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7UGs3EM024127;
	Fri, 30 Aug 2019 11:54:04 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 30 Aug 2019 12:32:46 -0400
Message-ID: <1567182767-3817-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567182767-3817-1-git-send-email-j-stiffler@ti.com>
References: <1567182767-3817-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH v4 2/3] jailhouse: provide tools package
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
X-List-Received-Date: Fri, 30 Aug 2019 16:54:10 -0000
Content-Type: text/plain

Create a package containing the jailhouse tools which are used to work
with the cells and inmates. This recipe provides a good example for
using the jailhouse-cell-linux tool.

The tools require the pyjailhouse python modules, so package them as
well.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v4 changes:
* no change

 recipes-kernel/jailhouse/jailhouse_git.bb | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb b/recipes-kernel/jailhouse/jailhouse_git.bb
index aba4b3e..546f154 100644
--- a/recipes-kernel/jailhouse/jailhouse_git.bb
+++ b/recipes-kernel/jailhouse/jailhouse_git.bb
@@ -29,7 +29,7 @@ RDEPENDS_${PN} += "\
 S = "${WORKDIR}/git"
 
 require jailhouse-arch.inc
-inherit module pythonnative bash-completion deploy
+inherit module pythonnative bash-completion deploy setuptools
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE = "(ti-soc)"
@@ -78,12 +78,21 @@ USER_SPACE_CFLAGS = '${CFLAGS} -DLIBEXECDIR=\\\"${libexecdir}\\\" \
 TOOLS_SRC_DIR = "${S}/tools"
 TOOLS_OBJ_DIR = "${S}/tools"
 
+EXTRA_OEMAKE = "ARCH=${JH_ARCH} CROSS_COMPILE=${TARGET_PREFIX} KDIR=${STAGING_KERNEL_BUILDDIR}"
+
+
 do_compile() {
-	oe_runmake V=1 ARCH=${JH_ARCH} CROSS_COMPILE=${TARGET_PREFIX} KDIR=${STAGING_KERNEL_BUILDDIR}
+	oe_runmake V=1
 }
 
 do_install() {
-	oe_runmake ARCH=${JH_ARCH} CROSS_COMPILE=${TARGET_PREFIX} KDIR=${STAGING_KERNEL_BUILDDIR} DESTDIR=${D} install
+	# Install pyjailhouse python modules needed by the tools
+	distutils_do_install
+
+	# We want to install the python tools, but we do not want to use pip...
+	# At least with v0.10, we can work around this with
+	# 'PIP=":" PYTHON_PIP_USEABLE=yes'
+	oe_runmake PIP=: PYTHON_PIP_USEABLE=yes DESTDIR=${D} install
 
 	install -d ${D}${CELL_DIR}
 	install -m 0644 ${B}/configs/${JH_ARCH}/${JH_CELL_FILES} ${D}${CELL_DIR}/
@@ -115,8 +124,15 @@ do_install() {
 	fi
 }
 
-PACKAGE_BEFORE_PN = "kernel-module-jailhouse"
+PACKAGE_BEFORE_PN = "kernel-module-jailhouse pyjailhouse ${PN}-tools"
 FILES_${PN} = "${base_libdir}/firmware ${libexecdir} ${sbindir} ${JH_DATADIR} /boot"
+FILES_pyjailhouse = "${PYTHON_SITEPACKAGES_DIR}"
+FILES_${PN}-tools = "${libexecdir}/${BPN}/${BPN}-*"
+
+RDEPENDS_${PN}-tools = "pyjailhouse python-mmap python-math python-argparse python-datetime python-curses python-compression"
+RDEPENDS_pyjailhouse = "python-core python-ctypes python-fcntl python-shell"
+
+RRECOMMENDS_${PN} = "${PN}-tools"
 
 INSANE_SKIP_${PN} = "ldflags"
 
-- 
2.7.4


