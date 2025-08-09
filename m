Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB55AC87FCF
	for <webhook@archiver.kernel.org>; Sat,  9 Aug 2025 23:50:34 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.17086.1754783421704570091
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 09 Aug 2025 16:50:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=PA41IjlQ;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 579NoIZB1253829;
	Sat, 9 Aug 2025 18:50:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754783418; i=@ti.com;
	bh=wyM9m6KbY8RE5C7yYHcUdMqLnmLU3Rw9jmI1IswqjQ4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=PA41IjlQcGieMhvv4K6btw5NBL+TR6laRHYRhhkpZ/uiBXqkmMbQMJRvbTC6A0VWH
	 9LOHxWP0WD2MulKFj4Fb8VQr0hAk9FPMCUGDawMwjRn6Ho5RXd8GJ1O8TAJUwu5bS+
	 394zUtjPN7KTPFpw4/sVl0q645U3+SA1H3BT9HrY=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 579NoISx1948246
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sat, 9 Aug 2025 18:50:18 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sat, 9
 Aug 2025 18:50:18 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.2.1748.24; Sat, 9 Aug
 2025 18:50:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Sat, 9 Aug 2025 18:50:18 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 579NoIIc612952;
	Sat, 9 Aug 2025 18:50:18 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 2C44713F532; Sat,  9 Aug 2025 18:50:18 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [scarthgap][PATCH 1/4] linux-bb.org_6.6: update to the latest
Date: Sat, 9 Aug 2025 18:50:18 -0500
Message-ID: <20250809235018.2480896-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250809234635.3626366-1-denis@denix.org>
References: <20250809234635.3626366-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 09 Aug 2025 23:50:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18922

meta-ti / na / 20250809234635.3626366-1-denis

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



