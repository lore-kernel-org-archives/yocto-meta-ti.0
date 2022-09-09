Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 790EAECAAA1
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 16:45:47 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.134.1662741944351797909
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 09 Sep 2022 09:45:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=HNoG8uLK;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 289Gjh1L084865
	for <meta-ti@lists.yoctoproject.org>; Fri, 9 Sep 2022 11:45:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1662741943;
	bh=7rlyIwsOBEnjJEyR+wc+lLWErT4Ff/lpqaGkBp0bQEU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=HNoG8uLKLjSCXuc16C2FKeXAvGkwy4PmHfkrIYVvYsFVEp2pHQTdJ8PiodnkfMLWL
	 FKj/d536sFwqWk02D0SuWUhLXCHcAG3/SVYZHolarjJS7s7Hqe6QrApyRWzgjdAHrP
	 rJGdopXxIjQNtelK68VAUnMr+YkM1NuSmDHSEeXo=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 289Gjh78044474
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 9 Sep 2022 11:45:43 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Fri, 9 Sep
 2022 11:45:43 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Fri, 9 Sep 2022 11:45:43 -0500
Received: from [10.250.33.246] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 289GjgbV100530;
	Fri, 9 Sep 2022 11:45:42 -0500
Message-ID: <9ec2c1b8-becd-086c-fac8-28035c82c4d5@ti.com>
Date: Fri, 9 Sep 2022 11:45:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [meta-ti] [dunfell][PATCH] ti-sci-fw: Use d.getVar() in DEPENDS
 expression
Content-Language: en-US
To: "Sapp, Randolph" <rs@ti.com>
CC: <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20220902201247.605908-1-rs@ti.com>
 <6015a645-b1ea-c87c-2b1e-00870118dea1@ti.com> <13BYHR.0IQPEKD6T7ZE3@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <13BYHR.0IQPEKD6T7ZE3@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 09 Sep 2022 16:45:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15016

On 9/9/22 11:28 AM, Sapp, Randolph wrote:
> On Tue, Sep 6, 2022 at 13:37, Andrew Davis <afd@ti.com> wrote:
>> I had originally done it this way (just due to copy/paste from elsewhere), but
>> couldn't think of a case that would cause mangling, do you have an example?
> 
> Ah, sorry. I didn't actually spend the time to see if it was actually mangling from the variable or just Yocto moving away from this notation and python choking on the un-expanded variable.
> 
> https://docs.yoctoproject.org/dunfell/ref-manual/migration-2.1.html?highlight=d+getvar#variable-expansion-in-python-functions
> 
> 

I see, well if Yocto is moving away they must be doing it
for a good reason, so all good here.

Andrew

