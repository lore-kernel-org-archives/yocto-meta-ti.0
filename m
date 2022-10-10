Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F001C433FE
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 23:31:06 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.1366.1665444662076603783
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 16:31:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=INSIPq3M;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29ANV0EO099905
	for <meta-ti@lists.yoctoproject.org>; Mon, 10 Oct 2022 18:31:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665444660;
	bh=BnMjFU0LVtt1LFIFtaHye9BRhvXVT+THMzSBn/25d0k=;
	h=Date:From:Subject:To:CC:In-Reply-To:References;
	b=INSIPq3MGQI1pZPET1G67wUDfslO/yetMnvaSIci5h3HFcydVI8TGgQ5Bqc2vkt86
	 UYUFRk8FXAmj2f90iKgBIqH0WI8UxYGZCTT89dtJbR2xIiNl2BqEyd3CtSzSEIO9+p
	 X0BlJxw7+UyMiI/dMv35+sMFWa0y2a9PY3aBUd+w=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29ANV0Vo049846
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 10 Oct 2022 18:31:00 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 10
 Oct 2022 18:31:00 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 10 Oct 2022 18:31:00 -0500
Received: from res.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29ANV0ZO022461;
	Mon, 10 Oct 2022 18:31:00 -0500
Date: Mon, 10 Oct 2022 18:30:55 -0500
From: "Sapp, Randolph" <rs@ti.com>
Subject: Re: [EXTERNAL] [meta-ti] [dunfell][PATCH] ti-img-rogue-*: Bump the
 graphics recipes
To: "Sapp, Randolph" <rs@ti.com>
CC: "Eatmon, Ryan" <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
Message-ID: <JB9KJR.HI2H88MQ4X131@ti.com>
In-Reply-To: <171B9F56778DDEEC.1795@lists.yoctoproject.org>
References: <171B9F56778DDEEC.1795@lists.yoctoproject.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 10 Oct 2022 23:31:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15135

Forgot to mention what ticket this is tied to. LCPD-28762



