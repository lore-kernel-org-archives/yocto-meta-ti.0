Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA0D7C05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 23:46:06 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.90241.1674776764426377654
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Jan 2023 15:46:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=RuC6aWEq;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30QNjxck044902;
	Thu, 26 Jan 2023 17:45:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674776759;
	bh=MWaZYTpOK79Wtj9Cgl2BiWqiANJktbfz60v02zZL26A=;
	h=Date:From:Subject:To:CC:In-Reply-To:References;
	b=RuC6aWEqfTZeT2s0XuFD7d1SJr0r7ToeRi0Mr15kqn7wq8a/hHb1o33ir3q04zZKb
	 hxfQvqCubNpf/6X6vH7LQ0mCTufV4qNeU3m+EFJ5OxUyOhID1bMsEZee+8nil4LLFQ
	 fnR8eyUOmzVnK1AkvppoKKJb4g5mJ7TRdYchUXUI=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30QNjxYY021698
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 26 Jan 2023 17:45:59 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 26
 Jan 2023 17:45:59 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 26 Jan 2023 17:45:59 -0600
Received: from res.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30QNjwRw039996;
	Thu, 26 Jan 2023 17:45:58 -0600
Date: Thu, 26 Jan 2023 17:45:53 -0600
From: "Sapp, Randolph" <rs@ti.com>
Subject: Re: [EXTERNAL] Re: [EXTERNAL] Re: [meta-ti] [kirkstone PATCH 1/4]
 meta-ti-bsp: mesa: Add current patches
To: Denys Dmytriyenko <denis@denix.org>
CC: <afd@ti.com>, <denys@ti.com>, <reatmon@ti.com>, <detheridge@ti.com>,
        <meta-ti@lists.yoctoproject.org>, <k-bhargav@ti.com>
Message-ID: <H0A4PR.JU6T1KUC0Z6J1@ti.com>
In-Reply-To: <20230126230209.GF22689@denix.org>
References: <20230126030834.3889448-1-rs@ti.com>
	<20230126030834.3889448-2-rs@ti.com>
	<f3ec2279-5ce9-af82-82ac-8d7170e3dbe9@ti.com>
	<20230126204804.GD22689@denix.org> <WU64PR.Z83RZ7R0JR5O1@ti.com>
	<20230126230209.GF22689@denix.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Jan 2023 23:46:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15690

On Thu, Jan 26 2023 at 06:02:09 PM -0500, Denys Dmytriyenko 
<denis@denix.org> wrote:
> So, specifically:
> 
> 1. No, you don't need to carry patches locally when they are already 
> alongside
> the original .bb recipe, when you are doing a .bbappend
> 
> 2. You don't need to merge them to your own tree, as long as you 
> specify them
> in the SRC_URI list, when using a .bbappend

Huh, the more you know. Alright, we'll keep them out of our tree then 
and I'll drop the commit in the next revision.

(I was already hesitant to add yocto patches to our stuff since right 
now it's pretty distro agnostic and Yocto often adds extra parameters 
to packages specifically for their build system.)



