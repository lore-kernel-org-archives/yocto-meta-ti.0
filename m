Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.171644.1598175625635924688
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 23 Aug 2020 02:40:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=SC6GtF6c;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: lokeshvutla@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07N9eOYK035058
	for <meta-ti@lists.yoctoproject.org>; Sun, 23 Aug 2020 04:40:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1598175624;
	bh=cZOsoY5MrLb9c687L3ebr0d/svYS9Mu89ZV/CnZCFJU=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=SC6GtF6ck8E/0w00REkxsZGuQEMLNgRbW6Tg5y00zC0zEWrKB/zGBdZUyofUmci8d
	 O16i3Hbk98c/SRFst8ohcfUaBEJP8ABIqYhYCOy1VI0laU3l7Y7yRJnu2uUZ6YjwKL
	 9MWPTFD8PbHNHIpxsqwtFP/vlw8UtwcCA+1nio08=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07N9eNEB022863
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Sun, 23 Aug 2020 04:40:23 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sun, 23
 Aug 2020 04:40:23 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sun, 23 Aug 2020 04:40:23 -0500
Received: from [10.24.69.20] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07N9eKnA101474;
	Sun, 23 Aug 2020 04:40:21 -0500
Subject: Re: [PATCH 1/3] prueth-hsr/prp: Update hsr/prp firmwares to latest
To: Denys Dmytriyenko <denys@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Sekhar Nori <nsekhar@ti.com>,
        <m-erdahl@ti.com>, <m-karicheri2@ti.com>
References: <20200821073238.18926-1-lokeshvutla@ti.com>
 <20200821073238.18926-2-lokeshvutla@ti.com> <20200821184002.GJ29812@beryl>
From: "Lokesh Vutla" <lokeshvutla@ti.com>
Message-ID: <549e7999-cf7a-d7b6-7b69-0f436c7e71e7@ti.com>
Date: Sun, 23 Aug 2020 15:10:20 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200821184002.GJ29812@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Denys,

On 22/08/20 12:10 am, Denys Dmytriyenko wrote:
> On Fri, Aug 21, 2020 at 01:02:36PM +0530, Lokesh Vutla wrote:
>> Update the hsr/prp firmwares to latest that includes support for
>> timestamping rx packets. Unfortunately version number is not
>> incremented for this update.
>>
>> Also rename the bb file to add PV in it.
> 
> This is fine, but you need to choose which one provides the correct PV. 
> Currently you have it duplicated:
> 
> pruhsr-fw_2.15.23.bb will set PV = "2.15.23" automatically from the filename, 
> but you also have existing PV = "2.15.23" inside the recipe. Same for other 
> recipe.
> 
> The recommendation is to set PV in the filename for released tarballs.
> 
> When the code is pulled directly from git, it is acceptable (and sometimes 
> even preferred) to use _git in the filename and set PV explicitly inside the 
> recipe. And if you expect these to be updated regularly, you can avoid churn 
> of renaming the recipe with the new version. Also that's preferred for 
> packages (probably not in this case) that need to be AUTOREV-ed to the latest 
> for any nightly CI atuomation...

Thanks for the explanation. Will remove the duplicate inside the FILE. Also what
about PE and PR?

Thanks and regards,
Lokesh

> 
