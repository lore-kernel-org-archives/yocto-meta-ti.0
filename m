Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D00D1C28B28
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 00:15:24 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.3338.1741824916764005676
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Mar 2025 17:15:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=M7Yafbi+;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52D0FFYg1658990
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Mar 2025 19:15:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741824915;
	bh=NAfG2LtWnQvbMRuFtZMImfBSC0T8GnomzPQvOGD0GQA=;
	h=From:To:Subject:Date;
	b=M7Yafbi+NRpoviTKhmNlz6W3/Rs7qOe3PK+SHe15IMBAKGUf6sgkIIb5GifEHXUV4
	 RpxNb9cLayN+bH24r0n/dWpYy46rWJiORaJPvmV1HXyeUEG6OVsfzEpQr5Zrc4rHER
	 0i0zXFfqiG9SyQ149w03zwlCmCWMRHqXRTFJscDI=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52D0FFOp082003
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Mar 2025 19:15:15 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Mar 2025 19:15:14 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Mar 2025 19:15:14 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52D0FE7G016336;
	Wed, 12 Mar 2025 19:15:14 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tsWEE-0002Mg-KO; Wed, 12 Mar 2025 19:15:14 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH] conf: machine: j721e: Add BSP support for new out of tree module
Date: Wed, 12 Mar 2025 19:15:14 -0500
Message-ID: <20250313001514.6438-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Mar 2025 00:15:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18378

The new out of tree module ti-vxe-vxd-driver is only for the 6.12 kernel
and later.  Since we support multiple BSPs we need to correctly wrap
this addition behind some additional logic that can make sure to not
include it for the 6.1 and 6.6 kernel builds where the module is still
in the tree.

Additionally, fix up the beaglebone-ai64 since it includes the j721e.inc
file and will need to clear this variable for its BSPs as well.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-beagle/conf/machine/beaglebone-ai64.conf | 6 ++++++
 meta-ti-bsp/conf/machine/include/j721e.inc    | 6 +++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta-beagle/conf/machine/beaglebone-ai64.conf b/meta-beagle/conf/machine/beaglebone-ai64.conf
index ecd3a6e7..c7d72590 100644
--- a/meta-beagle/conf/machine/beaglebone-ai64.conf
+++ b/meta-beagle/conf/machine/beaglebone-ai64.conf
@@ -46,3 +46,9 @@ ti/k3-j721e-sk-rpi-hdr-ehrpwm.dtbo \
 "
 
 MACHINE_GUI_CLASS = "bigscreen"
+
+# TI has moved a driver out of its kernel tree and into an out of tree module.
+# We need to not include that for older kernels since the module is still in
+# the kernel.
+TI_VXE_VXD_DRIVER:bsp-bb_org-6_6 = ""
+TI_VXE_VXD_DRIVER:bsp-bb_org-6_1 = ""
diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
index 6264d5c8..b5ba448e 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -36,4 +36,8 @@ TFA_BOARD = "generic"
 
 OPTEEMACHINE = "k3-j721e"
 
-MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cadence-mhdp-fw vxd-dec-fw ti-eth-fw ti-vxe-vxd-driver"
+TI_VXE_VXD_DRIVER = "ti-vxe-vxd-driver"
+TI_VXE_VXD_DRIVER:bsp-ti-6_6 = ""
+TI_VXE_VXD_DRIVER:bsp-ti-6_1 = ""
+
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cadence-mhdp-fw vxd-dec-fw ti-eth-fw ${TI_VXE_VXD_DRIVER}"
-- 
2.17.1


