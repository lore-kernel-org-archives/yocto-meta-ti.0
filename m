Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1C9D1E00E81; Fri, 15 Nov 2019 07:34:15 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D6544E00D16
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 07:34:12 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAFFYCXq057482
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 09:34:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573832052;
	bh=+ZeAXv4cZVctnqWfKkRAwc/YnHHmzUeXk3e18Nz0dAI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=RpLIVpK7avPzryByZf6cBREPUZF+Jn9ZzkfbLDsxiMlt37tBV3eVYCen5cgDpkgcp
	+f0NAJEAtOCUdkmfe2EDFP9I7RtLv5r06nG7JfAQcRN9GTssETssxYgXpWj7Yp1ynP
	L6xMreQ3xi9jNWvWNKGnNLf3FkUX3aK+VfbEKOfw=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAFFYC9m010378
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 09:34:12 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 15 Nov 2019 09:34:11 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 15 Nov 2019 09:34:11 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAFFYBfN041975;
	Fri, 15 Nov 2019 09:34:11 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 15 Nov 2019 10:14:21 -0500
Message-ID: <1573830902-17409-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573830902-17409-1-git-send-email-j-stiffler@ti.com>
References: <1573830902-17409-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH 01/42] ti-pdk-fetch: add class for common pdk sources
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
X-List-Received-Date: Fri, 15 Nov 2019 15:34:15 -0000
Content-Type: text/plain

Recently individual components and LLD sources have been combined
into a single PDK repo. Use this class to specify the common source.
Also use this class to keep the sources separate from each other when
building. This keeps the build identical to previous recipes while
keeping control on interdependencies.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 classes/ti-pdk-fetch.bbclass | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 classes/ti-pdk-fetch.bbclass

diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass
new file mode 100644
index 0000000..6e36e3b
--- /dev/null
+++ b/classes/ti-pdk-fetch.bbclass
@@ -0,0 +1,31 @@
+TI_PDK_GIT_URI ?= "git://git.ti.com/processor-sdk/pdk.git"
+TI_PDK_GIT_BRANCH ?= "master"
+TI_PDK_GIT_PROTOCOL ?= "git"
+TI_PDK_SRCREV ?= "a609fa636c4d899e5dd3d7a89a1c070b854849b0"
+
+TI_PDK_VERSION ?= "2019.11.0+git${SRCPV}"
+
+TI_PDK_SRC = "_tmp_pdk"
+SRC_URI = "${TI_PDK_GIT_URI};branch=${TI_PDK_GIT_BRANCH};protocol=${TI_PDK_GIT_PROTOCOL};destsuffix=${TI_PDK_SRC}"
+SRCREV = "${TI_PDK_SRCREV}"
+
+PV = "${TI_PDK_VERSION}"
+
+TI_PDK_COMP ?= ""
+TI_PDK_COMP_PATH = "${@'${TI_PDK_COMP}'.replace('.','/')}"
+
+S = "${WORKDIR}/git/${TI_PDK_COMP_PATH}"
+
+# Extract only required sources from PDK
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


