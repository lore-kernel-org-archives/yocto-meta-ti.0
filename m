Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 357E6C27C5E
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 04:20:59 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.12053.1717993251863546814
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 09 Jun 2024 21:20:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jO7UuqRn;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: m-chawdhry@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45A4Kpp6121183
	for <meta-ti@lists.yoctoproject.org>; Sun, 9 Jun 2024 23:20:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717993251;
	bh=dFjm3kKcLVOmoauwlYM1QiJkraZPmFjcvbtYfuYOwKE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=jO7UuqRnaF2ipTwh5By3bZb4kPSdEYOoLjmo8f4io5H7zakFXV5IgNpfH9X9uTD1T
	 ojb2LQrlQuSUZSGeAV2qMFLTA0fEIwYC+4VP0r5ZQqjltsk/Oi2XHZBQpTJ786IZUk
	 06kXEwsYv/khlVaEaHm+HptWCGBRStoGsR/aOBkI=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45A4KpoC017967
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Sun, 9 Jun 2024 23:20:51 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 9
 Jun 2024 23:20:50 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 9 Jun 2024 23:20:50 -0500
Received: from localhost (uda0497581.dhcp.ti.com [10.24.68.185])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45A4Ko22097982;
	Sun, 9 Jun 2024 23:20:50 -0500
Date: Mon, 10 Jun 2024 09:50:49 +0530
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: "Kumar, Udit" <u-kumar1@ti.com>
CC: Aniket Limaye <a-limaye@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <reatmon@ti.com>
Subject: Re: [meta-ti][master/scarthgap][PATCH] conf: machine: add AM68-SK
 machine configuration
Message-ID: <20240610042049.hqtgan3g5hgiztsp@uda0497581>
References: <20240603125605.3796069-1-a-limaye@ti.com>
 <d4706965-c77f-40cc-b853-ffcac700d194@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d4706965-c77f-40cc-b853-ffcac700d194@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 10 Jun 2024 04:20:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17716

Hi Udit,

On 23:37-20240607, Kumar, Udit wrote:
> 
> On 6/3/2024 6:26 PM, Aniket Limaye wrote:
> > As of commit [1] there will be a separate defconfig to build u-boot
> > for j721s2-evm and am68-sk.
> > 
> > Hence, introduce new yocto machine configs for am68-sk. This is done
> > through a new am68.inc file as the am68-sk platform does not support GP.
> > So j721s2-evm.inc is copied to am68.inc and updated accordingly.
> > 
> > [1]: https://source.denx.de/u-boot/u-boot/-/commit/a96be9b8c05ea835d27f7c9bae03279b8bd5dcf2
> > 
> > Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> > ---
> > [...]
> > +OPTEEMACHINE = "k3-j784s4"
> 
> j784s4 ?
> 

OPTEE of j721s2 uses j784s4 config as both the configurations are same
but j784s4 config got added in OP-TEE before j721s2.

Regards,
Manorit

> 
> > +
> > +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cadence-mhdp-fw cnm-wave-fw"

