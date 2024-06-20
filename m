Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFFD2C27C79
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 05:59:18 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.40985.1718863158187317671
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 19 Jun 2024 22:59:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=I5dhMYka;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45K5xFw2070397;
	Thu, 20 Jun 2024 00:59:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718863155;
	bh=ONdVc0kUBVo/cUdH9CLDNowfEDnBZ82UcK4HtXFvugA=;
	h=Date:Subject:To:References:CC:From:In-Reply-To;
	b=I5dhMYkazUkksIGUBfadjrQ8eTr3w9db3HdTA4ikAJzqPmiXo24fwBJusKnKp8FwI
	 /v3atPUNafnhSq9dVGirkfSTi+d/dF+nr/GXP71Chu/IQkJgKQBdXN5xyWk0cBtfjE
	 Iyq4YQAyCMu9mMOxMgmfkuqYAum1bzyRppRcvF3A=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45K5xEdO029243
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Jun 2024 00:59:14 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Jun 2024 00:59:14 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Jun 2024 00:59:14 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45K5xCAC107457;
	Thu, 20 Jun 2024 00:59:13 -0500
Message-ID: <6e132f53-dd85-4108-b9a2-56a0f77b328b@ti.com>
Date: Thu, 20 Jun 2024 11:29:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-ti] [RFC][master/scarthgap][PATCH 0/4] add FW
 and utilities for cc33xx wireless driver
To: <meta-ti@lists.yoctoproject.org>
References: <20240620032202.169122-1-sabeeh-khan@ti.com>
Content-Language: en-US
CC: <sabeeh-khan@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240620032202.169122-1-sabeeh-khan@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 45K5xFw2070397
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 20 Jun 2024 05:59:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17772

Hi Sabeeh,

On 20/06/24 08:51, Sabeeh Khan via lists.yoctoproject.org wrote:
> This series adds FW support, configuration files, and tools to be used=20
> with the cc33xx drivers. The cc33xx driver has been added to TI kernel=20
> 6.=E2=80=8A6 with progress being made for kernel upstreaming. Sabeeh Kh=
an (4):=20
> cc33conf: add new cc33conf tool
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe. If you wish to report this=20
> message to IT Security, please forward the message as an attachment to=20
> phishing@list.ti.com
> ZjQcmQRYFpfptBannerEnd
> This series adds FW support, configuration files, and tools to be used
> with the cc33xx drivers. The cc33xx driver has been added to TI kernel =
6.6
> with progress being made for kernel upstreaming.
>
> Sabeeh Khan (4):
>    cc33conf: add new cc33conf tool for cc33xx devices
>    cc33calibrator: add new cc33calibrator tool for cc33xx devices
>    cc33xx-fw: install cc33xx firmware
>    cc33xx-target-scripts: add cc33xx scripts to control TI cc33xx WLAN
>      device



I don't see an equivalent RFC patch on meta-arago for adding cc33xx FW &=20
utils.
In which arago image are we planning to add=C2=A0cc33xx FW & utils?
Will it be via packagegroup-arago-tisdk-connectivity?


Thanks,
Chirag



>
>   .../recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb    | 26 +++++++++++++++++
>   .../cc33calibrator/cc33calibrator_git.bb      | 24 +++++++++++++++
>   .../cc33conf/cc33conf_git.bb                  | 29 ++++++++++++++++++=
+
>   .../cc33xx-target-scripts.bb                  | 22 ++++++++++++++
>   4 files changed, 101 insertions(+)
>   create mode 100644 meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git=
.bb
>   create mode 100644 meta-ti-extras/recipes-connectivity/cc33calibrator=
/cc33calibrator_git.bb
>   create mode 100644 meta-ti-extras/recipes-connectivity/cc33conf/cc33c=
onf_git.bb
>   create mode 100644 meta-ti-extras/recipes-connectivity/cc33xx-target-=
scripts/cc33xx-target-scripts.bb
>
> --=20
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17766): https://urldefense.com/v3/__https://lists.y=
octoproject.org/g/meta-ti/message/17766__;!!G3vK!XVCZsOhdbkylBJZIV_gHT-M3=
ocW9riIlWaQqNt46bx19rVKipjJmFVDi69Q-iuw5AnYOas9MguGKVrQT297bW2SHGJGc9bxj4=
Qku$
> Mute This Topic: https://urldefense.com/v3/__https://lists.yoctoproject=
.org/mt/106774311/7030289__;!!G3vK!XVCZsOhdbkylBJZIV_gHT-M3ocW9riIlWaQqNt=
46bx19rVKipjJmFVDi69Q-iuw5AnYOas9MguGKVrQT297bW2SHGJGc9biG5k2l$
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.com/v3/__https://lists.yoctoproject.org=
/g/meta-ti/unsub__;!!G3vK!XVCZsOhdbkylBJZIV_gHT-M3ocW9riIlWaQqNt46bx19rVK=
ipjJmFVDi69Q-iuw5AnYOas9MguGKVrQT297bW2SHGJGc9RIWuAVo$  [c-shilwant@ti.co=
m]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

