Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7B497E00E00; Thu,  7 Nov 2019 10:09:49 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4B305E008D9
	for <meta-ti@yoctoproject.org>; Thu,  7 Nov 2019 10:09:47 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9k5e106902
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573150186;
	bh=ZkkG4JnhDhP/J8htNvEdxEqZcOWmnldVzmOEU3MVbAw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=RMIJCwHLwUfVAJIBliGps3h26YZ5xOKvcUb4RlD2eevSA7BIUjHFDMvVfHBUcta0e
	oHmOOTP1Wnul6AbGuv0vofN/eVd8zVJnJlEcdn1kn/iINl0d+mMx3WCXNKDEYg996R
	/nfK/QTtkgXYl2UWC4dsruEcpJ2yylPg04GFTR+s=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA7I9kSa121138
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:46 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 7 Nov 2019 12:09:46 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 7 Nov 2019 12:09:30 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9jI7067418;
	Thu, 7 Nov 2019 12:09:46 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 7 Nov 2019 12:49:56 -0500
Message-ID: <1573149037-762-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
References: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][RFC 01/42] ti-pdk-fetch: add class for common pdk sources
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
X-List-Received-Date: Thu, 07 Nov 2019 18:09:49 -0000
Content-Type: text/plain

Recently individual components and LLD sources have been combined
into a single PDK repo. Use this class to specify the common source.
Also use this class to keep the sources separate from each other when
building. This keeps the build identical to previous recipes while
keeping control on interdependencies.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 classes/ti-pdk-fetch.bbclass | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 classes/ti-pdk-fetch.bbclass

diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass
new file mode 100644
index 0000000..f5ab301
--- /dev/null
+++ b/classes/ti-pdk-fetch.bbclass
@@ -0,0 +1,30 @@
+TI_PDK_GIT_URI ?= "<TBD>"
+TI_PDK_GIT_BRANCH ?= "master"
+TI_PDK_GIT_PROTOCOL ?= "git"
+TI_PDK_SRCREV ?= "<TBD>"
+
+TI_PDK_SRC = "_tmp_pdk"
+SRC_URI = "${TI_PDK_GIT_URI};branch=${TI_PDK_GIT_BRANCH};protocol=${TI_PDK_GIT_PROTOCOL};destsuffix=${TI_PDK_SRC}"
+SRCREV = "${TI_PDK_SRCREV}"
+
+TI_PDK_COMP ?= ""
+TI_PDK_COMP_PATH = "${@'${TI_PDK_COMP}'.replace('.','/')}"
+
+S = "${WORKDIR}/git/${TI_PDK_COMP_PATH}"
+
+# Extract only required sources from PDK
+#
+# ... perhaps do something similiar to the kernel and STAGING_KERNEL_DIR...
+# ... then symlink the individual component...
+python do_unpack_append() {
+    if len(d.getVar('TI_PDK_COMP') or '') > 0:
+        import subprocess
+
+        src = os.path.join(d.getVar('TI_PDK_SRC'),'packages',d.getVar('TI_PDK_COMP_PATH'))
+
+        # Package up only the required sources
+        cmd = 'tar -cf - -C %s -p -S . | tar -xf - -C %s' % (src, d.getVar('S'))
+        subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
+
+        bb.utils.remove(d.getVar('TI_PDK_SRC'), recurse=True)
+}
-- 
2.7.4


