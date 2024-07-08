Return-Path: <s-vadapalli@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CB7BC3271E
	for <webhook@archiver.kernel.org>; Mon,  8 Jul 2024 05:47:36 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.73585.1720417652241358883
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 07 Jul 2024 22:47:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=UapBhqBu;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: s-vadapalli@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4685lTkM100468;
	Mon, 8 Jul 2024 00:47:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1720417649;
	bh=GU0t3PYPMXr+pDpwd14fbOirQWQlBDncsvZZxFViZ9A=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=UapBhqBuRKhuTyMfnIeMBLyYYOKBNzNPy/xuT0tIjxQzJTXCnE/fs11NGf69E2jE4
	 HDJqy6/XcpkgcsjKkW5gLmuKv/dJuINisYA/3a3R/LrevCiLsJ0NZT0prLjykfKoNW
	 ahBt/AHylrhmHOrEotG5EKThW9/6cGEHe5jToORs=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4685lTYw090280
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Jul 2024 00:47:29 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 8
 Jul 2024 00:47:28 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 8 Jul 2024 00:47:28 -0500
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4685lRSU068426;
	Mon, 8 Jul 2024 00:47:28 -0500
Date: Mon, 8 Jul 2024 11:17:27 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <reatmon@ti.com>,
        <praneeth@ti.com>, <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>, <c-shilwant@ti.com>,
        <danishanwar@ti.com>, <srk@ti.com>
Subject: Re: [meta-ti][scarthgap][PATCH] conf: machine: am62*: apply config
 fragments for enabling USB DFU
Message-ID: <779f74aa-c451-45a8-8384-0ba23f416ac2@ti.com>
References: <20240708052457.1974547-1-s-vadapalli@ti.com>
 <829dc5b5-e87c-4679-9e2d-7417c744a9c9@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <829dc5b5-e87c-4679-9e2d-7417c744a9c9@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 4685lTkM100468
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 08 Jul 2024 05:47:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17827

On Mon, Jul 08, 2024 at 11:10:34AM +0530, Vignesh Raghavendra wrote:
>=20
>=20
> On 08/07/24 10:54, Siddharth Vadapalli wrote:
> > The config fragments "am62x_r5_usbdfu.config" and "am62x_a53_usbdfu.c=
onfig"
>=20
> am62*x_evm_a53_defconfig already include am62x_a53_usbdfu.config:
>=20
> ti-u-boot-2024.04-next =E2=9C=93 git grep am62x_a53_usbdfu.config
> configs/am62ax_evm_a53_defconfig:136:#include <configs/am62x_a53_usbdfu=
.config>
> configs/am62px_evm_a53_defconfig:194:#include <configs/am62x_a53_usbdfu=
.config>
> configs/am62x_beagleplay_a53_defconfig:123:#include <configs/am62x_a53_=
usbdfu.config>
> configs/am62x_evm_a53_defconfig:147:#include <configs/am62x_a53_usbdfu.=
config>
>=20
>=20
> so no need to build a separate tispl.bin / u-boot.img with fragement re=
applied?

Yes! Thank you for pointing it out. Also, since am62x_lpsk_a53_defconfig
includes am62x_evm_a53_defconfig, the change to am62xx-lp-evm.conf can
be dropped. I will fix this in the v2 patch.

Regards,
Siddharth.

