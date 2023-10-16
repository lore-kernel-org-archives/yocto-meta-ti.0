Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5363CDB474
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 10:40:29 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.117514.1697452821962860467
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Oct 2023 03:40:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=piCvV/Oq;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39GAeK4I068414
	for <meta-ti@lists.yoctoproject.org>; Mon, 16 Oct 2023 05:40:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697452820;
	bh=TuUKRiEGbJKF/0JJySZYTfSzA2Udw6iLhelSgxSbHV8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=piCvV/OqDVBp01+sQMU6ZO/Yq96dEntCgwLl6zL6tw1NwR8lpCMyx5IwsdcNg8QVK
	 uQht0bb2YxfbEdU6uIcgRpKAJQRnAszRI98Q8WYyMdGvU+n9uA0H8xifvNHr7U2fsI
	 TroWeE+OJx03wCkZOz/uCaJkWfsv6piSAatIsvKA=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39GAeKlM034872
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 16 Oct 2023 05:40:20 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 16
 Oct 2023 05:40:20 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 16 Oct 2023 05:40:20 -0500
Received: from [172.24.227.238] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39GAeHE8015811;
	Mon, 16 Oct 2023 05:40:18 -0500
Message-ID: <f0fa3178-148b-4e75-9ccd-18e779e22f96@ti.com>
Date: Mon, 16 Oct 2023 16:10:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/kirkstone][PATCH 1/2] ti-sci-fw: Remove
 COMPATIBLE_MACHINE and extend recipe to k3 machines
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, "Limaye, Aniket" <a-limaye@ti.com>,
        "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
CC: "Eatmon, Ryan" <reatmon@ti.com>, "Gole, Dhruva" <d-gole@ti.com>,
        "Adivi,
 Sai Sree Kartheek" <s-adivi@ti.com>,
        "Raghavendra, Vignesh" <vigneshr@ti.com>
References: <20231012172947.1359231-1-a-limaye@ti.com>
 <20231012172947.1359231-2-a-limaye@ti.com>
 <8a2741b3-6fc5-46fc-bed2-c1528c407308@ti.com>
 <f902e28bfd21435a9b11abd44af2425f@ti.com>
 <56a62a33-87b3-4dea-a090-47e98ca93ba7@ti.com>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <56a62a33-87b3-4dea-a090-47e98ca93ba7@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 39GAeK4I068414
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 16 Oct 2023 10:40:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17114


On 13/10/23 20:34, Andrew Davis wrote:
> On 10/12/23 10:38 PM, Limaye, Aniket wrote:
>> Hi Andrew,
>>
>> We need those files to be packaged in the tisdk-core-bundle... So=20
>> that it can be packaged in the installer we release on ti.com. We=20
>> package these, ti-dm and the u-boot sources used, to enable u-boot=20
>> builds in the installer with the same sources used for our build.
>>
>
> You can fetch those firmware out of their normal install directory.
>
> Andrew
>
>> Regards,
>> Aniket
>>
>> -----Original Message-----
>> From: Davis, Andrew <afd@ti.com>
>> Sent: Friday, October 13, 2023 2:37 AM
>> To: Limaye, Aniket <a-limaye@ti.com>; meta-ti@lists.yoctoproject.org
>> Cc: Eatmon, Ryan <reatmon@ti.com>; Gole, Dhruva <d-gole@ti.com>;=20
>> Shilwant, Chirag <c-shilwant@ti.com>; Adivi, Sai Sree Kartheek=20
>> <s-adivi@ti.com>; Raghavendra, Vignesh <vigneshr@ti.com>
>> Subject: Re: [meta-ti][master/kirkstone][PATCH 1/2] ti-sci-fw: Remove=20
>> COMPATIBLE_MACHINE and extend recipe to k3 machines
>>
>> On 10/12/23 12:29 PM, Aniket Limaye via lists.yoctoproject.org wrote:
>>> Revert ebcf15bf0f31208e87ce60a4696e585940b46777 :
>>> =C2=A0=C2=A0=C2=A0 "recipes-bsp:ti-sci-fw: Add k3r5 as COMPATIBLE_MAC=
HINE"
>>>
>>> Extend recipe to k3 machines too, to provide ti-fs-stub-* firmware fo=
r
>>> u-boot aarch64 build.
>>>
>>> Update do_deploy() to allow multiconfig builds for k3 machines
>>>
>>> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
>>> ---
>>> =C2=A0=C2=A0 meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 6 +=
+++--
>>> =C2=A0=C2=A0 1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>>> b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>>> index 801c8768..2ad93a5d 100644
>>> --- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>>> +++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>>> @@ -4,7 +4,6 @@ inherit deploy
>>> =C2=A0=C2=A0 =C2=A0=C2=A0 require recipes-bsp/ti-linux-fw/ti-linux-fw=
.inc
>>> =C2=A0=C2=A0 -COMPATIBLE_MACHINE =3D "k3r5"
>>> =C2=A0=C2=A0 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>> =C2=A0=C2=A0 =C2=A0=C2=A0 CFLAGS[unexport] =3D "1"
>>> @@ -26,7 +25,10 @@ do_install() {
>>> =C2=A0=C2=A0 =C2=A0=C2=A0 FILES:${PN} =3D "${nonarch_base_libdir}/fir=
mware"
>>> =C2=A0=C2=A0 -do_deploy() {
>>> +do_deploy(){
>>> +}
>>> +
>>> +do_deploy:k3r5() {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${DEPLOYDIR}/ti-sysfw
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 644 ${S}/ti-sysfw/ti-=
sci-firmware-*=20
>>> ${DEPLOYDIR}/ti-sysfw
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 644 ${S}/ti-sysfw/ti-=
fs-firmware-*=20
>>> ${DEPLOYDIR}/ti-sysfw
>>
>> Why do we need to deploy these files in ${DEPLOYDIR}/ at all?
>>
>> Andrew
>>
>>

This will deploy all ti-sci-* & ti-fs-* firmwares present in=20
ti-linux-firmware repository
in the deploy directory irrespective of the yocto machine which is=20
redundant. It's better if
we deploy based on yocto machine.

>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#17097):
>>> https://lists.yoctoproject.org/g/meta-ti/message/17097
>>> Mute This Topic: https://lists.yoctoproject.org/mt/101923272/3619733
>>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub
>>> [afd@ti.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>

