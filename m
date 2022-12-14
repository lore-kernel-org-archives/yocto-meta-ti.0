Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87D69C4332F
	for <webhook@archiver.kernel.org>; Wed, 14 Dec 2022 18:47:36 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.112493.1671043651462924145
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 Dec 2022 10:47:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=WrfPKXau;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2BEIlUig112864
	for <meta-ti@lists.yoctoproject.org>; Wed, 14 Dec 2022 12:47:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1671043650;
	bh=oqTxugoP5pJNWdtED4jyHQD/Z8PFpVa+AHjFByVe1qY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=WrfPKXauI3/kkBpq9eFuQ1EkinZyyxCt/i0VZbZT1yfSccmhfnC/IAZmUPxe6v7i8
	 DgwwPWGIokG3gg3grZlAVc//NophIeFCkKKs49r4Ym/jLLQimPrYr4Utg6QLskQVsl
	 nL6/uhGa/fvUVElssJP+zpysNEuA8ygLyNljmWnI=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2BEIlU2q102477
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 14 Dec 2022 12:47:30 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 14
 Dec 2022 12:47:29 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 14 Dec 2022 12:47:29 -0600
Received: from [10.250.38.44] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2BEIlTLh066182;
	Wed, 14 Dec 2022 12:47:29 -0600
Message-ID: <b9d3f0aa-ad74-0de4-acdf-a359eac5c05f@ti.com>
Date: Wed, 14 Dec 2022 12:47:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-ti] [master][PATCH v2] meta-ti-bsp: Graphics recipe
 overhaul
Content-Language: en-US
To: "Sapp, Randolph" <rs@ti.com>
CC: <reatmon@ti.com>, <denys@ti.com>, <detheridge@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20221206174553.2391187-1-rs@ti.com>
 <18ac8055-de7f-77fe-1b1b-36c5de4ef8d2@ti.com> <MY9NMR.KA5B9Y124SPL2@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <MY9NMR.KA5B9Y124SPL2@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 14 Dec 2022 18:47:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15478

On 12/9/22 4:18 PM, Sapp, Randolph wrote:
> On Wed, Dec 7 2022 at 12:48:00 PM -0600, Andrew Davis <afd@ti.com> wrote:
>> Since the UM driver now RDEPENDS on the KM, could we also drop this
>> last line everywhere?
> 
> Nope, we still need the one preferred provider line to indicate that rogue graphics are present. Now this could be replaced by a rogue-graphics machine feature instead if that's preferable, but something will need to signal the mesa switch.
> 

New machine feature sounds like the better route since it changes the content of a package.
Using PREFERRED_PROVIDER for that doesn't seem right.

> On Wed, Dec 7 2022 at 12:48:00 PM -0600, Andrew Davis <afd@ti.com> wrote:
>> Bash? Are we sure we need that?
> 
> Yes. The System V init script still needs it. Now could we look at removing that init script? Sure, so long as the device probe still works. What is actually taking care of that right now? It's not udev is it?
> 

The module/device probe is automatic now. At least for SGX that script exists only
to run the single command "pvrsrvctl --start --no-module" which loads some microcode.
We can have yocto build that service for us to run the command, IIRC it will make
it into a systemd or sysv service for us based on what kinda distro we are building.

> On Wed, Dec 7 2022 at 12:48:00 PM -0600, Andrew Davis <afd@ti.com> wrote:
>> "ldflags already-stripped" should be the only skips we still need.
> 
> Dev-so is required because of some of the symbolic links that are shipped. I'm fine dropping arch unless that breaks something.
> 
> 

Ah, think that is /usr/lib/dri/pvr_dri.so, odd name, but yeah that skip can
stay then. Lets try to drop "arch" at least.

Andrew

