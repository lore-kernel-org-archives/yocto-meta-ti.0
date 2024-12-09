Return-Path: <a-shenai@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ABA9E77173
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 03:29:19 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.92970.1733714956478919035
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 08 Dec 2024 19:29:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=y5BctMOd;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: a-shenai@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B93TF6e2406827
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <meta-ti@lists.yoctoproject.org>; Sun, 8 Dec 2024 21:29:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733714955;
	bh=XUzzr1V+Ryu/ec9Q7o0pWv5akRGUWxdJlfT1WWy83+U=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=y5BctMOdyaUpw9DNRqwJd2ZLfirwTJDPCc/ZebmZN27ONZM36ppStuZk+K0Rh6eBS
	 FW0FPxEjrimz8QimZAcTsPFpXhO9d2Bv1uTZw+xT5Q+wPK3BrkZJs7ni5EaboDGFn7
	 lyAh/vOKQ+6UfUgIjLPdrZosTGhMiBvSiPyHzGAA=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B93TFmE115216
	for <meta-ti@lists.yoctoproject.org>; Sun, 8 Dec 2024 21:29:15 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 8
 Dec 2024 21:29:15 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 8 Dec 2024 21:29:15 -0600
Received: from [172.24.227.252] (aashvij.dhcp.ti.com [172.24.227.252])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B93TDAE069975;
	Sun, 8 Dec 2024 21:29:13 -0600
Message-ID: <c5657ade-5872-43db-bdc9-15549c0fdbfc@ti.com>
Date: Mon, 9 Dec 2024 08:59:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH v2] am62p: PRNG: Remove
 software PRNG
To: "Eatmon, Ryan" <reatmon@ti.com>, "Shilwant, Chirag" <c-shilwant@ti.com>
CC: "Bajjuri, Praneeth" <praneeth@ti.com>,
        "Gurudasani, Kamlesh"
	<kamlesh@ti.com>,
        "meta-ti@lists.yoctoproject.org"
	<meta-ti@lists.yoctoproject.org>
References: <20241206053521.1126544-1-a-shenai@ti.com>
 <379643c3-612f-4da3-8f0b-2d8f68934079@ti.com>
 <7f9f806c-0616-4bf2-a9f7-b972945a0bb9@ti.com>
Content-Language: en-US
From: Aashvij Shenai <a-shenai@ti.com>
In-Reply-To: <7f9f806c-0616-4bf2-a9f7-b972945a0bb9@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot04.ext.ti.com id 4B93TF6e2406827
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 Dec 2024 03:29:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18092

Thanks for the reviews,

I will update and send a v3

Regards,

Aashvij

On 06/12/24 20:35, Eatmon, Ryan wrote:
>
> On 12/6/2024 8:56 AM, Chirag Shilwant wrote:
>> Hi,
>>
>> Based on the convention, commit message title should be
>> recipes-security: optee: Remove software PRNG in am62pxx
> We don't usually require the "recipes-security" part.  As that makes th=
e
> message get really long.  But the recipe name base should be part of it.
>
> For non-recipes we tend to like a portion of the directory that the fil=
e
> being updated is in.  For example for a machine conf file:
>
> conf: am62xx-evm: do something
> classes: Update foo.class
>
> etc...
>
> But we do like to see something a bit more descriptive so that if we
> search through the logs it is more apparent about what area your change
> is being made.
>
> If you are ever unclear on what to put there, just to git.ti.com,
> navigate to the file you are changing, then look at the log changes for
> that file and see the history of changes to that file and try to be
> consistent.
>
>
>> On 06/12/24 11:05, Aashvij Shenai wrote:
>>> With the latest TIFS fix [1], AM62P is able to leverage the hardware-=
TRNG
>>> instead of having to fallback into the software-PRNG.
>>>
>>> [1] - commit: 98de0a4290ec200cc224d4a5a6f42d2126230e2f ("ti-sysfw:
>>> am65x/am64x/am62x/am62ax/am62px: update to version v10.01.08")
>>>
>>> Repo: https://git.ti.com/git/processor-firmware/ti-linux-firmware.git
>>> Branch: ti-linux-firmware
>>
>>
>> This entire story could just have been,
>>
>> [1]:
>> https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/commit/?h=
=3Dti-linux-firmware&id=3D98de0a4290ec200cc224d4a5a6f42d2126230e2f
>>
>>
>>
>>> Signed-off-by: Aashvij Shenai <a-shenai@ti.com>
>>> ---
>>>
>>> Changelog:
>>> v1 -> v2:
>>>  =C2=A0=C2=A0 - Updated commit message to include fix and moved test =
logs
>>>
>>> Testlogs:
>>> https://gist.github.com/AashvijShenai/9ea3e128ab29f703c2b6d988cfd0b82=
a
>>>
>>> ---
>>>
>>>  =C2=A0 meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc =
| 2 +-
>>>  =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git
>>> a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
>>> b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
>>> index 43b8ce1c..f131f1ff 100644
>>> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
>>> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
>>> @@ -6,7 +6,7 @@ EXTRA_OEMAKE:remove =3D "CFG_MAP_EXT_DT_SECURE=3Dy"
>>>  =C2=A0 EXTRA_OEMAKE:append:k3 =3D "${@ ' CFG_CONSOLE_UART=3D'+
>>> d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
>>>  =C2=A0 EXTRA_OEMAKE:append:am62xx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
>>> -EXTRA_OEMAKE:append:am62pxx =3D " CFG_WITH_SOFTWARE_PRNG=3Dy
>>> CFG_TEE_CORE_LOG_LEVEL=3D1"
>>> +EXTRA_OEMAKE:append:am62pxx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
>>>  =C2=A0 EXTRA_OEMAKE:append:am62axx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
>>>  =C2=A0 EXTRA_OEMAKE:append:j722s =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"

