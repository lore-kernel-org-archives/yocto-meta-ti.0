Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE7D2C4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 16:49:34 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.23568.1671641373594818464
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Dec 2022 08:49:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=bv3StDCD;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2BLGnSiS102408;
	Wed, 21 Dec 2022 10:49:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1671641368;
	bh=yrTcC1RwYTw6M2MpvWXKX3OI2752xEK5PAealTtAkVg=;
	h=Date:From:Subject:To:CC:In-Reply-To:References;
	b=bv3StDCDRdz5QPG20z0rc+P01WclSoDMgOGED1498GCu6/J/fDv+cj4Ag4L/3UUBh
	 mUbJjWL4DL5hGAf8tgtmbM3oC2vSCjiRg857jGglQS56UJhCUmtAynnf+jqoCY3JIp
	 oRbWkI99qKkSUYLEY1ahm/TxOr1OFmR9YJnWjfvA=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2BLGnSVN092797
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 21 Dec 2022 10:49:28 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 21
 Dec 2022 10:49:28 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 21 Dec 2022 10:49:28 -0600
Received: from [10.249.35.152] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2BLGnOF2049835;
	Wed, 21 Dec 2022 10:49:25 -0600
Date: Wed, 21 Dec 2022 10:49:19 -0600
From: "Sapp, Randolph" <rs@ti.com>
Subject: Re: [EXTERNAL] Re: [meta-ti] [master][PATCH v2] meta-ti-bsp: Graphics
 recipe overhaul
To: Denys Dmytriyenko <denis@denix.org>
CC: Andrew Davis <afd@ti.com>, <reatmon@ti.com>, <denys@ti.com>,
        <detheridge@ti.com>, <meta-ti@lists.yoctoproject.org>
Message-ID: <7Q29NR.T2R7VR8YUI2B2@ti.com>
In-Reply-To: <20221219213235.GX22689@denix.org>
References: <20221206174553.2391187-1-rs@ti.com>
	<18ac8055-de7f-77fe-1b1b-36c5de4ef8d2@ti.com> <MY9NMR.KA5B9Y124SPL2@ti.com>
	<b9d3f0aa-ad74-0de4-acdf-a359eac5c05f@ti.com> <J3EWMR.6Q68HWA4M8303@ti.com>
	<20221219213235.GX22689@denix.org>
X-Mailer: geary/43.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-VhJ9EVR3oRAybYVT239J"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 21 Dec 2022 16:49:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15499

--=-VhJ9EVR3oRAybYVT239J
Content-Type: text/plain; charset="us-ascii"; format=flowed

On Mon, Dec 19 2022 at 16:32:35 -05:00:00, Denys Dmytriyenko 
<denis@denix.org> wrote:
> Can you please explain why existing machine feature cannot be re-used 
> and a
> new one is needed here? Do you plan to use both side-by-side?

Yes, so gpu is a super generic machine feature. On our platforms this 
could mean anything from some minimal device with a tidss module that 
wants to do software rendering to a full blown device with rogue/sgx 
graphics processors. The gpu feature is required to build graphics 
libraries in either case, but if they are doing software rendering they 
won't need the rogue/sgx specific patches. The new machine feature 
makes this distinction clear and allows us to switch between 
rogue/sgx/swrast tooling as necessary.


--=-VhJ9EVR3oRAybYVT239J
Content-Type: text/html; charset="us-ascii"

<div id="geary-body" dir="auto">On Mon, Dec 19 2022 at 16:32:35 -05:00:00, Denys Dmytriyenko &lt;denis@denix.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Can you please explain why existing machine feature cannot be re-used and a 
new one is needed here? Do you plan to use both side-by-side?
</div></blockquote><div><br></div><div>Yes, so gpu is a super generic machine feature. On our platforms this could mean anything from some minimal device with a tidss module that wants to do software rendering to a full blown device with rogue/sgx graphics processors. The gpu feature is required to build graphics libraries in either case, but if they are doing software rendering they won't need the rogue/sgx specific patches. The new machine feature makes this distinction clear and allows us to switch between rogue/sgx/swrast tooling as necessary.</div></div>
--=-VhJ9EVR3oRAybYVT239J--

