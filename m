Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07BA4CAC59A
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 19:12:05 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.32355.1758136322289770104
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Sep 2025 12:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=lQI0ksmR;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: rs@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58HJC18p1680418;
	Wed, 17 Sep 2025 14:12:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758136321;
	bh=yOPp5wN8A2IQlBB5beFzzG/gUJJ5CaRZ1pYDwwMfX/c=;
	h=Date:Subject:From:To:References:In-Reply-To;
	b=lQI0ksmRPd1fuxGVigdMy9hJXcWis9tDleGic9h3VbMjN7760diQNNMdtVK27hRzF
	 /oyJhafyiJYLsOqnN219ZDdLD8e7dSoolv0V/g0aV3bNiGA8RyACY1b6IR8G5VPkqR
	 AKeIQDrEpb/S7FN1jPXgGtGURgX0YPh6BxPoOyj8=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58HJC1FW1768940
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 17 Sep 2025 14:12:01 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 17
 Sep 2025 14:12:00 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 17 Sep 2025 14:12:00 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58HJC0793549967;
	Wed, 17 Sep 2025 14:12:00 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 17 Sep 2025 14:12:00 -0500
Message-ID: <DCVBB7QC6QT8.103H9CBS1MEZ6@ti.com>
Subject: Re: [meta-ti][scarthgap][RFC 6/6] mesa-pvr: Use mesa-pvr for all TI
 SoCs
From: Randolph Sapp <rs@ti.com>
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Ryan
 Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250909151028.272925-1-afd@ti.com>
 <20250909151028.272925-6-afd@ti.com> <DCOKFZNU5ZM9.1PL3UQTDARDKL@ti.com>
 <3bb49aca-f4b6-4205-baec-51f556e5bb0c@ti.com>
 <DCVA9O56NNYP.3LRTIEDU4CVL2@ti.com>
 <0d960b20-a1b2-4592-8bd7-11d229fca1e8@ti.com>
In-Reply-To: <0d960b20-a1b2-4592-8bd7-11d229fca1e8@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 17 Sep 2025 19:12:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19020

On Wed Sep 17, 2025 at 1:40 PM CDT, Andrew Davis wrote:
> On 9/17/25 1:22 PM, Randolph Sapp wrote:
>> On Fri Sep 12, 2025 at 11:38 AM CDT, Andrew Davis wrote:
>>> On 9/9/25 3:52 PM, Randolph Sapp wrote:
>>>> On Tue Sep 9, 2025 at 10:10 AM CDT, Andrew Davis wrote:
>>>>> TI SoCs without GPUs can still use mesa-pvr as it will simply fallbac=
k to
>>>>> SW rendering just like the normal mesa package. The benefit is using =
the
>>>>> same version across all supported devices is more consistent and only
>>>>> one version of Mesa is needed for all TI SoCs.
>>>>>
>>>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>>>> ---
>>>>
>>>> [snip]
>>>>
>>>> Originally this was done to mitigate damage in the event where there i=
s an
>>>> issue with mesa. I'm not entirely sure we want to move everything over=
 to
>>>> pvr-mesa as they still hijack some of the common dri code for their ow=
n goofy
>>>> stuff.
>>>>
>>>
>>> Fair point, would be nice if the PVR support didn't touch the core/comm=
on DRI
>>> at all. Having this the common Mesa for all boards would help in identi=
fying
>>> if they broke anything in the common/sw rendering side though, right no=
w we
>>> would only find those bugs if one was both using a device with GPU *and=
* it
>>> falls back to SW.
>>>
>>>> My opinion is we should use vanilla software where we can. Especially
>>>> considering we'll need to be able to access vanilla mesa for AM62 late=
r if I get
>>>> my way.
>>>>
>>>
>>> Could you expand on that? Outside of the eventual switch to the upstrea=
m
>>> PVR driver, what would we need vanilla mesa for on AM62?
>>>
>>> Andrew
>>=20
>> Ah, not much to expand on really. Upstream driver needs vanilla mesa, an=
d I'd
>> like to avoid shipping hacked libraries on devices that don't need em.
>>=20
>> - Randolph
>
> What is the timeline looking like for that? This series is for scarthgap =
and
> I'd guess the upstream driver won't be usable in time for the next LTS ei=
ther.
> We can always switch back to vanilla when it can be used on these devices=
.
>
> Andrew

That's still ignoring my last comment. I don't think this is necessary, and
bringing up timelines to apply pressure here isn't useful. Merging an
unnecessary patch now just to remove it later is goofy.

- Randolph

