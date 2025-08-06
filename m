Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48EFAC87FD3
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 17:10:34 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.30693.1754500227678156355
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 06 Aug 2025 10:10:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=lX0XUneC;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 576HAPqM564589;
	Wed, 6 Aug 2025 12:10:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754500225; i=@ti.com;
	bh=JZA8I7N8Yoxrt8Yl8bo811El24J3bhtykvnC8dnVNp0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=lX0XUneCJaqzEIGJBz/M/+dG09NBhDO2hjR6vBTvlr20u4pm1IotyiJ8hDLKpRbQ0
	 nRUWYxd8YjVF8bbfjBn8wgNU/hJQ5YFUJGNSm5f+Q6vJxWUz4hsQCKYJxn6SN01J9m
	 wWj7YhlvjSUzdIVy8voXzLB+UzfNaIwfRt3rg+x4=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 576HAO7Y181705
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 6 Aug 2025 12:10:25 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 6
 Aug 2025 12:10:24 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 6 Aug 2025 12:10:24 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 576HAOST4175017;
	Wed, 6 Aug 2025 12:10:24 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 1B3A113F52F; Wed,  6 Aug 2025 12:10:24 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Beleswar Padhi <b-padhi@ti.com>
CC: <reatmon@ti.com>, <denys@konsulko.com>, <a-limaye@ti.com>, <afd@ti.com>,
        <u-kumar1@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [master/scarthgap][PATCH v2 0/5] Add recipe to package MessageQ Application and Firmware
Date: Wed, 6 Aug 2025 12:10:23 -0500
Message-ID: <20250806171023.3899164-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250806170442.243461-1-b-padhi@ti.com>
References: <20250806170442.243461-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 06 Aug 2025 17:10:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18902

meta-ti / na / 20250806170442.243461-1-b-padhi

PRC Results: PASS

-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  check-yocto-patches: PASS
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
Patches
----------------------------------------
All patches passed



-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  apply-yocto-patch: PASS
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-


-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  check-yocto-repo: PASS
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-



