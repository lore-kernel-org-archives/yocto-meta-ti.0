Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD7EAC433FE
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 17:44:00 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.207.1665596631394062014
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Oct 2022 10:43:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=sVxLT2J6;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29CHhjiv023797;
	Wed, 12 Oct 2022 12:43:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665596625;
	bh=hYENhy8iNQgPXoUIKOKxWM6e7afaVpr3s4O2ISzhoXs=;
	h=Date:From:Subject:To:CC:In-Reply-To:References;
	b=sVxLT2J6mWH4bvNxaO0mHO7sKl8p5LbTQyFaT6ebN/kgKZgZTcaG4XgstjrwJEY7g
	 M6kQv+KSPdlXYSn7XKjPessf9pxPcA/01jAH5PTeBFer4XORgbreJPKvATZhLI2kQo
	 5qg/gm9WGcqCp29t/H85dux60s+EaSuvF139Efxc=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29CHhjgQ063876
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Oct 2022 12:43:45 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 12
 Oct 2022 12:43:45 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Wed, 12 Oct 2022 12:43:45 -0500
Received: from res.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29CHhiwJ023187;
	Wed, 12 Oct 2022 12:43:44 -0500
Date: Wed, 12 Oct 2022 12:43:39 -0500
From: "Sapp, Randolph" <rs@ti.com>
Subject: Re: [EXTERNAL] Re: [EXTERNAL] Re: [meta-ti] [dunfell][PATCH]
 ti-img-rogue-*: Bump the graphics recipes
To: Denys Dmytriyenko <denis@denix.org>
CC: <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
Message-ID: <RKINJR.QAL4866ARIQE1@ti.com>
In-Reply-To: <20221012172810.GF22689@denix.org>
References: <20221006234108.1696865-1-rs@ti.com>
	<20221011014403.GG30861@denix.org> <7YXLJR.BJWKMOUWUVN01@ti.com>
	<20221011231649.GE22689@denix.org> <VAFNJR.UICQIQVLHTVW2@ti.com>
	<20221012172810.GF22689@denix.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Oct 2022 17:44:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15160

Ah, alright, so should I just add the following link to the commit 
message then?
https://git.ti.com/cgit/graphics/ti-img-rogue-umlibs/commit/?h=linuxws/dunfell/k5.10/1.15.6133109_unified_fw_pagesize&id=5977e82b96028f783d39c7219f016c1faf8dc5f5

Sorry, I didn't see a good example of this in the history. Almost all 
the commits I can find just indicate that they changed the SRCREV or 
bumped a version for an SDK release.



