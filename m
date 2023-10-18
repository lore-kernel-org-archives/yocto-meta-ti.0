Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0900CDB482
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 06:52:14 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.275849.1697611927164155651
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 23:52:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=ZYg1X8ea;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: p-bhagat@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39I6pw27108054;
	Wed, 18 Oct 2023 01:51:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697611918;
	bh=p6HqzMZMDv+zD/wRQFag0o6jpS1XF101hIZNgToQen4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ZYg1X8ea5mm513V3N8IH7Kqk/qn8Yug4qvQY+3CLv/mTXSXT77lXwsi67TV1YPZVu
	 ceolV3hH97YRbP17XtEFJzUqk8vEj6z5eAfneATXuIwIF2Ua/eNv6SORJ6JLVaIKnn
	 BXZSjWrKNigTETJPEF3LTty1G8lWaYowydtMbOTA=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39I6pwTq068268
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 18 Oct 2023 01:51:58 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 18
 Oct 2023 01:51:58 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 18 Oct 2023 01:51:58 -0500
Received: from [172.24.227.38] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39I6ptt0006119;
	Wed, 18 Oct 2023 01:51:56 -0500
Message-ID: <79f113e1-8b7e-4733-8168-998179fcceb2@ti.com>
Date: Wed, 18 Oct 2023 12:21:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [kirkstone][PATCH] meta-ti-extras: recipes-ti: Update
 jailhouse SRC_URI to point to ti-jailhouse repo
Content-Language: en-US
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <c-shilwant@ti.com>,
        <s-adivi@ti.com>, <g-gupta@ti.com>
References: <20231017114107.3791996-1-p-bhagat@ti.com>
 <3a112273-5625-4685-96ef-d9ce22e4d388@ti.com>
 <20231017180712.GM2408@denix.org>
 <80abf130-77e9-4546-ab85-b857720f3684@ti.com>
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <80abf130-77e9-4546-ab85-b857720f3684@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 39I6pw27108054
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 18 Oct 2023 06:52:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17139

Hi Ryan and Denys,

On 18/10/23 00:36, Ryan Eatmon wrote:
>
>
> On 10/17/2023 1:07 PM, Denys Dmytriyenko wrote:
>> On Tue, Oct 17, 2023 at 08:46:15AM -0500, Ryan Eatmon via=20
>> lists.yoctoproject.org wrote:
>>>
>>>
>>> On 10/17/2023 6:41 AM, Paresh Bhagat wrote:
>>>> The ti-jailhouse repo is synced with the Siemens/jailhouse
>>>> at https://github.com/siemens/jailhouse. Use this for
>>>> development and build for TI devices.
>>>
>>> Is this TI repo a perfect clone of the Siemens' repo?=C2=A0 Or is a l=
oose
>>> copy with patches from TI on top of it?
>>
>> I don't see SRCREV being changed, which means it's a perfect clone as=20
>> of now.
>> In this case it doesn't make sense to deviate from upstream (yet?).
>
> Good point.=C2=A0 But the question is in the long run.=C2=A0 If we want=
 this=20
> repo to deviate with some of our custom patches then the three patches=20
> we are carrying should move to that repo.=C2=A0 That's why I was asking.
Agreed the patches will be moved to the TI repo. As of now its a perfect=20
clone of the Siemens repo which does not make sense but we will also=20
have custom patches in the TI repo for upcoming releases.
>
>
>>
>>>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>>>> ---
>>>> =C2=A0 meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb | 2 +-
>>>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb=20
>>>> b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
>>>> index 1c63b400..a96a7831 100644
>>>> --- a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
>>>> +++ b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
>>>> @@ -19,7 +19,7 @@ SRCREV =3D "e57d1eff6d55aeed5f977fe4e2acfb6ccbdd75=
60"
>>>> =C2=A0 BRANCH =3D "master"
>>>> =C2=A0 SRC_URI =3D " \
>>>> -=20
>>>> git://github.com/siemens/jailhouse.git;protocol=3Dhttps;branch=3D${B=
RANCH}=20
>>>> \
>>>> +=20
>>>> git://git.ti.com/git/jailhouse/ti-jailhouse.git;protocol=3Dhttps;bra=
nch=3D${BRANCH}=20
>>>> \
>>>> file://0001-configs-arm64-k3-am625-sk-Add-crypto-memory-region.patch=
 \
>>>> file://0002-configs-arm64-k3-am625-sk-Switch-inmate-boot-console.pat=
ch=20
>>>> \
>>>> file://0003-configs-arm64-k3-am625-sk-Add-VTM-memory-region.patch \
>

