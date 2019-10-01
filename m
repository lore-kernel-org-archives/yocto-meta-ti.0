Return-Path: <nikhil.nd@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6174BE00D4F; Tue,  1 Oct 2019 03:12:07 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A2611E00D35
	for <meta-ti@yoctoproject.org>; Tue,  1 Oct 2019 03:12:06 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x91AC5sK116936
	for <meta-ti@yoctoproject.org>; Tue, 1 Oct 2019 05:12:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569924726;
	bh=7jMh2UcRyfza09l49Nyq+zkvy9jc/1CfeoAtKuFMcCA=;
	h=From:To:CC:Subject:Date;
	b=oI5GoZrOKKyCd/zDBY3TiJAw6FrA3tEoGzyLiHaxsrFl/X2biM5A8vLeeFTwVgzwe
	1V13NnBCejOCIqy21FwAAFADQS3Qv8UQrei0nL225Sp2uBp97Azd/bm54pniUEEomu
	eJIi/+x/PKhGEMRdmcIQFdqQNiKy3THK/cg5EBiQ=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x91AC5IP036853
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 1 Oct 2019 05:12:05 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 1 Oct 2019 05:11:55 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 1 Oct 2019 05:11:55 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x91AC3dG005192; 
	Tue, 1 Oct 2019 05:12:04 -0500
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 1 Oct 2019 15:41:57 +0530
Message-ID: <1569924717-56665-1-git-send-email-nikhil.nd@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master PATCH v3] recipes-bsp: ivshmem-uio: Add new recipe for ivshmem-uio driver
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
X-List-Received-Date: Tue, 01 Oct 2019 10:12:07 -0000
Content-Type: text/plain

This is external kernel module which enables userspace io over the
Jailhouse ivhsmem (inter VM shared memory)
This driver is useful to test the inter VM communication.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
Changes from v2:
* Define recipe to be compatible only for ti-soc

Changes from v1:
* Split the ivshmem recipe separately
* Add summary and remove PACKAGE_ARCH define

 recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb | 28 +++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb

diff --git a/recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb b/recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb
new file mode 100644
index 0000000..d77c28e
--- /dev/null
+++ b/recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb
@@ -0,0 +1,28 @@
+SUMMARY =  "Kernel driver for IVSHMEM based UIO driver"
+DESCRIPTION = "Kernel module which registers a UIO (userspace io) device for inter VM shared memory"
+HOMEPAGE = "https://github.com/henning-schild-work/ivshmem-guest-code"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0546a27aad86c83b75ad4ee6133e9d5e"
+
+inherit module
+
+RDEPENDS_${PN} = "jailhouse"
+COMPATIBLE_MACHINE = "(ti-soc)"
+
+PROTOCOL = "git"
+BRANCH = "jailhouse"
+SRCREV = "f3ad79881bebb6c6068966ee3d265d8034c20492"
+SRC_URI = "git://github.com/henning-schild-work/ivshmem-guest-code.git;protocol=${PROTOCOL};branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE += 'KDIR="${STAGING_KERNEL_DIR}"'
+
+do_compile_prepend() {
+    cd ${S}/kernel_module/uio
+}
+
+do_install() {
+    install -d ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
+    install -m 644 ${S}/kernel_module/uio/uio_ivshmem.ko ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
+}
-- 
1.9.1


