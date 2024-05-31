Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65B59C41513
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 19:45:51 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.22779.1717184741698966177
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 31 May 2024 12:45:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZjhOzHkp;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44VJje0V111652;
	Fri, 31 May 2024 14:45:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717184740;
	bh=gA8XZLuNf9KvmtN8I5Oqfu7KI7sHqXhxZYa+z3QrGS8=;
	h=From:To:Subject:Date;
	b=ZjhOzHkpPEHpujYv2kygLVloXh6+2JBqqmQWzYWlIBWi5tLb997lIXhGaKJc9ONY7
	 nFQEWE8bryw0kSAuy+2d72flL8EzJ2kUIDOCLbmsWcrRBdVD2wYUM6dKN97gi37nOO
	 bzcu16Xy9i/S5mKGhiDMlqfuw3OK4d+z6gSaoRWg=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44VJjeeL119295
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 31 May 2024 14:45:40 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 31
 May 2024 14:45:40 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 31 May 2024 14:45:40 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44VJjePH055255;
	Fri, 31 May 2024 14:45:40 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sD8C4-0006G8-GV; Fri, 31 May 2024 14:45:40 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v3 0/2] Updates to support UNPACKDIR
Date: Fri, 31 May 2024 14:45:36 -0500
Message-ID: <20240531194540.24017-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 31 May 2024 19:45:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17683

These are the patches needed to support the change to UNPACKDIR.  I am
not going to list what changed from v2 to v3 because it was pretty much
a full throw out and redo once things solidified, but I still wanted to
call this v3 since it is my third attempt.

Ryan Eatmon (2):
  recipes: Update to UNPACKDIR for files going into WORKDIR
  recipes: Switch away from S = WORKDIR

 meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb    |  3 ++-
 meta-ti-bsp/recipes-core/udev/eudev_%.bbappend       |  4 ++--
 meta-ti-bsp/recipes-kernel/linux/setup-defconfig.inc |  2 +-
 meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb             | 12 ++++++------
 .../recipes-ti/beagleboard/beaglebone-capes.bb       |  4 ++--
 meta-ti-extras/recipes-ti/beagleboard/gadget-init.bb | 10 +++++-----
 .../recipes-ti/devtools/ti-cgt-pru_2.3.3.bb          |  8 ++++----
 meta-ti-extras/recipes-ti/devtools/ti-cgt6x_8.3.2.bb |  2 +-
 meta-ti-extras/recipes-ti/includes/ti-unpack.inc     |  4 ++--
 9 files changed, 25 insertions(+), 24 deletions(-)

-- 
2.17.1


