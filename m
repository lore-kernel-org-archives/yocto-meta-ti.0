Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A3330E006CD; Wed, 29 Mar 2017 05:03:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6B536E00546
	for <meta-ti@yoctoproject.org>; Wed, 29 Mar 2017 05:03:54 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2TC3J91028667;
	Wed, 29 Mar 2017 07:03:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1490788999;
	bh=r+DHDvZ4jT3+w8rerncU0MveS/Mlt22JGATldQ9iKm0=;
	h=From:To:CC:Subject:Date;
	b=EtiPqKze9xzm/gLSmurfp9cMB1abJgStq+5ybFrBYKJV1GNW+NqeK+VAQBhcdl3+/
	JBl7xRd5mgBLVuSLGZF7ELvIjmXYJ/H/T1rDbvrPXEWQCoNtLEJliSjRXEblQy1Be3
	eQbMFS4w3ofr/Dkm3W2QkK72T+OppCHkBoQ0/37Y=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2TC3J61001410;
	Wed, 29 Mar 2017 07:03:19 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 29 Mar 2017 07:03:18 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v2TC3IwN020660;	Wed, 29 Mar 2017 07:03:18 -0500
Received: from localhost (a0272616local.dhcp.ti.com [172.22.188.9])	by
	legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	v2TC3I317748; Wed, 29 Mar 2017 07:03:18 -0500 (CDT)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 29 Mar 2017 07:03:35 -0500
Message-ID: <1490789015-3886-1-git-send-email-dmurphy@ti.com>
X-Mailer: git-send-email 2.7.2.333.g70bd996
MIME-Version: 1.0
Subject: [PATCH] k2hk-hs-evm: add new machine config
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
X-List-Received-Date: Wed, 29 Mar 2017 12:03:58 -0000
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 conf/machine/k2hk-hs-evm.conf | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 conf/machine/k2hk-hs-evm.conf

diff --git a/conf/machine/k2hk-hs-evm.conf b/conf/machine/k2hk-hs-evm.conf
new file mode 100644
index 0000000..e0b11eb
--- /dev/null
+++ b/conf/machine/k2hk-hs-evm.conf
@@ -0,0 +1,14 @@
+#@TYPE: Machine
+#@NAME: Keystone 2 K2HK HS EVM
+#@DESCRIPTION: Machine configuration for the TI Keystone 2 K2HK HS EVM
+
+require conf/machine/k2hk-evm.conf
+
+UBOOT_MACHINE = "k2e_hs_evm_config"
+
+UBOOT_ENTRYPOINT = "0x82000000"
+UBOOT_LOADADDRESS = "0x82000000"
+UBOOT_RD_LOADADDRESS = "0x84000000"
+UBOOT_RD_ENTRYPOINT = "0x84000000"
+
+TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_CAT}/k2hk"
-- 
2.7.3


