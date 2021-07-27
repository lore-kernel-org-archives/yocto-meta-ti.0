Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.5859.1627412195453142278
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 27 Jul 2021 11:56:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=e1KzJtmj;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: yogeshs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16RIuUnL079149;
	Tue, 27 Jul 2021 13:56:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1627412190;
	bh=OLhQjZIrGC5hlLjvfLOImnFNNv8vli04UaLSPSErEto=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=e1KzJtmjdQh3NP6pcVpgcH9vmLP5C2LARv7T1chGE4K8M1kunXxodiV8U/kdc4gqt
	 wFfvOgkuVxmgvvQXI48kkEuf+5zrQTyS+GiD0rilSIwIoOYm1onh4KbGK5GonWe8pi
	 IRgUn+wnL8RKPT2F4oMzJjPkN8kjfShOXsG2l+8g=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16RIuU3w014156
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Jul 2021 13:56:30 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 27
 Jul 2021 13:56:30 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 27 Jul 2021 13:56:30 -0500
Received: from [10.250.38.213] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16RIuTju081144;
	Tue, 27 Jul 2021 13:56:30 -0500
Subject: Re: [meta-ti][hardknott/master][PATCH] wic: Set a fixed size for boot partition in wic image
To: Denys Dmytriyenko <denis@denix.org>,
        "Theodore A. Roth"
	<troth@openavr.org>
CC: <meta-ti@lists.yoctoproject.org>
References: <20210726142925.2724723-1-troth@openavr.org>
 <20210726235048.GY1528@denix.org>
From: "Yogesh Siraswar" <yogeshs@ti.com>
Message-ID: <bf8b2ff0-3790-df07-c0fa-bd907023ea0d@ti.com>
Date: Tue, 27 Jul 2021 13:56:29 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210726235048.GY1528@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Applied to master.

Thanks
Yogesh

On 7/26/2021 6:50 PM, Denys Dmytriyenko wrote:
> On Mon, Jul 26, 2021 at 08:29:25AM -0600, Theodore A. Roth wrote:
>> The beagleboneai is not loading the MLO without this change.
>>
>> A similar change was needed in meta-yocto-bsp for the beaglebone black
>> due to the updating of dosfstools to 4.2 in Hardknott.
>>
>> [Yocto #14306]
>>
>> (See also meta-yocto rev: 0c679ac53b52e631a7c961872ce58f5cf74b8629)
> 
> Thanks, this does make sense and aligns with the change discussed for EFI:
> https://lists.yoctoproject.org/g/meta-ti/topic/83851299
> 
> 
>> Signed-off-by: Theodore A. Roth <troth@openavr.org>
> 
> Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>
> 
> BTW, meta-ti doesn't have hardknott branch, so this is only for master.
> 
> 
>> ---
>>   wic/sdimage-2part.wks | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/wic/sdimage-2part.wks b/wic/sdimage-2part.wks
>> index 77d6f7b5..3eab9407 100644
>> --- a/wic/sdimage-2part.wks
>> +++ b/wic/sdimage-2part.wks
>> @@ -2,5 +2,5 @@
>>   # long-description: Creates a partitioned SD card image for TI platforms.
>>   # Boot files are located in the first vfat partition with extra reserved space.
>>   
>> -part /boot --source bootimg-partition --ondisk mmcblk0 --fstype=vfat --label boot --active --align 1024 --extra-space 100M --use-uuid
>> +part /boot --source bootimg-partition --ondisk mmcblk0 --fstype=vfat --label boot --active --align 1024 --fixed-size 128 --use-uuid
>>   part / --source rootfs --ondisk mmcblk0 --fstype=ext4 --label root --align 1024 --use-uuid
>> -- 
>> 2.25.1
>>
> 
> 
> 
> 
> 
