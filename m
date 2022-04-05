Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5E33C433F5
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 19:49:23 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.120.1649180191801875281
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 05 Apr 2022 10:36:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xgBZ4/nX;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: nm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 235HaToC071221;
	Tue, 5 Apr 2022 12:36:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1649180189;
	bh=itTqyuAA7IpuKhWDOvuzZz1MsQz732jedA//wrtNJTs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=xgBZ4/nXzcvDKYu51BWcUmYqUozfT6/mxclEFlCRTn+SiS0kpyZIPFlmzwiyFJ+cX
	 /sc8BmC1L1eQx7I4rIKG3AnGarwabxO3yM34tLuJfRvnMhOFcyoXntY6gFZqviUUTY
	 +n1kl3nTkL3nCpOlcpiC/gLQ9tQk24VegD+N7meA=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 235HaTeZ071689
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 5 Apr 2022 12:36:29 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 5
 Apr 2022 12:36:28 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 5 Apr 2022 12:36:28 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 235HaSpC118887;
	Tue, 5 Apr 2022 12:36:28 -0500
Date: Tue, 5 Apr 2022 12:36:28 -0500
From: Nishanth Menon <nm@ti.com>
To: <reatmon@ti.com>
CC: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][dunfell][PATCH] Rename the am62xx-evm platform to
 am62xx-sk
Message-ID: <20220405173628.6w4urwkrpp4j7x52@splurge>
References: <20220405170440.26628-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220405170440.26628-1-reatmon@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 05 Apr 2022 19:49:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14594

On 12:04-20220405, Ryan Eatmon via lists.yoctoproject.org wrote:
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>


Could we please add a commit message explaining reasoning?

This is overall, IMHO a bad idea. sk is ONE of the boards we will
support with the same build. See am335x, 437x etc.. if we start spawning
off per board builds, there is never an end to the confusion this will
create.

So two choices:
a) stick with evm as default (all encompasing builds) and exceptions as
specific boards
OR
b) start building ever board as a separate yocto machine.

I strongly discourage (b), it just creates confusion!

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

