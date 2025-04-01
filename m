Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B8CC36017
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 17:57:34 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.106.1743530248177882102
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 01 Apr 2025 10:57:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=aKtOiJ9w;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 531HvOOU3702393
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 1 Apr 2025 12:57:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743530244;
	bh=9fjDLq7mG8TmVZtnX7MsPpOtdjdFrS23A7/NWTrps70=;
	h=Date:Subject:From:To:References:In-Reply-To;
	b=aKtOiJ9wtoBAilNUeRFiv+M8+QUNonhtxO8g+NeRwexRBRUQAx0SK5P/tChzXMcI+
	 yWsQtMhGU7UtWYJddQPBLFjeH6PYtN26S1b/jdZ5GVpD5mCC6RzrQ+A+HX8QxbOSh8
	 CXZmTEVqQHZ4YsUrjMgB8BnaGP0JWuEIBvWLvE+I=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 531HvOPt033680;
	Tue, 1 Apr 2025 12:57:24 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 1
 Apr 2025 12:57:23 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 1 Apr 2025 12:57:23 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 531HvNK9081228;
	Tue, 1 Apr 2025 12:57:23 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 1 Apr 2025 12:57:23 -0500
Message-ID: <D8VHW0FO7DYK.1QURC4QTQ4QRW@ti.com>
Subject: Re: [meta-ti] Postinstall scriptlets of ['ti-sgx-ddk-um'] have
 failed.
From: Randolph Sapp <rs@ti.com>
To: <sebastian.krahl@lacon.de>, <meta-ti@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <8404.1743410272291654232@lists.yoctoproject.org>
 <16009.1743500207260580759@lists.yoctoproject.org>
In-Reply-To: <16009.1743500207260580759@lists.yoctoproject.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 01 Apr 2025 17:57:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18443

On Tue Apr 1, 2025 at 4:36 AM CDT, Sebastian via lists.yoctoproject.org wro=
te:
> I've applied the patch and it builds without any additional error.
>
> Thanks for that.
>
> But how to proceed? I'm not happy with the modification of an included la=
yer...
>
> Regards,
>
> Sebastian

It's being picked up in newer branches. Unfortunately you'll have to wait f=
or a
newer release as we typically don't backport patches.

