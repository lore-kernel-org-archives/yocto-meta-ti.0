Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED46C43334
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 15:04:29 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.85166.1657033466920482460
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 05 Jul 2022 08:04:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=fsyGqa6k;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 265F4Koc089208;
	Tue, 5 Jul 2022 10:04:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1657033460;
	bh=awnLXlcrLoGzjcVHgEtaOioYq54ed/3jH4nt2fufIj4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fsyGqa6kh8zwkLw6Zja5nY6kZ1R7PC+T9cPkbxyZkv8s2J9FcwVYAhXWqMQY1mzSv
	 HPijSzotL6PMpNeGVJMSY7mV27VSR8b9r9UFR/yLRV3NFfSaV2wdfpdC3dpFd8grnO
	 vOh6Tg/Y80fCOVSLuMbqbuMmfpVP8vAjwcSfs6L4=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 265F4K2w008375
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 5 Jul 2022 10:04:20 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 5
 Jul 2022 10:04:20 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 5 Jul 2022 10:04:19 -0500
Received: from [10.250.33.129] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 265F4JhX028973;
	Tue, 5 Jul 2022 10:04:19 -0500
Message-ID: <1075c15d-c6d6-ec82-57f9-1b8ff3fd4fdd@ti.com>
Date: Tue, 5 Jul 2022 10:04:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [meta-ti][dunfell][RFC 2/6] ti-sci-fw: Use new SOC_TYPE and
 SYSFW_DIR to simplify recipe
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20220701220228.5449-1-afd@ti.com>
 <20220701220228.5449-3-afd@ti.com> <20220702223052.GB18692@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20220702223052.GB18692@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 05 Jul 2022 15:04:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14872

On 7/2/22 5:30 PM, Denys Dmytriyenko wrote:
> Please lower the similarity threshold so the change shows as a diff and not
> just remove/add. Thanks!
> 
> 

Oops, completely forgot that git does that sometimes, will fix for v2.

Thanks,
Andrew

