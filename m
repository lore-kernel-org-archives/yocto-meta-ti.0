Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D14F7C7EE2F
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 11:59:10 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.7022.1686052746351087132
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 04:59:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=M4PZA1L9;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: p-bhagat@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 356Bx3PK061093;
	Tue, 6 Jun 2023 06:59:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686052743;
	bh=WF98Xo2Avt+aQiVtFpwyNtG1LHvablGhrKMFerrK5OY=;
	h=Date:Subject:To:References:CC:From:In-Reply-To;
	b=M4PZA1L9DNKOAXj1r78u/rbllQZzGU9YJ/8Imt7mTuhPpWEd6TJVer8ZgkXz0eOqU
	 NdtdN6BEQdj14FyXITXBKelUa4VmI25IzIoMg3a+Zq1tKI2ZxOOp20tdZAsZcggBu1
	 zbioZWbLybjBu6n/lTsCeSOuFu2u9R1yTvmH1Fv8=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 356Bx3Dl050701
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Jun 2023 06:59:03 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Jun 2023 06:59:03 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Jun 2023 06:59:03 -0500
Received: from [172.24.145.229] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 356Bx0l2033816;
	Tue, 6 Jun 2023 06:59:01 -0500
Message-ID: <e218a5d7-dbcd-9afc-1cec-d10cef036870@ti.com>
Date: Tue, 6 Jun 2023 17:29:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [EXTERNAL] Re: [meta-ti] [kirkstone][PATCH v2] meta-ti-bsp: Add
 recipe for u-boot-ti-jailhouse and linux-ti-jailhouse
Content-Language: en-US
To: Ricardo Salveti <ricardo@foundries.io>
References: <20230605131152.69991-1-p-bhagat@ti.com>
 <1765C66D190BA797.3349@lists.yoctoproject.org>
 <4a980318-4b35-f2a8-c7cd-242f5a99ef57@ti.com>
 <CAAaKDhHS7dHPPQ7YpuzUg5ff7aNnntJdOavv2Q=wwes5GRG2qQ@mail.gmail.com>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <c-shilwant@ti.com>,
        <s-adivi@ti.com>, <khasim@ti.com>, <g-gupta@ti.com>
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <CAAaKDhHS7dHPPQ7YpuzUg5ff7aNnntJdOavv2Q=wwes5GRG2qQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 356Bx3PK061093
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 06 Jun 2023 11:59:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16673

Hi,

On 06/06/23 03:29, Ricardo Salveti wrote:
> On Mon, Jun 5, 2023 at 5:25=E2=80=AFPM Ryan Eatmon via lists.yoctoproje=
ct.org
> <reatmon=3Dti.com@lists.yoctoproject.org> wrote:
>> On 6/5/2023 8:30 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
>>> On 6/5/2023 8:11 AM, Paresh Bhagat wrote:
>>>> Add new recipe for u-boot-ti-jailhouse and linux-ti-jailhouse which =
will
>>>> be used for jailhouse for am62xx-evm.
>>>>
>>>> Jailhouse support for am62xx-evm requires few patches for u-boot and
>>>> linux
>>>> which are hosted at processor-sdk/u-boot and processor/linux
>>>> respectively.
>>>> To build a image with jailhouse for am62xx-evm, these recipes
>>>> will be used instead of u-boot-ti-staging and linux-ti-staging by
>>>> changing
>>>> the preferred_provider.
>>>>
>>>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>>>> ---
>>>>    .../recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb    | 9 ++++=
+++++
>>>>    .../recipes-kernel/linux/linux-ti-jailhouse_6.1.bb       | 9 ++++=
+++++
>>>>    2 files changed, 18 insertions(+)
>>>>    create mode 100644
>>>> meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
>>>>    create mode 100644
>>>> meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse_6.1.bb
>>>>
>>>> diff --git
>>>> a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
>>>> b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
>>>> new file mode 100644
>>>> index 00000000..079d55dd
>>>> --- /dev/null
>>>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
>>>> @@ -0,0 +1,9 @@
>>>> +require u-boot-ti-staging_2023.04.bb
>>>> +
>>>> +# This will have priority over generic uboot path
>>>> +
>>>> +BRANCH =3D "ti-u-boot-2023.04-jailhouse"
>>>> +
>>>> +UBOOT_GIT_URI =3D "git://git.ti.com/git/processor-sdk/u-boot.git"
>>> What is reasoning for not upstreaming these patches (both u-boot and
>>> kernel) even just into the TI repositories?
>>>
>>> My concern is the CICD process.  This is adding another recipe with a
>>> completely different linux/u-boot repository that we need to add supp=
ort
>>> for to keep the recipes up to date.
>>>
>>> And you guys will to keep rebasing these patches on top of the latest
>>> 6.1 prod branch when CICD promotes.
>>>
>>> This just feels like something that is going to turn into a lot of
>>> maintenance work in the future.
>>
>> After discussing this with Praneeth, these recipes should not be calle=
d
>> jailhouse, but rather something more generic (maybe experiments).  We =
do
>> not want to explode the number of recipes in the directory with every
>> experiment we want to run in the future...  We can then configure whic=
h
>> branch under the experiments to pick based on something in the distro
>> features or via machine features.
>>
>> And upon further reflection, do we want to create a new layer under th=
e
>> meta-ti repo to house all of these new changes and not host them in
>> meta-ti-bsp?  Basically keep meta-ti-bsp as the production versions of
>> code?  Any thoughs Andrew, Denys, Randolph?
> For experiments I think it makes sense to have it hosted in another
> layer, but in this case jailhouse is an official functionality that is
> also supported by TI, isn't it?
>
> My concern is that real customers might want to have jailhouse
> enabled, which will force them to use this extra layer which might not
> necessarily be aligned with the main bsp revision used (e.g. kernel
> and u-boot), causing maintenance issues for product builders.
>
> Maybe in this case it is just better to have the patches available in
> the layer and enabled dynamically via machine features? It is still a
> pain to maintain as it might have conflicts in the future and might
> require patch updates, but if indeed a desired feature it might make
> sense to be part of the main layer.

We need to support various distros going forward, so it must not be tied=20
to Yocto layers, hence the seperate repos. Additionally, users must be=20
able to use git kernel tree without going to worry about applying=20
patches. We want to carry these changes as maintainable branch instead=20
of *.patch files in meta-ti-bsp.

Thanks

>
> Cheers,

