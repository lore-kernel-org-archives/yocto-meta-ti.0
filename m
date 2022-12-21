Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B6FC4167B
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 16:41:54 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.23361.1671640906890424549
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Dec 2022 08:41:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=fXYwqhx9;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2BLGfjbH030882;
	Wed, 21 Dec 2022 10:41:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1671640905;
	bh=zN+aT9npFR5qBFEuvhQmk5e1v9UuBRw+CHZvfkfCj6Y=;
	h=Date:From:Subject:To:CC:In-Reply-To:References;
	b=fXYwqhx9JICgzOEvOCP5Ym7YTRAdMoO0QLgLO13mDzw32lxnKOZJFBr1IcoNo7dbE
	 UHxnnPHF9SuI3r7pvy9Mc3rszqwTHEl3PXWeAp6wMTtvkWcZoqSvRWhUJJ2QLPmV80
	 rMx5suNPLx86Pz02Tt7kqhRmX8gAPbSv8in6+2ME=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2BLGfjmv081923
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 21 Dec 2022 10:41:45 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 21
 Dec 2022 10:41:45 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 21 Dec 2022 10:41:45 -0600
Received: from [10.249.35.152] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2BLGfgwj045490;
	Wed, 21 Dec 2022 10:41:43 -0600
Date: Wed, 21 Dec 2022 10:41:37 -0600
From: "Sapp, Randolph" <rs@ti.com>
Subject: Re: [EXTERNAL] Re: [master][PATCH v4] meta-ti-bsp: Graphics recipe
 overhaul
To: Paul Barker <paul.barker@sancloud.com>
CC: <reatmon@ti.com>, <denys@ti.com>, <detheridge@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Message-ID: <DD29NR.846A5X9VPNPO3@ti.com>
In-Reply-To: <91ceba60-0648-18ae-3890-50006ab84532@sancloud.com>
References: <20221215040632.1404997-1-rs@ti.com>
	<91ceba60-0648-18ae-3890-50006ab84532@sancloud.com>
X-Mailer: geary/43.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-sOX1loH2U2S1wQvreGRz"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 21 Dec 2022 16:41:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15498

--=-sOX1loH2U2S1wQvreGRz
Content-Type: text/plain; charset="us-ascii"; format=flowed

On Tue, Dec 20 2022 at 15:02:51 +00:00:00, Paul Barker 
<paul.barker@sancloud.com> wrote:
> Are further
> fixes required for the am335x or am65xx families? I'm happy to test 
> any
> further patches targetting these SoC families.

Yes, futher fixes are required for SGX devices. I'm not sure when to 
expect those patches at the moment, but I'll keep you posted.


--=-sOX1loH2U2S1wQvreGRz
Content-Type: text/html; charset="us-ascii"

<div id="geary-body" dir="auto">On Tue, Dec 20 2022 at 15:02:51 +00:00:00, Paul Barker &lt;paul.barker@sancloud.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Are further
fixes required for the am335x or am65xx families? I'm happy to test any
further patches targetting these SoC families.</div></blockquote><div><br></div><div>Yes, futher fixes are required for SGX devices. I'm not sure when to expect those patches at the moment, but I'll keep you posted.</div></div>
--=-sOX1loH2U2S1wQvreGRz--

