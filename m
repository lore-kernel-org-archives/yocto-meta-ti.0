Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D37DDEB64D8
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 18:16:29 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.348.1686766587408160086
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 Jun 2023 11:16:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=Hltr3pWw;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35EIGE3j112357;
	Wed, 14 Jun 2023 13:16:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686766574;
	bh=x4tQplaF7fNCMFBflKyGIXXBjZMA63tmQ+14tKKKXNg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Hltr3pWwCHiAlFHHfiZeYAZoOknERC3tFwZgidOmERobv1pofdN8dXE35LLboEc3j
	 9VWc6bRC2SQLCujj6DNKoG9cZD5+/vtiomF9admDVtTGDhaWvJd71KygajCld3OwK5
	 kJ9vtV+cn6c/JQuDam7wOHVOLt5f/B7Axptb0qc8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35EIGEta085009
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 Jun 2023 13:16:14 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 Jun 2023 13:16:14 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 Jun 2023 13:16:13 -0500
Received: from [10.249.34.224] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35EIGDW0004974;
	Wed, 14 Jun 2023 13:16:13 -0500
Message-ID: <6baddf54-c8c7-669f-53dc-5e952ba3d2fa@ti.com>
Date: Wed, 14 Jun 2023 13:16:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [meta-ti] [kirkstone] [PATCH v2 1/2] u-boot-ti-staging_2023.04:
 Copy bitmap file to boot partition for AM62x
Content-Language: en-US
To: Devarsh Thakkar <devarsht@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <denys@konsulko.com>,
        <nm@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <khasim@ti.com>, <nsekhar@ti.com>, <afd@ti.com>, <rs@ti.com>,
        <n-jain1@ti.com>
References: <20230614143306.1502763-1-devarsht@ti.com>
 <20230614143306.1502763-2-devarsht@ti.com> <20230614145436.GW9226@denix.org>
 <3edc9efe-20b4-bb49-09a4-6df4cd39ca1a@ti.com>
 <20230614155146.GX9226@denix.org>
 <e9d8598c-5718-2fb7-5e05-dd517467d20c@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <e9d8598c-5718-2fb7-5e05-dd517467d20c@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 35EIGE3j112357
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 14 Jun 2023 18:16:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16727



On 6/14/2023 11:57 AM, Devarsh Thakkar wrote:
>=20
>=20
> On 14/06/23 21:21, Denys Dmytriyenko wrote:
>> On Wed, Jun 14, 2023 at 08:53:07PM +0530, Devarsh Thakkar wrote:
>>> Hi Denys,
>>>
>>> Thanks for the review,
>>>
>>> On 14/06/23 20:24, Denys Dmytriyenko wrote:
>>>> On Wed, Jun 14, 2023 at 08:03:05PM +0530, Devarsh Thakkar via=20
>>>> lists.yoctoproject.org wrote:
>>>>> Early splash screen support for AM62x has been enabled in u-boot
>>>>> and it requires bitmap tarball to be present in boot partition
>>>>> as per the default environment settings done in u-boot [1].
>>>>>
>>>>> Copy the ti logo bitmap tarball to boot partition of wic image in=20
>>>>> order
>>>>> to enable out of box early display on AM62x.
>>>>>
>>>>> [1]=20
>>>>> https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/board/ti/am62x/am6=
2x.env
>>>>>
>>>>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>>>>> ---
>>>>> V2: Rename ti logo tarball as per suggested changes (same is being
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 done in ti-u-boot too)
>>>>> ---
>>>>> =C2=A0 .../recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 9=20
>>>>> +++++++++
>>>>> =C2=A0 1 file changed, 9 insertions(+)
>>>>>
>>>>> diff --git=20
>>>>> a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb=20
>>>>> b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
>>>>> index e6da84cb..c948e1ed 100644
>>>>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
>>>>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
>>>>> @@ -8,3 +8,12 @@ BRANCH =3D "ti-u-boot-2023.04"
>>>>> =C2=A0 SRCREV =3D "1f510931dcc90e6f28f7fed757ad5000d4382e22"
>>>>> +do_install:append:am62xx() {
>>>>> +=C2=A0=C2=A0=C2=A0 install -d ${D}/boot
>>>>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${S}/tools/logos/ti_logo_414x97=
_32bpp.bmp.gz=20
>>>>> ${D}/boot
>>>>> +}
>>>>> +
>>>>> +do_deploy:append:am62xx() {
>>>>> +=C2=A0=C2=A0=C2=A0 install -d ${DEPLOYDIR}
>>>>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${S}/tools/logos/ti_logo_414x97=
_32bpp.bmp.gz=20
>>>>> ${DEPLOYDIR}
>>>>
>>>> Any specific reason you also need to deploy this loose file?
>>>>
>>>
>>> I think the boot partition script which is ran as part of=20
>>> do_image_wic expects
>>> IMAGE_BOOTFILES to be present in deploy directory, I remember getting=
=20
>>> below
>>> error without doing so :
>>>
>>> | ERROR: _exec_cmd: install -m 0644 -D
>>> /home/devarsht/ti/yocto_sdk_am62/oe-layersetup/build/arago-tmp-defaul=
t-glibc/deploy/images/am62xx-evm/ti.gz
>>> /home/devarsht/ti/yocto_sdk_am62/oe-layersetup/build/arago-tmp-defaul=
t-glibc/work/am62xx_evm-oe-linux/tisdk-default-image/1.0-r0/tmp-wic/hdd/b=
oot/ti.gz
>>> returned '1' instead of 0
>>> | output: install: cannot stat
>>> '/home/devarsht/ti/yocto_sdk_am62/oe-layersetup/build/arago-tmp-defau=
lt-glibc/deploy/images/am62xx-evm/ti.gz':
>>> No such file or directory
>>> | WARNING:
>>> /home/devarsht/ti/yocto_sdk_am62/oe-layersetup/build/arago-tmp-defaul=
t-glibc/work/am62xx_evm-oe-linux/tisdk-default-image/1.0-r0/temp/run.do_i=
mage_wic.1581619:162
>>> exit 1 from=20
>>> 'BUILDDIR=3D"/home/devarsht/ti/yocto_sdk_am62/oe-layersetup/build"
>>> PSEUDO_UNLOAD=3D1 wic create "$wks" --vars
>>> "/home/devarsht/ti/yocto_sdk_am62/oe-layersetup/build/arago-tmp-defau=
lt-glibc/sysroots/am62xx-evm/imgdata/"
>>> -e "tisdk-default-image" -o "$build_wic/" -w "$tmp_wic"'
>>
>> So, is this logo expected by U-boot to reside in the boot partition of=
 SD
>> card, or in the /boot directory of the rootfs?
>> The first is handled by do_deploy and IMAGE_BOOTFILES, while the=20
>> second is
>> handled by do_install. I wonder if doing both is going to be confusing=
...
>>
>>
>=20
> Yes, this logo is expected to reside in boot partition of SD only per=20
> current implementation in ti-u-boot.

So then it only requires do_deploy and IMAGE_BOOTFILES since that puts=20
items into the boot partition... Do we need the do_install?


> Regards
> Devarsh
>=20
>>> One more reason to do so was to allow user ease of use, to copy the=20
>>> logo too
>>> from deploy folder along with other boot files (if not flashing from =
wic
>>> image) since the same is set in am62x.env and if logo is not present=20
>>> in boot
>>> partition then it throws some error message although the device still=
=20
>>> boots.

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

