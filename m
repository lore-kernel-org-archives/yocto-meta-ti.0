Return-Path: <h-gou@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1F4CEE00D10; Mon, 25 Sep 2017 11:24:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 96606E009F5
	for <meta-ti@yoctoproject.org>; Mon, 25 Sep 2017 11:24:22 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8PIOL0K025776
	for <meta-ti@yoctoproject.org>; Mon, 25 Sep 2017 13:24:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506363862;
	bh=BNyB4vIQWSu8Rc5AtMH6NveKpFe7/PFJznZ1UPrh+OI=;
	h=From:To:CC:Subject:Date;
	b=iqRy15NAtpbkkCP0SrxXHwqWQjLMBfi5tBci7fIIQcFZSIds9iFE8s294UDD2zeTA
	tQXOKw+o+zqry+N8kqcYg5+U0vFSSkJRtI/0txzASta3/U3ADcAPQ+2oKmqDS1V45e
	CbyrrC7p/LFYrFkgvNKpjs5eKDYkKzPvDgXyMqc0=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8PIOLag018882
	for <meta-ti@yoctoproject.org>; Mon, 25 Sep 2017 13:24:21 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 25 Sep 2017 13:24:21 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 25 Sep 2017 13:24:21 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8PIOL65032411;
	Mon, 25 Sep 2017 13:24:21 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 25 Sep 2017 14:24:15 -0400
Message-ID: <1506363856-5930-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [PATCH 1/2] uio-test-pruss: add support for k2g
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
X-List-Received-Date: Mon, 25 Sep 2017 18:24:24 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
Note: the patch of "uio-test_pruss:   Update to new version 1.0.2.0"
needs to be applied first before applying this patch.

 recipes-ti/uio-test-pruss/uio-test-pruss_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb b/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
index 0fae726..cbae1b1 100644
--- a/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
+++ b/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
@@ -21,7 +21,7 @@ SRCREV = "${UIO_TEST_PRUSS_SRCREV}"
 
 PR = "r0"
 
-COMPATIBLE_MACHINE = "omap-a15|ti33x|ti43x"
+COMPATIBLE_MACHINE = "omap-a15|ti33x|ti43x|k2g"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -29,6 +29,7 @@ DEVICE_NAME = ""
 DEVICE_NAME_append_am57xx-evm = "am57xx"
 DEVICE_NAME_append_ti33x = "am33xx"
 DEVICE_NAME_append_ti43x = "am43xx"
+DEVICE_NAME_append_k2g = "k2g"
 
 EXTRA_OEMAKE = "CGT_PRU=${TI_CGT_PRU_INSTALL_DIR} DEVICE=${DEVICE_NAME}"
 
-- 
1.9.1


