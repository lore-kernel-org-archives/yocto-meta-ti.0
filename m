Return-Path: <kamlesh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30ABACF07D9
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 08:58:48 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.39072.1728550723818074651
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 10 Oct 2024 01:58:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jwlBd2nG;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: kamlesh@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49A8weKw107158;
	Thu, 10 Oct 2024 03:58:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728550720;
	bh=6abnm3VlD4jdRSv8m/pL7958iuvLPpHkCko/gOrMshU=;
	h=From:To:CC:Subject:In-Reply-To:References:Date;
	b=jwlBd2nGsK04410Hhe5bmTQ54ZLe88A4+CPvwBsdwALHAR9saoWyaV5zASVu60y1Y
	 8IxycPX/NYUMj22NGmXIqYqGsW1d1ALBfg52nmNmKt4ZD9NFSs+hAwY7R0Snrd/I+p
	 pgj0TcuEmbELxlM1BdkXCrCoWMmQde1hqz94c7cE=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49A8weIX029300
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Oct 2024 03:58:40 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 10
 Oct 2024 03:58:40 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 10 Oct 2024 03:58:40 -0500
Received: from localhost (kamlesh.dhcp.ti.com [172.24.227.123])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49A8wdtm099603;
	Thu, 10 Oct 2024 03:58:39 -0500
From: Kamlesh Gurudasani <kamlesh@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] optee: Update to v4.3.0
In-Reply-To: <20241008190602.GI14676@denix.org>
References: <20241004190825.24897-1-reatmon@ti.com>
 <20241008190602.GI14676@denix.org>
Date: Thu, 10 Oct 2024 14:28:38 +0530
Message-ID: <87ed4ol4g1.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 10 Oct 2024 08:58:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18003

"Denys Dmytriyenko" <denis@denix.org> writes:

> I was wondering if OPTEE and TFA should also be made BSP-aware. Maybe even 
> SYSFW and/or other FWs.
>
> How much backward compatibility is ensured and tested here? Will 4.3.0 version 
> here work with BSP 6.1?
https://github.com/OP-TEE/optee_os/issues/6751#issuecomment-1997399489

In general, OP-TEE is backward compatible with Linux and vice versa,
if it is not, its a bug.

Ideally, BSP 6.1 should work with 4.3 OP-TEE, but we need to test.

Will give you the data if anything needs to be locked next week.

Kamlesh

