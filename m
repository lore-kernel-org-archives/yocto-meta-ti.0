Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2BEEC433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 14:33:16 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.10235.1647613994746002356
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 07:33:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=TBpin0jY;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22IEXCb4109523
	for <meta-ti@lists.yoctoproject.org>; Fri, 18 Mar 2022 09:33:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647613992;
	bh=FTcrPvJrFhC7B3nzAXQUCqcHE5FSg/w5Twh6Lzbl/4M=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=TBpin0jYvFZYDenV30a7fc+99EivwEf8mUKqmfUTttvUpzzrmvjjEBYFITyU6KRd1
	 iQW19eRKBFMk7bRMHRGoRriu1S7p3mnjdGCIrg6huPjdbYsKrE8CahPTUVN/yg0ZrE
	 tZMDLDzb247I563y8px4VE+9/VNklxBbrSSvUaog=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22IEXChp007756
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 18 Mar 2022 09:33:12 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 18
 Mar 2022 09:33:12 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 18 Mar 2022 09:33:12 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22IEXCfB059188;
	Fri, 18 Mar 2022 09:33:12 -0500
Date: Fri, 18 Mar 2022 09:33:12 -0500
From: Nishanth Menon <nm@ti.com>
To: <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] Patchwork
Message-ID: <20220318143312.hkgy3a3yekrfj7sp@roping>
References: <23cbe0c3-130e-c00a-a069-f39d8cef1f45@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <23cbe0c3-130e-c00a-a069-f39d8cef1f45@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 18 Mar 2022 14:33:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14512

On 15:55-20220315, Ryan Eatmon via lists.yoctoproject.org wrote:
> 
> All,
> 
> We are using the new Yocto Project Patchwork server to track the state of
> patches sent to this mailing list.  If you would like to know the status of
> a given patch, you may query the project at:
> 
> https://patchwork.yoctoproject.org/project/ti/list/


There is also a public-inbox in kernel.org now at https://lore.kernel.org/yocto-meta-ti/

Thanks Denys and yoctoproject team for all the work in making this
happen.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

