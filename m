Return-Path: <kamlesh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33522E7C4D9
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 16:00:15 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.22365.1696435204759608319
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 Oct 2023 09:00:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=vXDwEMlI;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: kamlesh@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 394G03Ld114384;
	Wed, 4 Oct 2023 11:00:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696435203;
	bh=yU3xRkRmb3Ot6UW+WP3YIOmQAffeXEWtueO/NZ50vHE=;
	h=From:To:CC:Subject:In-Reply-To:References:Date;
	b=vXDwEMlImYuZFjqDBiJk6RE37n6tvPXFJAD0QZRTQUB4BsvAdtwd75x8pVXtQtZxV
	 5AbOoBm/uAWVugA22rsVUJUx0Zo79okbm9PKnr2+Z8DHpxc0/M3zI/LR7NUM2O7bjG
	 aIqQpQ/nPKtAWIgeZ2e6elHCd0TYW/7Jt3qfikB0=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 394G03ck014627
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 Oct 2023 11:00:03 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 4
 Oct 2023 11:00:02 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 4 Oct 2023 11:00:03 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 394G02Nd107458;
	Wed, 4 Oct 2023 11:00:02 -0500
From: Kamlesh Gurudasani <kamlesh@ti.com>
To: "Bajjuri, Praneeth" <praneeth@ti.com>, <vigneshr@ti.com>,
        <u-kumar1@ti.com>, <afd@ti.com>, <m-chawdhry@ti.com>, <reatmon@ti.com>,
        <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>, <vibhore@ti.com>, <vishalm@ti.com>
Subject: Re: [PATCH] trusted-firmware-a: Update to sha fixing deep sleep on
 AM62x
In-Reply-To: <8a935839-1f62-db96-2ee6-c1e01bf0c53b@ti.com>
References: <20231004-atf-bump-lpm-v1-1-66ebc652e365@ti.com>
 <8a935839-1f62-db96-2ee6-c1e01bf0c53b@ti.com>
Date: Wed, 4 Oct 2023 21:30:01 +0530
Message-ID: <87r0mafke6.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 04 Oct 2023 16:00:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17054

"Bajjuri, Praneeth" <praneeth@ti.com> writes:

> On 10/4/2023 10:49 AM, Kamlesh Gurudasani wrote:
>> Update to commit d7a7135d32a8c7da004c0c19b75bd4e2813f9759,
>> which fixes deep sleep bug on AM62x
>
> Thanks for the patch, But is this commit sanity tested across all K3 
> platforms?
Yes, Manorit has sanity tested this on all K3 devices

http://lcpdresults.itg.ti.com/launcher/results/16114

Regards,
Kamlesh

