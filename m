Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53278C4332F
	for <webhook@archiver.kernel.org>; Wed, 14 Dec 2022 18:03:16 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.112030.1671040995369583717
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 Dec 2022 10:03:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=P55u2TvO;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2BEI3DRs051936
	for <meta-ti@lists.yoctoproject.org>; Wed, 14 Dec 2022 12:03:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1671040993;
	bh=0U2l/EgsVxFHo/rt/XZtOS0tpxkejZdaAH04YIl375Y=;
	h=Date:From:Subject:To:CC:In-Reply-To:References;
	b=P55u2TvOPI0vXHFb/Jc8moWIOyO2n4lYFp9cvTSMwZu7FjVrEoFtMgmcw+jjf9jVT
	 UXw/KLYSwDQC2BXjJCHDOMQzrW5sTnC+nMjUUIDxDCxyfAV13t06wKS1azOO8Kglp5
	 SQjGuTBRxVzMGk2kHJmJhE5emGjJMSsmFGK8ZKcs=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2BEI3Dwa000998
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 14 Dec 2022 12:03:13 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 14
 Dec 2022 12:03:13 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 14 Dec 2022 12:03:12 -0600
Received: from [10.249.32.159] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2BEI3BCO057347;
	Wed, 14 Dec 2022 12:03:11 -0600
Date: Wed, 14 Dec 2022 12:03:05 -0600
From: "Sapp, Randolph" <rs@ti.com>
Subject: Re: [meta-ti] [master][PATCH v2] meta-ti-bsp: Graphics recipe
 overhaul
To: Andrew Davis <afd@ti.com>
CC: <reatmon@ti.com>, <denys@ti.com>, <detheridge@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Message-ID: <5H7WMR.V8CG8KX8YW2J3@ti.com>
In-Reply-To: <18ac8055-de7f-77fe-1b1b-36c5de4ef8d2@ti.com>
References: <20221206174553.2391187-1-rs@ti.com>
	<18ac8055-de7f-77fe-1b1b-36c5de4ef8d2@ti.com>
X-Mailer: geary/43.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-73K0Ieija9SUFQVh1T+M"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 14 Dec 2022 18:03:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15477

--=-73K0Ieija9SUFQVh1T+M
Content-Type: text/plain; charset="us-ascii"; format=flowed

On Wed, Dec 7 2022 at 12:48:00 -06:00:00, Andrew Davis <afd@ti.com> 
wrote:
> 
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +do_install () {
>> +    oe_runmake install DESTDIR=${D} 
>> TARGET_PRODUCT=${TARGET_PRODUCT} BUILD=${PVR_BUILD} 
>> WINDOW_SYSTEM=${PVR_WS}
> 
> Could we add these to EXTRA_OEMAKE instead of overriding do_install()?

Evidently not. Something in yocto clears out the destination directory 
before packaging if there is no do_install.


--=-73K0Ieija9SUFQVh1T+M
Content-Type: text/html; charset="us-ascii"

<div id="geary-body" dir="auto">On Wed, Dec 7 2022 at 12:48:00 -06:00:00, Andrew Davis &lt;afd@ti.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">
<blockquote>+
+S = "${WORKDIR}/git"
+
+do_install () {
+    oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT} BUILD=${PVR_BUILD} WINDOW_SYSTEM=${PVR_WS}
</blockquote>
Could we add these to EXTRA_OEMAKE instead of overriding do_install()?
</div></blockquote><div><br></div><div>Evidently not. Something in yocto clears out the destination directory before packaging if there is no do_install.</div></div>
--=-73K0Ieija9SUFQVh1T+M--

