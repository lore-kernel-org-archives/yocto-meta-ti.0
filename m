Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.40657.1629215016465263842
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Aug 2021 08:43:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=uidOXEfo;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nikhil.nd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17HFhZuR002449
	for <meta-ti@lists.yoctoproject.org>; Tue, 17 Aug 2021 10:43:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1629215015;
	bh=A1BrBC1hQuhDjW0o8I4b9GI6WbnTQlp57YVG35gcIMU=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=uidOXEfo8cHobSCkZoI9gy+YVSxOHJw6JFmNfV17ot73MrNfrl7N1OD+7A87ATfCp
	 ZCSJUBIklPA37x5BgDSlWnNa9leQMNQ6yaNoh1Kj3anfub6XEZ9+kMsFfvnJjL3Kfm
	 DuC9j8SfeBsLWcd0HmGRmJYpEnELQNY1mM4RDjxY=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17HFhZfU100243
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 17 Aug 2021 10:43:35 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 17
 Aug 2021 10:43:35 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 17 Aug 2021 10:43:34 -0500
Received: from [10.250.173.89] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17HFhXrR070965
	for <meta-ti@lists.yoctoproject.org>; Tue, 17 Aug 2021 10:43:34 -0500
Subject: Re: [meta-ti] Correct MACHINE for
To: <meta-ti@lists.yoctoproject.org>
References: <169C19A45CFCB862.13456@lists.yoctoproject.org>
 <b0f6f1d9-ecfa-de41-5275-d472f84e5305@amazon.com>
From: "Nikhil Devshatwar" <nikhil.nd@ti.com>
Message-ID: <7729788a-f9fe-689d-2a1f-b18e72fd9cd6@ti.com>
Date: Tue, 17 Aug 2021 21:13:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b0f6f1d9-ecfa-de41-5275-d472f84e5305@amazon.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 17HFhZuR002449
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

On 17/08/21 7:29 pm, elberger via lists.yoctoproject.org wrote:
> Nevermind I see it on master branch.
>=20
> Bummer it seems like I cannot use it for the LTS branch. Is there any=20
> plan for that?
>=20

You should see the machine am64xx-evm
The latest SDK release for AM64 Linux is 08.00.00.21  (based on 2021 LTS=20
kernel)

You can find config file at [1]
and the latest release page at [2]

[1]=20
https://git.ti.com/cgit/arago-project/oe-layersetup/tree/configs/processor-=
sdk/processor-sdk-08.00.00.21-config.txt
[2] https://www.ti.com/tool/download/PROCESSOR-SDK-LINUX-AM64X#release-note=
s

Regards,
Nikhil D


> On 8/17/21 9:02 AM, elberger via lists.yoctoproject.org wrote:
>> CAUTION: This email originated from outside of the organization. Do=20
>> not click links or open attachments unless you can confirm the sender=20
>> and know the content is safe.
>>
>>
>>
>> Hello
>>
>> I am looking for the correct MACHINE config for the TMDS64GPEVM.
>>
>> At this page I do not see any reference to TMDS64GPEVM.
>>
>> https://software-dl.ti.com/processor-sdk-linux/esd/AM64X/07_03_01_006/ex=
ports/docs/linux/Overview_Building_the_SDK.html#processor-sdk-build-referen=
ce=20
>>
>>
>> This is the SDK that the board's page points to from here
>>
>> https://www.ti.com/tool/TMDS64GPEVM
>>
>> I am also cloning the SDK using the processor-sdk-dunfell-07.01.00.txt
>> config if that makes a difference.=C2=A0 Perhaps the configuration is on=
 a
>> different branch.
>>
>> Thank you
>>
>>
>>
>=20
> --=20
> Richard Elberger
> Principal Technologist
> AWS IoT
>=20
> +1 646.927.6897
> +1 203.942.8039 =E2=80=93 mobile
> elberger@amazon.com  =E2=80=93 email
>=20
>=20
>=20
>=20
>=20
