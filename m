Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BEAEC3DA4A
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 20:45:38 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.4493.1722026731738939632
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 Jul 2024 13:45:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=VRsrJ1WL;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46QKjUAP002031;
	Fri, 26 Jul 2024 15:45:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722026730;
	bh=fMp9R9JMnXfvUqXqNYmUAqVNzNPg+dbsHVq5LRidxHA=;
	h=From:To:Subject:Date;
	b=VRsrJ1WLEGvE5EbN77iJt5ojfBKa6CP1Hhry4wfNcqy7iemlR00zkyMWLkSw7Lh1G
	 ufb8ZQ03qJAYimLweCpKbu08KzTKMnIum4n1YamKybOV4L9xqZ3GnNkA0FtbwWfCPt
	 BvavonqUw8+mBfqsLm3piRh7F+dfwlDm6aHt9O3M=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46QKjU4V038478
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 Jul 2024 15:45:30 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 26
 Jul 2024 15:45:30 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 26 Jul 2024 15:45:30 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46QKjUFt010096;
	Fri, 26 Jul 2024 15:45:30 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sXRog-0002MS-Gw; Fri, 26 Jul 2024 15:45:30 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 0/4] Disable buildpaths check
Date: Fri, 26 Jul 2024 15:45:26 -0500
Message-ID: <20240726204530.9033-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 26 Jul 2024 20:45:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17908

We have a few problematic packages that will need more time to address
the buildpaths check.  In the meantime, disable the check for these
packages so that we can continue to make software releases and keep the
rest of the recipes up to date.

Ryan Eatmon (4):
  ti-ipc-rtos: Disable buildpaths check
  libulm: Disable buildpaths check
  gdbserver-c6x: Disable buildpaths check
  gdbc6x: Disable buildpaths check

 meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb       | 10 ++++++++++
 meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb  |  4 ++++
 .../recipes-devtools/gdbc6x/gdbserver-c6x_git.bb      | 10 ++++++++++
 meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb      | 11 +++++++++++
 4 files changed, 35 insertions(+)

-- 
2.17.1


