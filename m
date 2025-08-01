Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF07CC87FCA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 16:39:56 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.92720.1754066390177155138
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 01 Aug 2025 09:39:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ESx2SAjW;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: prc@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 571GdnO53285346;
	Fri, 1 Aug 2025 11:39:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754066389; i=@ti.com;
	bh=gVAx+NQ4LlhtXbAOPaQ4413YN7ePPSQxongaj/eSgI0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ESx2SAjWt3ylZ5RZHdnW/8ihz3h+v50TBlDuieUz4cUXkiBQpp9NefYTrCQy3dJmy
	 xMYCYxdVhdQPNiSx9JuT4I1njvOvY2sW19KX2N95ruv9HIztJPirqQN6m9gRFGzOed
	 2/TQyUzAcagKZ3hPrKpGj6o+1xHZdP1hhdgczbgs=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 571GdnYK030195
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 1 Aug 2025 11:39:49 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 1
 Aug 2025 11:39:48 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 1 Aug 2025 11:39:48 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 571GdmLJ679170;
	Fri, 1 Aug 2025 11:39:48 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 5499B142E34; Fri,  1 Aug 2025 11:39:48 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Beleswar Padhi <b-padhi@ti.com>
CC: <reatmon@ti.com>, <denys@konsulko.com>, <a-limaye@ti.com>, <afd@ti.com>,
        <u-kumar1@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [master/scarthgap][PATCH 0/5] Add recipe to package prebuilt messageQ FW
Date: Fri, 1 Aug 2025 11:39:48 -0500
Message-ID: <20250801163948.881054-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250801150037.2650736-1-b-padhi@ti.com>
References: <20250801150037.2650736-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 01 Aug 2025 16:39:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18887

meta-ti / na / 20250801150037.2650736-1-b-padhi

PRC Results: FAIL

-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  check-yocto-patches: FAIL
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
Patches
----------------------------------------
FAIL - [master/scarthgap][PATCH 1/5] Revert "ti-ipc-examples: Remove DSP/BIOS IPC examples"
    ERROR: Missing Signed-off-by in commit message. (SIGNED-OFF-BY-1)
        patch




