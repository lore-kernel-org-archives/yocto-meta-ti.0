Return-Path: <sabeeh-khan@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B450C2BB85
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 03:22:18 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.39248.1718853732802605228
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 19 Jun 2024 20:22:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ckvDwFlZ;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: sabeeh-khan@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45K3MCuG058175
	for <meta-ti@lists.yoctoproject.org>; Wed, 19 Jun 2024 22:22:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718853732;
	bh=Bs6AcsvJ5rmgwvpQLQfud8EY22D500Hc/8DlYT3CIuY=;
	h=From:To:CC:Subject:Date;
	b=ckvDwFlZ3DQH9nVMjtdOQ/Attpci9aYa7YKE23fYjhKn6pIpD69w9LOtWH8ZOstnZ
	 c+EeeRNR/WyPhKgxmz4fPN/Iw+ysNPTDeHUifqW+NslbpUIyjexYsUJl/fbHprUSXs
	 eyAhPfjYc9tYL+agswGSwvBe/7XPtLfPYGUZZIl4=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45K3MCIg006730
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 19 Jun 2024 22:22:12 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Jun 2024 22:22:11 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 19 Jun 2024 22:22:11 -0500
Received: from thinkstationp3.dhcp.ti.com (thinkstationp3.dhcp.ti.com [128.247.83.36])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45K3MB61003124;
	Wed, 19 Jun 2024 22:22:11 -0500
From: Sabeeh Khan <sabeeh-khan@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Sabeeh Khan <sabeeh-khan@ti.com>
Subject: [RFC][master/scarthgap][PATCH 0/4] add FW and utilities for cc33xx wireless driver
Date: Wed, 19 Jun 2024 22:21:58 -0500
Message-ID: <20240620032202.169122-1-sabeeh-khan@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 20 Jun 2024 03:22:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17766

This series adds FW support, configuration files, and tools to be used
with the cc33xx drivers. The cc33xx driver has been added to TI kernel 6.6
with progress being made for kernel upstreaming. 

Sabeeh Khan (4):
  cc33conf: add new cc33conf tool for cc33xx devices
  cc33calibrator: add new cc33calibrator tool for cc33xx devices
  cc33xx-fw: install cc33xx firmware
  cc33xx-target-scripts: add cc33xx scripts to control TI cc33xx WLAN
    device

 .../recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb    | 26 +++++++++++++++++
 .../cc33calibrator/cc33calibrator_git.bb      | 24 +++++++++++++++
 .../cc33conf/cc33conf_git.bb                  | 29 +++++++++++++++++++
 .../cc33xx-target-scripts.bb                  | 22 ++++++++++++++
 4 files changed, 101 insertions(+)
 create mode 100644 meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb
 create mode 100644 meta-ti-extras/recipes-connectivity/cc33calibrator/cc33calibrator_git.bb
 create mode 100644 meta-ti-extras/recipes-connectivity/cc33conf/cc33conf_git.bb
 create mode 100644 meta-ti-extras/recipes-connectivity/cc33xx-target-scripts/cc33xx-target-scripts.bb

-- 
2.34.1


