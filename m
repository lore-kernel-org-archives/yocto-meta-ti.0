Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7CACC38142
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 23:07:31 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.1791.1674860846007420729
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 27 Jan 2023 15:07:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=PAwkhosg;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30RN7Pk4085209
	for <meta-ti@lists.yoctoproject.org>; Fri, 27 Jan 2023 17:07:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674860845;
	bh=INkoVICTKAOPnpc51tMq1eAkWDk+xJtGXnVElfx3Ze8=;
	h=Date:From:Subject:To:CC:In-Reply-To:References;
	b=PAwkhosgDoxHv6JinZRK6dw6RvWqwLgoGtw/12I0OiivLFTJfEiWw7+hF9R1vcskN
	 kZv//OpNUMSNxXm8iPR4Rhlc56ZW9cYuAmW4Yndamr3x43thPp2yNuDJYSNTgp8sVq
	 792IZpvCuTHFSm92gmJuaipXL05MxeJXxcaMeNpM=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30RN7P6M067442
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 27 Jan 2023 17:07:25 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 27
 Jan 2023 17:07:24 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 27 Jan 2023 17:07:24 -0600
Received: from res.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30RN7OUX022632;
	Fri, 27 Jan 2023 17:07:24 -0600
Date: Fri, 27 Jan 2023 17:07:19 -0600
From: "Sapp, Randolph" <rs@ti.com>
Subject: Re: [PATCH] meta-ti-extras: ti-unpack: Drop update_data call
To: Ryan Eatmon <reatmon@ti.com>
CC: <denys@ti.com>, <afd@ti.com>, <meta-ti@lists.yoctoproject.org>
Message-ID: <7W26PR.GR323TWM8Z333@ti.com>
In-Reply-To: <eb4f4eaf-9e37-969c-c4aa-0c583d146f65@ti.com>
References: <20230127180217.1760815-1-rs@ti.com>
	<b0f1c107-cc8f-9ec1-d6fa-6b8dda3402a3@ti.com> <Q2Z5PR.AUJI9LV2CCA42@ti.com>
	<eb4f4eaf-9e37-969c-c4aa-0c583d146f65@ti.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Jan 2023 23:07:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15695

On Fri, Jan 27 2023 at 03:48:58 PM -0600, Ryan Eatmon <reatmon@ti.com> 
wrote:
> On 1/27/2023 15:44, Sapp, Randolph wrote:
>> On Fri, Jan 27 2023 at 12:12:55 PM -0600, Ryan Eatmon 
>> <reatmon@ti.com> wrote:
>>> This change was already made on the master branch back in November 
>>> to address this issue.  Are you seeing this on other branches?  I 
>>> do not believe that this patch needs to be applied to dunfell or 
>>> kirkstone unless you are seeing an issue.
>> 
>> I saw this issue under kirkstone with the latest version of my GPU 
>> patch for meta-ti and meta-arago.
> 
> They must have back ported it.

Whoops, I was tracking bitbake main. Kirkstone doesn't appear to have 
that commit yet. Still, there should be no reason to call update_data 
as it is a deprecated function and a NOOP. Entirely up to you whether 
you want to take this, I don't care.



