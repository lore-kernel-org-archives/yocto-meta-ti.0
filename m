Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41E99C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 16:20:07 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.58118.1699028403996352658
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 03 Nov 2023 09:20:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=kLNRUySg;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A3GK1MO081008;
	Fri, 3 Nov 2023 11:20:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699028401;
	bh=/GrqentcmcyBav3ywYN8BUZ8l8hcsWxizpsK5RM2rWc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=kLNRUySgHDcPvqdLFRRLHslcAiS7DTNZrSM64mm5yiB66iym+DXO9yc0rwJypTyGZ
	 TkLGuNfliE2YLNIIOwOibOjOzjEkp51wUMt+uYC8kvFUtzRtf847j8m6IOq9zWvp1j
	 qaniY3avUtZWyNadCd+0qmmNMMxcBBiHUkxzZZ90=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A3GK1Hc023519
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Nov 2023 11:20:01 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Nov 2023 11:20:00 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Nov 2023 11:20:00 -0500
Received: from [10.249.38.142] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A3GIVdw087146;
	Fri, 3 Nov 2023 11:20:00 -0500
Message-ID: <ce7565c7-7338-4d19-95b9-c989168192fe@ti.com>
Date: Fri, 3 Nov 2023 11:20:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/kirkstone][PATCH 8/8] recipes-bsp: Do not use
 MACHINE_ARCH when package is not machine specific
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20231025165630.2274889-1-afd@ti.com>
 <20231025165630.2274889-8-afd@ti.com> <20231026032740.GD2408@denix.org>
 <eed601f5-9a84-48c8-80a7-ac03bf48ed72@ti.com>
 <145580b2-dda0-4d36-b046-03f458929922@ti.com>
 <20231103061558.GL2408@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20231103061558.GL2408@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 3A3GK1MO081008
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 03 Nov 2023 16:20:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17234



On 11/3/2023 1:15 AM, Denys Dmytriyenko wrote:
> On Thu, Nov 02, 2023 at 09:57:11AM -0500, Ryan Eatmon wrote:
>>
>>
>> On 10/26/2023 9:00 AM, Andrew Davis wrote:
>>> On 10/25/23 10:27 PM, Denys Dmytriyenko wrote:
>>>> On Wed, Oct 25, 2023 at 11:56:30AM -0500, Andrew Davis via
>>>> lists.yoctoproject.org wrote:
>>>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>>>> ---
>>>>>  =C2=A0 meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git=
.bb | 2 --
>>>>>  =C2=A0 meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 --
>>>>>  =C2=A0 meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb=C2=
=A0=C2=A0=C2=A0=C2=A0 | 1 -
>>>>>  =C2=A0 meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 --
>>>>>  =C2=A0 meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.b=
b=C2=A0=C2=A0 | 2 --
>>>>>  =C2=A0 meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 --
>>>>>  =C2=A0 meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.b=
b=C2=A0=C2=A0 | 2 --
>>>>>  =C2=A0 meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb=C2=
=A0=C2=A0=C2=A0=C2=A0 | 2 --
>>>>>  =C2=A0 meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git=
.bb | 2 --
>>>>>  =C2=A0 meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 -
>>>>>  =C2=A0 meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 -
>>>>>  =C2=A0 11 files changed, 19 deletions(-)
>>>>
>>>> Overall I agree and fully support the first 7 patches in this series.
>>>>
>>>> But for this last one I wanted to open a discussion.
>>>>
>>>
>>> I try to sort my series in least-to-most likely to be controversial, =
I was
>>> just wondering how far we would get down the list, glad we got to 8 :=
)
>>>
>>>> On one hand I understand the desire to make components as
>>>> generic as possible
>>>> and reduce the number of machine-specific components to a bare minim=
um.
>>>>
>>>> But on another hand, marking the resulting package as
>>>> machine-specific when it
>>>> has a short list of compatible machines is a standard practice.
>>>> The reason is
>>>> that the list of compatible machines controls only compile time
>>>> filtering, but
>>>> doesn't have any effect on run time. And marking packages as
>>>> machine specific
>>>> helps with that. That closes the loophole of installing
>>>> incompatible packages.
>>>>
>>>> For example, first recipe below specifies that Cadence MHDP firmware=
 is
>>>> compatible with 3 J7 platforms only (or their SoC families, to be ex=
act).
>>>> But w/o marking resulting binary package as machine-specific (theref=
ore
>>>> producing separate packages for those platforms), there will be a si=
ngle
>>>> generic Aarch64 package made. And there's no protection from install=
ing
>>>> this generic package on non-compatible platforms, like J7200 or AM65=
xx,
>>>> either manullay or by pulling it into a rootfs for those incompatibl=
e
>>>> platforms.
>>>>
>>>> And you normally want to prevent this for regular components. But I =
guess
>>>> this doesn't fully apply to FW images that are loaded by correspondi=
ng
>>>> drivers anyway. Moreover, there's no compilation involved, just pack=
aging
>>>> the binary blob.
>>>>
>>>> In that case, should we also remove COMPATIBLE_MACHINE from
>>>> these firmware
>>>> recipes?
>>>>
>>>
>>> That is exactly where I was going to go next. These firmware packages=
 are
>>> not technically incompatible with the other machines.
>>>
>>> We just use COMPATIBLE_MACHINE checks here to keep us from
>>> accidentily bundling
>>> them with images where they wouldn't add any value (which you did
>>> with prusw-fw
>>> which is what stated me thinking on all this). But since they don't b=
reak
>>> anything either, forcing them to be machine specific seemed like
>>> overkill also.
>>>
>>> Only place where we still need this is firmware recipes that only
>>> ship some of
>>> the firmware based on machine (see prueth-fw for instance). I'd like =
to get
>>> that cleaned up next. If we only want some of the firmware then we
>>> should split
>>> it into different packages (prueth-fw-am57xx, etc.) and only
>>> install the one
>>> we want for that platform.
>>
>> Denys, does Andrew's response address your concerns?
>=20
> Well, I do believe we are generally in agreement here. But I'm not sure=
 if
> that means we should merge patch #8 as is and address COMPATIBLE_MACHIN=
E
> changes later, or rework the patch to address that with MACHINE_ARCH to=
gether?

Ok.  I'll accept 1-7 and reject 8 for now.  8 can be resubmitted once=20
those additional changes are made and can be taken all at once.



--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

