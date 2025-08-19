Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3446CA0EEB
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 21:00:15 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.4673.1755637211664510988
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 19 Aug 2025 14:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fQKgWmfn;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57JL0AP9093956;
	Tue, 19 Aug 2025 16:00:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755637210; i=@ti.com;
	bh=5+qrC0qse4AIzzWFlpnZXqte2SvfZMmrpAUfL8IsY0Y=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=fQKgWmfn7IMTTq8QAq1h5Y8KANvC9Dh2nXe0cSapi9/gPhdrXjQfy5CWwBBanmD6N
	 iKHRJQir1tkUBFYCwURR6wAPlZvJyHbeX4Wh6FJL7WJ8gouFLE/XY8KsPdHbW38C5f
	 QAGnbiCAZYI5IYbyTuVUGHJ2P+1e0VQ/fJk4SxAY=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57JL0A3o671022
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 19 Aug 2025 16:00:10 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 19
 Aug 2025 16:00:10 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 19 Aug 2025 16:00:10 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57JL0AYV876656;
	Tue, 19 Aug 2025 16:00:10 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 00CA313F52F; Tue, 19 Aug 2025 16:00:09 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Bryan Brattlof <bb@ti.com>
CC: <reatmon@ti.com>, <denys@konsulko.com>, <afd@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [PATCH master/scarthgap] conf: machine: add optee-os into
Date: Tue, 19 Aug 2025 16:00:09 -0500
Message-ID: <20250819210009.2481490-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250819-62loptee-v1-1-6b87b2dcda78@ti.com>
References: <20250819-62loptee-v1-1-6b87b2dcda78@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 19 Aug 2025 21:00:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18942

meta-ti / na / 20250819-62loptee-v1-1-6b87b2dcda78

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
All patches passed



=========================================================
  apply-yocto-patch: PASS
=========================================================


=========================================================
  check-yocto-repo: PASS
=========================================================



