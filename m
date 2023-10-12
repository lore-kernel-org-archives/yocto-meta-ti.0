Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A13CDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 17:30:13 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.18596.1697131810157745725
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 Oct 2023 10:30:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=QU4PTmFO;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: a-limaye@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39CHU97w052798
	for <meta-ti@lists.yoctoproject.org>; Thu, 12 Oct 2023 12:30:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697131809;
	bh=+FH1JarckntHs20V6vT3bT9koZHTxD5Ot0E2CyTeeoE=;
	h=From:To:CC:Subject:Date;
	b=QU4PTmFOc5h8YaywSJOAigsz5pYad6UtnckhuW7Z/vZ79oVpWHbubsFymMZYtXAZz
	 N3BtujBnFmrgp0D3sKThcXqBy0wvT7xfEYiAgxtvCm+iyPvfGcVatEajqzMV1SOxMJ
	 MBt2v3mvQfD2KFPAvOvYRzL/yW+HBHcJgcIDT/CE=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39CHU9sA126210
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 12 Oct 2023 12:30:09 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 12
 Oct 2023 12:30:08 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 12 Oct 2023 12:30:08 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39CHU544065173;
	Thu, 12 Oct 2023 12:30:06 -0500
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <d-gole@ti.com>, <c-shilwant@ti.com>, <s-adivi@ti.com>,
        <vigneshr@ti.com>, Aniket Limaye <a-limaye@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 0/2] Fix build for tispl.bin
Date: Thu, 12 Oct 2023 22:59:45 +0530
Message-ID: <20231012172947.1359231-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 12 Oct 2023 17:30:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17096

ti-fs-stub-* firmware is packaged at tispl.bin and is needed for u-boot
aarch64 build. Revert previous commits that removed u-boot dependency on
ti-sci-fw while preserving deploy logic for ti-sci-fw with multiconfig
builds

Aniket Limaye (2):
  ti-sci-fw: Remove COMPATIBLE_MACHINE and extend recipe to k3 machines
  Revert "recipes-bsp: u-boot-ti.inc: Remove ti-sci-fw from DEPENDS for
    k3 machine"

 meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 6 ++++--
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc       | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.34.1


