Return-Path: <a-dutta@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61DFCC02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 08:01:16 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.45840.1739174466977201651
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 10 Feb 2025 00:01:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=OPTtmT8A;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: a-dutta@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51A814e7003461
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 10 Feb 2025 02:01:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739174465;
	bh=CslARncdRYlAxBWEgW10+XAKZRWBT2MfVvNzkC0sqSU=;
	h=From:To:CC:Subject:Date;
	b=OPTtmT8ACgxGRikcvAVXc1v1bLbVe1uONRXES/OUXb6pQJThX3GDk6jPWjKN+fIP0
	 pu1vim8OMDdDv7W4pq0P8f0ocYI1sVmSX+qv6Khq2DgaZMHCUSayPktCcLQciFCbS9
	 wM+sIvJFYkvjogW0+27winoy2Fbx+jCTMTu5gE+Q=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51A8148m125737;
	Mon, 10 Feb 2025 02:01:04 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Feb 2025 02:01:04 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Feb 2025 02:01:04 -0600
Received: from a-dutta.dhcp.ti.com (a-dutta.dhcp.ti.com [172.24.227.92])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51A811RJ078031;
	Mon, 10 Feb 2025 02:01:02 -0600
From: Anurag Dutta <a-dutta@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <a-dutta@ti.com>, <u-kumar1@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <a-limaye@ti.com>, <c-shilwant@ti.com>
Subject: [meta-ti][scarthgap][PATCH v2] conf: machine: j722s: Add overlay to KERNEL_DEVICETREE_PREFIX
Date: Mon, 10 Feb 2025 13:31:01 +0530
Message-ID: <20250210080101.75507-1-a-dutta@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 10 Feb 2025 08:01:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18292

Add the overlay "k3-am625-sk-mcspi-loopback.dtso" to the j722s
configuration so that SPI loopback tests can be carried out
successfully.

Signed-off-by: Anurag Dutta <a-dutta@ti.com>
---

v2: Changelog:
1) Added the correct branch
2) Added the correct overlay with test results

Link to v1: https://lore.kernel.org/all/20250205073251.42414-1-a-dutta@ti.com/

Test_link:https://gist.github.com/anuragdutta731/f93908b31d524ff0c52c3fd314449948

 meta-ti-bsp/conf/machine/j722s-evm.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/j722s-evm.conf b/meta-ti-bsp/conf/machine/j722s-evm.conf
index 8f42866c..52a6cfbd 100644
--- a/meta-ti-bsp/conf/machine/j722s-evm.conf
+++ b/meta-ti-bsp/conf/machine/j722s-evm.conf
@@ -7,7 +7,7 @@ require conf/machine/include/j722s.inc
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-j722s \
     ti/k3-fpdlink \
-    ti/k3-j7200-evm-mcspi-loopback \
+    ti/k3-am625-sk-mcspi-loopback \
     ti/k3-v3link \
 "
 
-- 
2.34.1


