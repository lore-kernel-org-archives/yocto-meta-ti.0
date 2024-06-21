Return-Path: <sabeeh-khan@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B685C41513
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 10:52:49 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.70170.1718967158960307503
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 21 Jun 2024 03:52:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=k1vmfaHW;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: sabeeh-khan@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45LAqc3h016235
	for <meta-ti@lists.yoctoproject.org>; Fri, 21 Jun 2024 05:52:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718967158;
	bh=yssE+Owsg4Xhkhdrmh887LJarxPr8c+IQbhjaF15aLQ=;
	h=From:To:CC:Subject:Date;
	b=k1vmfaHW5JSJdgg5Ka9A/7GWytlFhsbaRGS+si5/JO9sEhNs4PEEgMDE2uYTvJu4Z
	 6lE1snRRIlV1gLck9Ev4tsPDCE6rYhYVo5QBPQn5lhEVUDVVLbwEELdk6PfyoiANup
	 ROU9Y5D4Xk23pImah0Aa+mu88tKLsmrCwA3e3wrY=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45LAqcSA002836
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 21 Jun 2024 05:52:38 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 21
 Jun 2024 05:52:38 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 21 Jun 2024 05:52:38 -0500
Received: from thinkstationp3.dhcp.ti.com (thinkstationp3.dhcp.ti.com [128.247.83.36])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45LAqciY089126;
	Fri, 21 Jun 2024 05:52:38 -0500
From: Sabeeh Khan <sabeeh-khan@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Sabeeh Khan <sabeeh-khan@ti.com>
Subject: [master/scarthgap][PATCH 0/4] add FW and utilities for cc33xx wireless driver
Date: Fri, 21 Jun 2024 05:52:17 -0500
Message-ID: <20240621105221.1648656-1-sabeeh-khan@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 21 Jun 2024 10:52:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17792

This series adds FW support, configuration files, and tools to be used
with the cc33xx drivers. The cc33xx driver has been added to TI kernel 6.6
with progress being made for kernel upstreaming. 

Changelog from RFC[1]:
* git repos are now live so series is ready for merging
* Replaced "DESCRIPTION" with "SUMMARY"
* unified SRC_URI and BRANCH naming convention
* cc33xx-fw: do_compile changed to using [noexec]
* cc33xx-fw: added EXTRA_OEMAKE parameters


[1]: https://patchwork.yoctoproject.org/project/ti/cover/20240620032202.169122-1-sabeeh-khan@ti.com/ 

Sabeeh Khan (4):
  cc33conf: add new cc33conf tool for cc33xx devices
  cc33calibrator: add new cc33calibrator tool for cc33xx devices
  cc33xx-fw: install cc33xx firmware
  cc33xx-target-scripts: add cc33xx scripts to control TI cc33xx WLAN
    device

 .../recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb    | 22 ++++++++++++++
 .../cc33calibrator/cc33calibrator_git.bb      | 24 +++++++++++++++
 .../cc33conf/cc33conf_git.bb                  | 29 +++++++++++++++++++
 .../cc33xx-target-scripts_git.bb              | 20 +++++++++++++
 4 files changed, 95 insertions(+)
 create mode 100644 meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb
 create mode 100644 meta-ti-extras/recipes-connectivity/cc33calibrator/cc33calibrator_git.bb
 create mode 100644 meta-ti-extras/recipes-connectivity/cc33conf/cc33conf_git.bb
 create mode 100644 meta-ti-extras/recipes-connectivity/cc33xx-target-scripts/cc33xx-target-scripts_git.bb

-- 
2.34.1


