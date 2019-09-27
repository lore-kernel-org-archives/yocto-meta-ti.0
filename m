Return-Path: <nikhil.nd@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 41010E0084E; Fri, 27 Sep 2019 02:16:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CE0F7E007E1
	for <meta-ti@yoctoproject.org>; Fri, 27 Sep 2019 02:16:50 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8R9Gode093340
	for <meta-ti@yoctoproject.org>; Fri, 27 Sep 2019 04:16:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569575810;
	bh=WeBwUzOKlE5o0GYBeQDGCBVAAdv3bExDoCugxr3jHf4=;
	h=From:To:CC:Subject:Date;
	b=tEijL7IOSeG4hvc/rlxh7jvKVjFMxkpIj7ujKtRqdK99Ucd3z5ZVPXFP0lX+AuK6Y
	ccvQLuKIFullxkYKfNhDbzb+XKku+7/RRh1TbF1DCtUGPFyoV7s9U3UUJ8EiNEpMbT
	7qpge5FCAxfSU7OqKBLn6Ch2KqTkNyrvz1KnPpMw=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8R9GoiK004443
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 27 Sep 2019 04:16:50 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 27 Sep 2019 04:16:50 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 27 Sep 2019 04:16:50 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8R9GlgF006668; 
	Fri, 27 Sep 2019 04:16:48 -0500
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 27 Sep 2019 14:46:44 +0530
Message-ID: <1569575804-36910-1-git-send-email-nikhil.nd@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master PATCH v2] recipes-bsp: ivshmem-uio: Add new recipe for ivshmem-uio driver
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
X-List-Received-Date: Fri, 27 Sep 2019 09:16:53 -0000
Content-Type: text/plain

This is external kernel module which enables userspace io over the
Jailhouse ivhsmem (inter VM shared memory)
This driver is useful to test the inter VM communication.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
Changes from v1:
* Split the ivshmem recipe separately
* Add summary and remove PACKAGE_ARCH define

 recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb | 27 +++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb

diff --git a/recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb b/recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb
new file mode 100644
index 0000000..33fb946
--- /dev/null
+++ b/recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb
@@ -0,0 +1,27 @@
+DESCRIPTION =  "Kernel driver for IVSHMEM based UIO driver"
+SUMMARY = "Kernel module which registers a UIO (userspace io) device for inter VM shared memory"
+HOMEPAGE = "https://github.com/henning-schild-work/ivshmem-guest-code"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0546a27aad86c83b75ad4ee6133e9d5e"
+
+inherit module
+
+RDEPENDS_${PN} = "jailhouse"
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


