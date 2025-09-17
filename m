Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C239DCAC59A
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 18:23:04 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.31207.1758133380698294588
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Sep 2025 11:23:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=RYulamxT;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: rs@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58HIMxWc1575374;
	Wed, 17 Sep 2025 13:22:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758133379;
	bh=z/hkLzZ8zdkoO2jYmG5Z82fpXO35ZQ9sFrPwvUPKCIA=;
	h=Date:To:Subject:From:References:In-Reply-To;
	b=RYulamxT50RtNzFyWq+u9c9iC++zw3FlK32ysQoYh1bHTEHDaPwPZuec6UOkExzqO
	 Vw+0qp8vCLhxaIACKk4Nn87PTQqG/Cp2bgURHDA/TNqTnZt37jQpccmCbQEBWBYy5f
	 dC6Wtzk/0/1yekJSzPUk4xbpJvyIAFgCV94cWGXM=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58HIMx6l2544919
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 17 Sep 2025 13:22:59 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 17
 Sep 2025 13:22:58 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 17 Sep 2025 13:22:58 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58HIMwHO3788541;
	Wed, 17 Sep 2025 13:22:58 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 17 Sep 2025 13:22:58 -0500
Message-ID: <DCVA9O56NNYP.3LRTIEDU4CVL2@ti.com>
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Ryan
 Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][RFC 6/6] mesa-pvr: Use mesa-pvr for all TI
 SoCs
From: Randolph Sapp <rs@ti.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250909151028.272925-1-afd@ti.com>
 <20250909151028.272925-6-afd@ti.com> <DCOKFZNU5ZM9.1PL3UQTDARDKL@ti.com>
 <3bb49aca-f4b6-4205-baec-51f556e5bb0c@ti.com>
In-Reply-To: <3bb49aca-f4b6-4205-baec-51f556e5bb0c@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 17 Sep 2025 18:23:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19018

On Fri Sep 12, 2025 at 11:38 AM CDT, Andrew Davis wrote:
> On 9/9/25 3:52 PM, Randolph Sapp wrote:
>> On Tue Sep 9, 2025 at 10:10 AM CDT, Andrew Davis wrote:
>>> TI SoCs without GPUs can still use mesa-pvr as it will simply fallback =
to
>>> SW rendering just like the normal mesa package. The benefit is using th=
e
>>> same version across all supported devices is more consistent and only
>>> one version of Mesa is needed for all TI SoCs.
>>>
>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>> ---
>>=20
>> [snip]
>>=20
>> Originally this was done to mitigate damage in the event where there is =
an
>> issue with mesa. I'm not entirely sure we want to move everything over t=
o
>> pvr-mesa as they still hijack some of the common dri code for their own =
goofy
>> stuff.
>>=20
>
> Fair point, would be nice if the PVR support didn't touch the core/common=
 DRI
> at all. Having this the common Mesa for all boards would help in identify=
ing
> if they broke anything in the common/sw rendering side though, right now =
we
> would only find those bugs if one was both using a device with GPU *and* =
it
> falls back to SW.
>
>> My opinion is we should use vanilla software where we can. Especially
>> considering we'll need to be able to access vanilla mesa for AM62 later =
if I get
>> my way.
>>=20
>
> Could you expand on that? Outside of the eventual switch to the upstream
> PVR driver, what would we need vanilla mesa for on AM62?
>
> Andrew

Ah, not much to expand on really. Upstream driver needs vanilla mesa, and I=
'd
like to avoid shipping hacked libraries on devices that don't need em.

- Randolph

