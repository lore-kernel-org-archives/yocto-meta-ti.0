Return-Path: <a-dutta@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D10CC02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 07:23:56 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.45646.1739172235065432164
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 09 Feb 2025 23:23:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=qywfvv9u;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: a-dutta@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51A7Nr754192210
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 10 Feb 2025 01:23:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739172233;
	bh=GLxc34Mai2C8KKsum57jlyZquA6kxI6ZOQVh580tZmg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=qywfvv9ufXimzl8/isDkG848gdx+WDWLqP4lyd2My2dtQ0NHk6Opo1o3LKQq7gzz7
	 IlFpAaDKBOjWGI+TR0vncVH7g9a20kjqlMAuMC5LCgMeNRYrQkwhz5mmHIhCqUKyJH
	 DGTlwX+XkzcbeytWSLCyR5l8x+EzQB07jHDX5S9c=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51A7NrJo102033;
	Mon, 10 Feb 2025 01:23:53 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Feb 2025 01:23:52 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Feb 2025 01:23:52 -0600
Received: from [172.24.22.42] (ltpw0bk3wf.dhcp.ti.com [172.24.22.42])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51A7NoOO032714;
	Mon, 10 Feb 2025 01:23:51 -0600
Message-ID: <e3dfd433-3426-4aa8-bfb1-d72509422dc8@ti.com>
Date: Mon, 10 Feb 2025 12:53:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] conf: machine: j722s: Add overlay to
 KERNEL_DEVICETREE_PREFIX
To: "Kumar, Udit" <u-kumar1@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20250205073251.42414-1-a-dutta@ti.com>
 <8f3de3ea-0e89-452f-aef5-015d2d61fb3a@ti.com>
Content-Language: en-US
From: "Dutta, Anurag" <a-dutta@ti.com>
In-Reply-To: <8f3de3ea-0e89-452f-aef5-015d2d61fb3a@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 51A7Nr754192210
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 10 Feb 2025 07:23:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18291


On 08-02-2025 18:08, Kumar, Udit wrote:
>
> On 2/5/2025 1:02 PM, Anurag Dutta wrote:
>> Add the overlay "k3-j7200-evm-mcspi-loopback.dtso" to the j722s
>> configuration so that SPI loopback tests can be carried out
>> successfully.
>>
>> Signed-off-by: Anurag Dutta <a-dutta@ti.com>
>> ---
>> =C2=A0 meta-ti-bsp/conf/machine/j722s-evm.conf | 1 +
>> =C2=A0 1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-ti-bsp/conf/machine/j722s-evm.conf=20
>> b/meta-ti-bsp/conf/machine/j722s-evm.conf
>> index 2af0981e..8f42866c 100644
>> --- a/meta-ti-bsp/conf/machine/j722s-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/j722s-evm.conf
>> @@ -7,6 +7,7 @@ require conf/machine/include/j722s.inc
>> =C2=A0 KERNEL_DEVICETREE_PREFIX =3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-j722s \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-fpdlink \
>> +=C2=A0=C2=A0=C2=A0 ti/k3-j7200-evm-mcspi-loopback \
>
> How do you see, this loopback working,
>
> AFAIK , this SOC does not have mcu_spi2 and main_spi4

Mistake on my part. We will only use main_spi0 for loopback testing.
The correct dtso will be "ti/k3-am625-sk-mcspi-loopback.dtso".
Will send a v2 patch with test results.

>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-v3link \
>> =C2=A0 "

