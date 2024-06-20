Return-Path: <sabeeh-khan@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02D0FC27C79
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 13:31:21 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.47724.1718890278488672804
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 20 Jun 2024 06:31:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=VIf5LX1R;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: sabeeh-khan@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45KDVFQd022625;
	Thu, 20 Jun 2024 08:31:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718890275;
	bh=1bqEBD5gV4pnKk/XGCL5php2TtqJH9Ik4izX/Kqsdsw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=VIf5LX1REPaDNR16MoQIO57A7Qac0MAx4axDHeuS5zdfXPhG/zWoiXLlxJDmgRTKZ
	 /LwH8hFQqLpozacx4tKHThdpHzChOdtVqxJwpDbcQsrxPNrERCOUwoiQKo6GrOR+E+
	 5pLcWxCRijIl8Pz5HqcVEQHdluho2K7Vm1FuV2b0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45KDVF9s090718
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Jun 2024 08:31:15 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Jun 2024 08:31:15 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Jun 2024 08:31:14 -0500
Received: from [10.249.33.87] ([10.249.33.87])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45KDVE8d008639;
	Thu, 20 Jun 2024 08:31:14 -0500
Message-ID: <6c1efef1-51ac-42ae-aa07-d1edd39a1a56@ti.com>
Date: Thu, 20 Jun 2024 08:31:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-ti] [RFC][master/scarthgap][PATCH 0/4] add FW
 and utilities for cc33xx wireless driver
To: Chirag Shilwant <c-shilwant@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan Eatmon <reatmon@ti.com>
References: <20240620032202.169122-1-sabeeh-khan@ti.com>
 <6e132f53-dd85-4108-b9a2-56a0f77b328b@ti.com>
Content-Language: en-US
From: "Khan, Sabeeh" <sabeeh-khan@ti.com>
In-Reply-To: <6e132f53-dd85-4108-b9a2-56a0f77b328b@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 45KDVFQd022625
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 20 Jun 2024 13:31:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17774

Hi Chirag,

On 6/20/2024 12:59 AM, Chirag Shilwant wrote:
> Hi Sabeeh,
>
> On 20/06/24 08:51, Sabeeh Khan via lists.yoctoproject.org wrote:
>> This series adds FW support, configuration files, and tools to be=20
>> used with the cc33xx drivers. The cc33xx driver has been added to TI=20
>> kernel 6.=E2=80=8A6 with progress being made for kernel upstreaming. S=
abeeh=20
>> Khan (4): cc33conf: add new cc33conf tool
>> ZjQcmQRYFpfptBannerStart
>> This message was sent from outside of Texas Instruments.
>> Do not click links or open attachments unless you recognize the=20
>> source of this email and know the content is safe. If you wish to=20
>> report this message to IT Security, please forward the message as an=20
>> attachment to phishing@list.ti.com
>> ZjQcmQRYFpfptBannerEnd
>> This series adds FW support, configuration files, and tools to be used
>> with the cc33xx drivers. The cc33xx driver has been added to TI=20
>> kernel 6.6
>> with progress being made for kernel upstreaming.
>>
>> Sabeeh Khan (4):
>> =C2=A0=C2=A0 cc33conf: add new cc33conf tool for cc33xx devices
>> =C2=A0=C2=A0 cc33calibrator: add new cc33calibrator tool for cc33xx de=
vices
>> =C2=A0=C2=A0 cc33xx-fw: install cc33xx firmware
>> =C2=A0=C2=A0 cc33xx-target-scripts: add cc33xx scripts to control TI c=
c33xx WLAN
>> =C2=A0=C2=A0=C2=A0=C2=A0 device
>
>
>
> I don't see an equivalent RFC patch on meta-arago for adding cc33xx FW=20
> & utils.
> In which arago image are we planning to add=C2=A0cc33xx FW & utils?
> Will it be via packagegroup-arago-tisdk-connectivity?
>
>
> Thanks,
> Chirag
>
>
Thanks for taking a look. Yes, my plan was to send another patch on

meta-arago. I was waiting to send this util series as non-RFC before I=20
send patch

for meta-arago. I do plan to add these utils to packagegroup=20
arago-tisdk-connectivity.

Let me know if I should send RFC patch for meta-arago anyways.

>
>>
>> =C2=A0 .../recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb=C2=A0=C2=A0=C2=A0 | =
26 +++++++++++++++++
>> =C2=A0 .../cc33calibrator/cc33calibrator_git.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 24 +++++++++++++++
>> =C2=A0 .../cc33conf/cc33conf_git.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 29 +=
++++++++++++++++++
>> =C2=A0 .../cc33xx-target-scripts.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 22 +=
+++++++++++++
>> =C2=A0 4 files changed, 101 insertions(+)
>> =C2=A0 create mode 100644=20
>> meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb
>> =C2=A0 create mode 100644=20
>> meta-ti-extras/recipes-connectivity/cc33calibrator/cc33calibrator_git.=
bb
>> =C2=A0 create mode 100644=20
>> meta-ti-extras/recipes-connectivity/cc33conf/cc33conf_git.bb
>> =C2=A0 create mode 100644=20
>> meta-ti-extras/recipes-connectivity/cc33xx-target-scripts/cc33xx-targe=
t-scripts.bb
>>
>> --=20
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#17766):=20
>> https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-ti/m=
essage/17766__;!!G3vK!XVCZsOhdbkylBJZIV_gHT-M3ocW9riIlWaQqNt46bx19rVKipjJ=
mFVDi69Q-iuw5AnYOas9MguGKVrQT297bW2SHGJGc9bxj4Qku$
>> Mute This Topic:=20
>> https://urldefense.com/v3/__https://lists.yoctoproject.org/mt/10677431=
1/7030289__;!!G3vK!XVCZsOhdbkylBJZIV_gHT-M3ocW9riIlWaQqNt46bx19rVKipjJmFV=
Di69Q-iuw5AnYOas9MguGKVrQT297bW2SHGJGc9biG5k2l$
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe:=20
>> https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-ti/u=
nsub__;!!G3vK!XVCZsOhdbkylBJZIV_gHT-M3ocW9riIlWaQqNt46bx19rVKipjJmFVDi69Q=
-iuw5AnYOas9MguGKVrQT297bW2SHGJGc9RIWuAVo$=20
>> [c-shilwant@ti.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

