Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.9451.1628697535508585607
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Aug 2021 08:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=MzYY+hk8;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nikhil.nd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17BFwsGh094962
	for <meta-ti@lists.yoctoproject.org>; Wed, 11 Aug 2021 10:58:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1628697534;
	bh=4ZSARYA7sXmYAMChSVgSiZamhSwln5R+fD9g5DWRjjQ=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=MzYY+hk8cg4W7SuTsy+5PcPLcZXxdiovUNjJtcEInbnAz8QpYi82kcIwmUS0mEnLi
	 4r+bw6VU8gPt0xXJFSQ2FDmuCAS9pVzfETEluBipLhgRE1BDrayn/CFTygjtYjjI86
	 h+QPzGmCVT5lqIqmLA8iTmUq/Mmf7XEilFHZh62o=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17BFwsNs041297
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 11 Aug 2021 10:58:54 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 11
 Aug 2021 10:58:54 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 11 Aug 2021 10:58:54 -0500
Received: from [10.250.229.173] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17BFwqG2096365
	for <meta-ti@lists.yoctoproject.org>; Wed, 11 Aug 2021 10:58:53 -0500
Subject: Re: [meta-ti] [master][PATCH v3] meta-ti: convert to new override syntax in honister
To: <meta-ti@lists.yoctoproject.org>
References: <1628637446-35725-1-git-send-email-denis@denix.org>
From: "Nikhil Devshatwar" <nikhil.nd@ti.com>
Message-ID: <287ae2ec-e682-a561-fd29-00bae48d2ff1@ti.com>
Date: Wed, 11 Aug 2021 21:28:52 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1628637446-35725-1-git-send-email-denis@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit


Denys,

On 11/08/21 4:47 am, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> Upcoming "honister" release changes the override syntax to improve usability,
> speed and memory footprint. Update recipes with the new syntax and set layer
> compatibility to honister.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> Tested-by: Paul Barker <paul.barker@sancloud.com>
> ---
> v3:
> makefile_armv7 is a false-positive and shouldn't be converted
> pick up Paul's Tested-by: from v2

To do all the override changes without any human errors,
is there a tool/script that you used? OR was it done manually?
Please share how this can be done for other layers as well.

Regards,
Nikhil D
