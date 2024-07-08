Return-Path: <vigneshr@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12706C3271E
	for <webhook@archiver.kernel.org>; Mon,  8 Jul 2024 05:40:46 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.73510.1720417242285849105
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 07 Jul 2024 22:40:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=S8U73a3v;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: vigneshr@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4685ecvY099126;
	Mon, 8 Jul 2024 00:40:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1720417238;
	bh=dAwNg4H1zWjxM2zulOHOa3CfIdhtc5QPaC0dZAmXOP0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=S8U73a3vlHP8Pw40rqd0Nv48wGFGwQBrJmi/80K6XJz9HXpeFGbq4GTH3Kr7coQHf
	 QmvbKIoiWY3XO43Yym0visXk3NjvzIbUHAbS8QYXWosQsK5SbB3UFTNyLJ3CbF4tVt
	 H+iyQ4HPs+DtvO2IiE/Q16UTaz/P0Evx+1CxH6wY=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4685ecte000906
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Jul 2024 00:40:38 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 8
 Jul 2024 00:40:38 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 8 Jul 2024 00:40:38 -0500
Received: from [172.24.227.94] (uda0132425.dhcp.ti.com [172.24.227.94])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4685eZAM058884;
	Mon, 8 Jul 2024 00:40:36 -0500
Message-ID: <829dc5b5-e87c-4679-9e2d-7417c744a9c9@ti.com>
Date: Mon, 8 Jul 2024 11:10:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH] conf: machine: am62*: apply config
 fragments for enabling USB DFU
To: Siddharth Vadapalli <s-vadapalli@ti.com>, <reatmon@ti.com>,
        <praneeth@ti.com>, <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
CC: <c-shilwant@ti.com>, <danishanwar@ti.com>, <srk@ti.com>
References: <20240708052457.1974547-1-s-vadapalli@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20240708052457.1974547-1-s-vadapalli@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 4685ecvY099126
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 08 Jul 2024 05:40:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17826



On 08/07/24 10:54, Siddharth Vadapalli wrote:
> The config fragments "am62x_r5_usbdfu.config" and "am62x_a53_usbdfu.con=
fig"

am62*x_evm_a53_defconfig already include am62x_a53_usbdfu.config:

ti-u-boot-2024.04-next =E2=9C=93 git grep am62x_a53_usbdfu.config
configs/am62ax_evm_a53_defconfig:136:#include <configs/am62x_a53_usbdfu.c=
onfig>
configs/am62px_evm_a53_defconfig:194:#include <configs/am62x_a53_usbdfu.c=
onfig>
configs/am62x_beagleplay_a53_defconfig:123:#include <configs/am62x_a53_us=
bdfu.config>
configs/am62x_evm_a53_defconfig:147:#include <configs/am62x_a53_usbdfu.co=
nfig>


so no need to build a separate tispl.bin / u-boot.img with fragement reap=
plied?

[...]

--=20
Regards
Vignesh

