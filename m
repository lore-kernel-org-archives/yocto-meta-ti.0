Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D6F2C7EE2E
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 12:06:27 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.6659.1686139578165595331
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 07 Jun 2023 05:06:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=dqKALRAK;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: p-bhagat@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 357C6GEX000603;
	Wed, 7 Jun 2023 07:06:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686139576;
	bh=OfFsLhEbZ7z8bsut+xLCcZuW17bOU+ECnOLie+rwJl8=;
	h=Date:Subject:References:To:CC:From:In-Reply-To;
	b=dqKALRAKLgTfa7ycyD2+JozVjpar1T5c/T2xJBCnxCAz07hlH2mmPZOknKikEkfMX
	 3AK2GU9+9TF3vb6sgAiNKtwhZU+t7UjVjdwf0D68MhAqxo2lbBBWF4xbw4mXOxaT29
	 +ur9Nqrx94zH5FuubycpN1lMxFL+gLJppBi3b0bY=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 357C6GoK047604
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Jun 2023 07:06:16 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 Jun 2023 07:06:15 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 Jun 2023 07:06:15 -0500
Received: from [172.24.145.229] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 357C6DvX027737;
	Wed, 7 Jun 2023 07:06:14 -0500
Message-ID: <e0bbe192-a445-054f-691e-a9168b8e2f76@ti.com>
Date: Wed, 7 Jun 2023 17:36:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [EXTERNAL] Re: [meta-ti] [kirkstone][PATCH v2] meta-ti-bsp: Add
 recipe for u-boot-ti-jailhouse and linux-ti-jailhouse
Content-Language: en-US
References: <20230605131152.69991-1-p-bhagat@ti.com>
 <1765C66D190BA797.3349@lists.yoctoproject.org>
 <4a980318-4b35-f2a8-c7cd-242f5a99ef57@ti.com>
 <CAAaKDhHS7dHPPQ7YpuzUg5ff7aNnntJdOavv2Q=wwes5GRG2qQ@mail.gmail.com>
 <e218a5d7-dbcd-9afc-1cec-d10cef036870@ti.com>
 <CAAaKDhFuDVmKERbFHfsu1T+r5-hv=412wy=B9eb0WN=ufJzy9g@mail.gmail.com>
 <1766594FA55EBBB9.27841@lists.yoctoproject.org>
To: Ricardo Salveti <ricardo@foundries.io>
CC: <meta-ti@lists.yoctoproject.org>, "Bajjuri, Praneeth" <praneeth@ti.com>,
        "Shilwant, Chirag" <c-shilwant@ti.com>, <s-adivi@ti.com>,
        <khasim@ti.com>, <g-gupta@ti.com>
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <1766594FA55EBBB9.27841@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 357C6GEX000603
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 07 Jun 2023 12:06:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16686

Hi,

On 07/06/23 15:51, Paresh Bhagat via lists.yoctoproject.org wrote:
>
> Hi Ricardo,
>
> On 06/06/23 21:57, Ricardo Salveti wrote:
>> On Tue, Jun 6, 2023 at 8:59=E2=80=AFAM Paresh Bhagat<p-bhagat@ti.com> =
 wrote:
>>> Hi,
>>>
>>> On 06/06/23 03:29, Ricardo Salveti wrote:
>>>> On Mon, Jun 5, 2023 at 5:25=E2=80=AFPM Ryan Eatmon via lists.yoctopr=
oject.org
>>>> <reatmon=3Dti.com@lists.yoctoproject.org>  wrote:
>>>>> On 6/5/2023 8:30 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
>>>>>> On 6/5/2023 8:11 AM, Paresh Bhagat wrote:
>>>>>>> Add new recipe for u-boot-ti-jailhouse and linux-ti-jailhouse whi=
ch will
>>>>>>> be used for jailhouse for am62xx-evm.
>>>>>>>
>>>>>>> Jailhouse support for am62xx-evm requires few patches for u-boot =
and
>>>>>>> linux
>>>>>>> which are hosted at processor-sdk/u-boot and processor/linux
>>>>>>> respectively.
>>>>>>> To build a image with jailhouse for am62xx-evm, these recipes
>>>>>>> will be used instead of u-boot-ti-staging and linux-ti-staging by
>>>>>>> changing
>>>>>>> the preferred_provider.
>>>>>>>
>>>>>>> Signed-off-by: Paresh Bhagat<p-bhagat@ti.com>
>>>>>>> ---
>>>>>>>     .../recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb    | 9 =
+++++++++
>>>>>>>     .../recipes-kernel/linux/linux-ti-jailhouse_6.1.bb       | 9 =
+++++++++
>>>>>>>     2 files changed, 18 insertions(+)
>>>>>>>     create mode 100644
>>>>>>> meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
>>>>>>>     create mode 100644
>>>>>>> meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse_6.1.bb
>>>>>>>
>>>>>>> diff --git
>>>>>>> a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
>>>>>>> b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
>>>>>>> new file mode 100644
>>>>>>> index 00000000..079d55dd
>>>>>>> --- /dev/null
>>>>>>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.=
bb
>>>>>>> @@ -0,0 +1,9 @@
>>>>>>> +require u-boot-ti-staging_2023.04.bb
>>>>>>> +
>>>>>>> +# This will have priority over generic uboot path
>>>>>>> +
>>>>>>> +BRANCH =3D "ti-u-boot-2023.04-jailhouse"
>>>>>>> +
>>>>>>> +UBOOT_GIT_URI =3D "git://git.ti.com/git/processor-sdk/u-boot.git=
"
>>>>>> What is reasoning for not upstreaming these patches (both u-boot a=
nd
>>>>>> kernel) even just into the TI repositories?
>>>>>>
>>>>>> My concern is the CICD process.  This is adding another recipe wit=
h a
>>>>>> completely different linux/u-boot repository that we need to add s=
upport
>>>>>> for to keep the recipes up to date.
>>>>>>
>>>>>> And you guys will to keep rebasing these patches on top of the lat=
est
>>>>>> 6.1 prod branch when CICD promotes.
>>>>>>
>>>>>> This just feels like something that is going to turn into a lot of
>>>>>> maintenance work in the future.
>>>>> After discussing this with Praneeth, these recipes should not be ca=
lled
>>>>> jailhouse, but rather something more generic (maybe experiments).  =
We do
>>>>> not want to explode the number of recipes in the directory with eve=
ry
>>>>> experiment we want to run in the future...  We can then configure w=
hich
>>>>> branch under the experiments to pick based on something in the dist=
ro
>>>>> features or via machine features.
>>>>>
>>>>> And upon further reflection, do we want to create a new layer under=
 the
>>>>> meta-ti repo to house all of these new changes and not host them in
>>>>> meta-ti-bsp?  Basically keep meta-ti-bsp as the production versions=
 of
>>>>> code?  Any thoughs Andrew, Denys, Randolph?
>>>> For experiments I think it makes sense to have it hosted in another
>>>> layer, but in this case jailhouse is an official functionality that =
is
>>>> also supported by TI, isn't it?
>>>>
>>>> My concern is that real customers might want to have jailhouse
>>>> enabled, which will force them to use this extra layer which might n=
ot
>>>> necessarily be aligned with the main bsp revision used (e.g. kernel
>>>> and u-boot), causing maintenance issues for product builders.
>>>>
>>>> Maybe in this case it is just better to have the patches available i=
n
>>>> the layer and enabled dynamically via machine features? It is still =
a
>>>> pain to maintain as it might have conflicts in the future and might
>>>> require patch updates, but if indeed a desired feature it might make
>>>> sense to be part of the main layer.
>>> We need to support various distros going forward, so it must not be t=
ied
>>> to Yocto layers, hence the seperate repos. Additionally, users must b=
e
>>> able to use git kernel tree without going to worry about applying
>>> patches. We want to carry these changes as maintainable branch instea=
d
>>> of *.patch files in meta-ti-bsp.
>> Then how are you planning on updating these extra branches moving
>> forward? Rebases? Merges from the main branch?
>>
>> Just trying to understand how to best align this with customers
>> wanting to use jailhouse, since they might end up being behind from
>> the main bsp tree if the branch ends up being behind.
>>
>> In or out yocto the maintenance pain will exist.
>>
>> Cheers,
>
> It will be merge from the main branch. However, these repos will be=20
> setup to have auto merged.
>
> Thanks,
>
> Paresh
>
Forgot to put format to plain text. Please ignore.

Thanks,

Paresh

>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16685): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/16685
> Mute This Topic: https://lists.yoctoproject.org/mt/99339809/7067447
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [p-bhagat@t=
i.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

