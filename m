Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.2680.1617067248090286015
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 29 Mar 2021 18:20:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=lTffIYhQ;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12U1KhKi090115;
	Mon, 29 Mar 2021 20:20:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617067243;
	bh=6aR/ohoOw7sEYalrT8zR7qqLm2Q931xkzoycblpWzk4=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=lTffIYhQLs3kjQ9rbyJz3BeR2nOIJz+HpQJSwjka7j3myRt4fqljFmBmSsta9xCXx
	 +D3Q2eqqI0fzX2IpHuaVZdAYBW65HmYPoyPPWNdFTnD/QscnRH41Gw0nS2DP/LSGWO
	 lMlhOmAlaYb8tw/lURK2DsFzuKrEk+KnRCHcmJH4=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12U1Kh8X106254
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 29 Mar 2021 20:20:43 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 29
 Mar 2021 20:20:43 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 29 Mar 2021 20:20:43 -0500
Received: from [10.250.50.222] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12U1KgQg121199;
	Mon, 29 Mar 2021 20:20:43 -0500
Subject: Re: [meta-ti] No serial output on a custom AM3352 board
To: Denys Dmytriyenko <denis@denix.org>, <tagliapietra.alessandro@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>, "Bhargav, Krunal" <k-bhargav@ti.com>
References: <28ma.1617003789931138360.Mb2u@lists.yoctoproject.org>
 <20210329184235.GC14886@denix.org>
From: "praneeth" <praneeth@ti.com>
Message-ID: <4202bb3c-97b3-eb1d-d424-9c77a007b243@ti.com>
Date: Mon, 29 Mar 2021 20:20:42 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210329184235.GC14886@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 12U1KhKi090115
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 3/29/2021 1:42 PM, Denys Dmytriyenko wrote:
> Just a follow up from our IRC discussion with more clarifications.
>=20
> * This is an industrial board/product from a 3rd-party manufacturer, bas=
ed on
> AM3352 SoC. It's custom enough, as obviously EVM images don't boot.
>=20
> * The manufacturer did not provide sources or instructions with the boar=
d,
> only SD card binary images.
>=20
> * Boot log from those images indicate U-boot 2014.07 and kernel 3.14.43,=
 which
> are quite ancient
>=20
> Getting recent u-boot and kernel working on this board will require recr=
eating
> board configs and updating old DTS. Not sure mixing old u-boot with new =
kernel
> is a good idea either - still need to massage DTS...
>=20
> Maybe our BSP experts here can pitch in and comment on feasibility of th=
is
> effort. It's definitely not Yocto specific though.
>=20
>=20
> On Mon, Mar 29, 2021 at 12:43:09AM -0700, tagliapietra.alessandro@gmail.=
com wrote:
>> Hello everyone,
>>
>> first time yocto user here, I'm trying to get a very minimal image to b=
oot
>> on a AM3352 based device that a local company made, however when it boo=
ts
>> there is no output on the serial port.
>>
>> These are the steps I've tried:
>> - added meta-ti and dependent layers
>> - removed these features from the minimal image "alsa ext2 api-document=
ation
>> bluetooth ipv6 opengl pcmcia ppp ptest wayland wifi x11 vulkan" as I do=
n't
>> think are needed for our basic test
>> - taken the dtb file from the manufacturer sd card, converted to dts us=
ing
>> dtc, added to the kernel using a layer and changed=C2=A0KERNEL_DEVICETR=
EE =3D
>> "device-name-here.dtb"=C2=A0 (name replaced)
>> - I've cloned their SD card to make sure the partitions are the same (F=
AT16
>> first partition with boot flag + ext4 second partition)
>> - bitbake build
>> - replaced MLO/u-boot.img in the boot partition
>> - extracted rootfs into the ext4 partition, copied zImage and the dtb f=
iles
>> in the /boot folder

The right place for this query is TI e2e . Please post your question=20
there for someone to help.

few related threads already in e2e addressing similar topic.

https://e2e.ti.com/support/processors/f/processors-forum/852197/am3358-u-b=
oot-fails

https://e2e.ti.com/support/processors/f/processors-forum/945637/processor-=
sdk-am335x-how-to-boot-bone-black-over-uart

https://e2e.ti.com/support/processors/f/processors-forum/927764/am3352-sta=
rt-u-boot-from-usd

Good luck


>>
>> I've also tried to use am335x-hs-evm as the machine (using also the UAR=
T
>> variants of MLO and U-boot) but no luck.
>> In case it's needed, these are the env variables from their working SD =
card
>> u-boot
>>
>> https://gist.github.com/alex88/5e8d604ab15540b84353040a83bc0606
>>
>> What should I try to at least be able to get u-boot to output something=
 in the console?
>>
>> Thank you in advance
>=20
>=20
>=20
>=20
>=20
