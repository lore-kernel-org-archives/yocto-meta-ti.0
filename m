Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.37802.1629199570714213537
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Aug 2021 04:26:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=UErLOVr3;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17HBQ6QV081899;
	Tue, 17 Aug 2021 06:26:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1629199566;
	bh=9kYIjrHLXwDmQvM9tvyVoVxTYDg8W46dB8Y8gl3kNic=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=UErLOVr3Vv4biiGHlNL2GgnYymnmbZYNK9cCj0keIW7aXu0XwrDVKvReU/qmS3k+/
	 CNvnoskpBq1bidOqWvSlBslMV0Wk6gUg9AGAbLF5bm3L4oC5UdfTQjehs/Bu0FSxN1
	 KHonPh7KofER6u/AVEIBAgumJs7yEbY7WhIvamxM=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17HBQ6hn007758
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Aug 2021 06:26:06 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 17
 Aug 2021 06:26:05 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 17 Aug 2021 06:26:06 -0500
Received: from [10.250.39.223] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17HBQ5oY119781;
	Tue, 17 Aug 2021 06:26:05 -0500
Subject: Re: [meta-ti] [master][PATCH v4] meta-ti: convert to new override syntax in honister
To: Paul Barker <paul@pbarker.dev>, Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, Denys Dmytriyenko <denys@konsulko.com>
References: <1628707145-50420-1-git-send-email-denis@denix.org>
 <20210814145153.26140c02.paul@pbarker.dev>
From: "Yogesh Siraswar" <yogeshs@ti.com>
Message-ID: <b07ad358-203e-4443-6682-8632cbc70feb@ti.com>
Date: Tue, 17 Aug 2021 06:26:05 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210814145153.26140c02.paul@pbarker.dev>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Applied to master. Thanks

On 8/14/2021 8:55 AM, Paul Barker wrote:
> On Wed, 11 Aug 2021 14:39:05 -0400
> "Denys Dmytriyenko" <denis@denix.org> wrote:
> 
>> From: Denys Dmytriyenko <denys@konsulko.com>
>>
>> Upcoming "honister" release changes the override syntax to improve usability,
>> speed and memory footprint. Update recipes with the new syntax and set layer
>> compatibility to honister.
>>
>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>> Tested-by: Paul Barker <paul.barker@sancloud.com>
> 
> All,
> 
> The current status is that the master branch of meta-ti does not build
> against the current Yocto Project master branch. I recommend moving
> ahead and merging this override conversion sooner rather than later -
> if there are any remaining issues they can be fixed in follow up
> commits. Merging this patch as-is should at least unblock most users of
> meta-ti.
> 
> Thanks,
> 
> 
> 
> 
> 
