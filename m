Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 465C5C05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 22:37:56 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.88786.1674772674962365111
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Jan 2023 14:37:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=rJ+tsSyQ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30QMboLn118616;
	Thu, 26 Jan 2023 16:37:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674772670;
	bh=3jvpeuxqqbFbCxVAlfx96BspEns77ULccmnt+sj0EXk=;
	h=Date:From:Subject:To:CC:In-Reply-To:References;
	b=rJ+tsSyQuoZoEBrbsU9v39hAmHnJseqawOWxUtm3wq92NgbMURB2TluVupctuH8kI
	 6yQBKxBMjZSDSOdl3T8cQz1/+Hq4h9l4MNZtuO5/HZQtN97jN3fiZ3cbbRLnLzeVvP
	 JFrmT8iEmoX1Sfl5a+Ci2Tn9BXFWLUInljKkzRt4=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30QMborF041225
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 26 Jan 2023 16:37:50 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 26
 Jan 2023 16:37:50 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 26 Jan 2023 16:37:50 -0600
Received: from res.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30QMbng1114961;
	Thu, 26 Jan 2023 16:37:49 -0600
Date: Thu, 26 Jan 2023 16:37:44 -0600
From: "Sapp, Randolph" <rs@ti.com>
Subject: Re: [EXTERNAL] Re: [meta-ti] [kirkstone PATCH 1/4] meta-ti-bsp: mesa:
 Add current patches
To: Denys Dmytriyenko <denis@denix.org>
CC: <afd@ti.com>, <denys@ti.com>, <reatmon@ti.com>, <detheridge@ti.com>,
        <meta-ti@lists.yoctoproject.org>, <k-bhargav@ti.com>
Message-ID: <WU64PR.Z83RZ7R0JR5O1@ti.com>
In-Reply-To: <20230126204804.GD22689@denix.org>
References: <20230126030834.3889448-1-rs@ti.com>
	<20230126030834.3889448-2-rs@ti.com>
	<f3ec2279-5ce9-af82-82ac-8d7170e3dbe9@ti.com>
	<20230126204804.GD22689@denix.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Jan 2023 22:37:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15687

On Thu, Jan 26 2023 at 03:48:04 PM -0500, Denys Dmytriyenko 
<denis@denix.org> wrote:
> On Thu, Jan 26, 2023 at 11:06:17AM -0600, Andrew Davis via 
> lists.yoctoproject.org wrote:
>>  On 1/25/23 9:08 PM, Randolph Sapp wrote:
>>  >Copy over current patches from oe-core for mesa since we're going 
>> to be
>>  >overriding the SRC_URI string and we still need those.
>>  >
>> 
>>  We control the repo we will be pointing at, I'd say just add these
>>  patches over there directly so this commit would be not needed.
> 
> No, these are upstream mesa patches, not the one needed for pvr.
> 
> Hence, you don't need to carry them locally, since you don't copy the 
> entire
> upstream mesa recipe.

Ah, but we do need to carry them since we clobber the mesa SRC_URI to 
load our new source. Now, yes, these should probably be carried in our 
mesa branch instead of in meta-ti. I'll adjust that.



