Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FEEEC00140
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 15:58:55 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.67.1660147131843638205
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 10 Aug 2022 08:58:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=K9N3Hz5s;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27AFwnpE130381;
	Wed, 10 Aug 2022 10:58:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1660147129;
	bh=LiclgUy3MgEcwh4hnu2sksHg/fT9aAsNaMZjBMNgYcY=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=K9N3Hz5saOH58ew6wTEKkDejqN3uki5YE4z76NFDXQD7pCjTxJxZdod0yx2Zazjcy
	 Em8W+d0apW1Wt3b3L+XQJFDTqtvM3zrMul9w3DBaVakxYnNyUmnZ6rdLE23oiz1ra/
	 HYGzA7qOHfABD4D/MVCE3SRlEUbVbZPKEfNM3sx0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27AFwnGm098990
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 10 Aug 2022 10:58:49 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 10
 Aug 2022 10:58:48 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 10 Aug 2022 10:58:48 -0500
Received: from [10.249.39.108] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 27AFwm5c045203;
	Wed, 10 Aug 2022 10:58:48 -0500
Message-ID: <e01176e5-f142-b877-e8e1-8476a25b9be5@ti.com>
Date: Wed, 10 Aug 2022 10:58:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [meta-ti][dunfell][PATCH 1/2] ti-sci-fw: Allow build to continue
 without TI_SECURE_DEV_PKG set
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20220810144708.14171-1-afd@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220810144708.14171-1-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 10 Aug 2022 15:58:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14942



On 8/10/2022 9:47, Andrew Davis wrote:
> If we do not have TI_SECURE_DEV_PKG set then SYSFW generation will fail
> if we are building for the HS platform. When TI_SECURE_DEV_PKG is not
> set we assume the builder is only interested in the GP boards, so fake
> generating the HS SYSFW images. These will be non-functional on HS
> boards, but they would have been just as non-functional if built
> without TI_SECURE_DEV_PKG set.


Have you tested what happens if they do not have it set and build the 
"dummy" files, and then realize their mistake, set the variable and 
build again?  Do the files then build correctly, or does the sstate 
cache prevent them from getting the correct thing without clearing the 
cache and rebuilding everything?




-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

