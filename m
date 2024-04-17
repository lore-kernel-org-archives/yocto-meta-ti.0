Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F62C4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 18:40:34 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.21984.1713379233564084051
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Apr 2024 11:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=F40vpjlh;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43HIeWUS105802;
	Wed, 17 Apr 2024 13:40:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1713379232;
	bh=Z2KRd8H8VZ8vl4zgXlSxx6hLOZ6xK4quu39veUg6L0A=;
	h=From:To:Subject:Date;
	b=F40vpjlhfyZzIyK2TLj+FdY2V+ne7ICxfKHJ4+YvTgyxnk4m665z8Pw1B4QNev2nw
	 JzT4Li8AdGOBbyUMdzxG01d8EUaXQfNkA9QMMzW4vCwjqV0m3lF16w/n+uTBFuUwu2
	 Te3EQmMjsRvtb5kUA2pYJnT+bfjPb72KE4TBeapA=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43HIeWS5018233
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 17 Apr 2024 13:40:32 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 17
 Apr 2024 13:40:31 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 17 Apr 2024 13:40:31 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43HIeVex077112;
	Wed, 17 Apr 2024 13:40:31 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1rxACt-0004Vu-EL; Wed, 17 Apr 2024 13:40:31 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2 0/3] Plan to better support non-LTS branches
Date: Wed, 17 Apr 2024 13:40:28 -0500
Message-ID: <20240417184031.17308-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 17 Apr 2024 18:40:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17586

Since we do not directly support the non-LTS branches, customers are
forced to rely on master for projects that make use of those branches.
We are not going to start creating branches for all of the non-LTS
releases, but we can do a better job of having master continue to
support the  branches that are still supported by the Yocto project [1].

Recently we added and removed a patch to support the uboot mainline that
required the python3-yamllint package.  We were not thinking about
customers trying to use the uboot mainline who might be currently locked
into nanbield and not master.

This series seeks to restore that reverted patch and create a system by
which we can schedule the removal of these temporary patches.
Additionaly it updates the compatible layer list to those with active
support by the Yocto project [1].

[1] https://wiki.yoctoproject.org/wiki/Releases

v2: Add missing nanbield in meta-ti-extras/conf/layer.conf

Ryan Eatmon (3):
  python3-yamllint: Temporarily carry this new recipe
  TODO: Add TODO list
  conf/layer.conf: Update LAYERSERIES_COMPAT

 TODO                                              |  9 +++++++++
 meta-ti-bsp/conf/layer.conf                       |  2 +-
 meta-ti-extras/conf/layer.conf                    |  2 +-
 .../python-yamllint/python3-yamllint_1.33.0.bb    | 15 +++++++++++++++
 4 files changed, 26 insertions(+), 2 deletions(-)
 create mode 100644 TODO
 create mode 100644 meta-ti-extras/recipes-devtools/python-yamllint/python3-yamllint_1.33.0.bb

-- 
2.17.1


