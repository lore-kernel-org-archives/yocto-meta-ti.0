Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.1526.1580499169926832937
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 31 Jan 2020 11:32:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=IQM8O6Od;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00VJWnlN077120
	for <meta-ti@lists.yoctoproject.org>; Fri, 31 Jan 2020 13:32:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580499169;
	bh=MzoPeotFMqev8VLs12a8zzM+MzPCrDEw8WbTZgj1BeA=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=IQM8O6OdKoSOTKU1aA8+W3crzAZdcYREa8si2u/wSO1R3SLkuOa3RkL5zWEE0B7sw
	 w3/qMKCNLzIXyfsbKDyPX3TYb5jDro8nge+Em/XhGmKHixj9HIX++C/J4WEzRO4Zjt
	 dXOxRVlL7c/TUZCPS1Jv/WpP4p+9HTW3KaIKGCsA=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00VJWnJW049903
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 31 Jan 2020 13:32:49 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 31
 Jan 2020 13:32:48 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 31 Jan 2020 13:32:48 -0600
Received: from [10.250.70.160] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00VJWmu4004556;
	Fri, 31 Jan 2020 13:32:48 -0600
Subject: Re: [meta-ti][master][PATCH 1/3] conf/machine: use xz over gz for images
To: Denys Dmytriyenko <denys@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20200131192111.29813-1-afd@ti.com> <20200131192903.GB23242@beryl>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <6de23f74-cc0d-833d-333b-261b2e43837c@ti.com>
Date: Fri, 31 Jan 2020 14:32:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200131192903.GB23242@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/31/20 2:29 PM, Denys Dmytriyenko wrote:
> On Fri, Jan 31, 2020 at 02:21:09PM -0500, Andrew F. Davis wrote:
>> The current meta-arago later assumes there will be a .tar.gz for
>> the machines build into tisdk-rootfs-images. This compresses better
>> anyway so lets switch these remaining machines over.
> 
> I'm fine with the code change, but I'm not fine with the message above.
> Need to come up with a more generic/neutral message - meta-ti should not refer 
> to meta-arago or any specific Distro, as it's meant to be distro-agnostic. 
> Moreover, meta-ti is being used in other distros and environment. So, just 
> mentioning better compression ratio should be fine here. Thanks.
> 


I was worried about that also, but the only thing that seems to break is
when building these with meta-arago on top. Something to do with
packaging in that layer only works with .tar.zx so these machines that
do .tar.gz break.

I'll re-word this as suggested.

Andrew


> Denys
> 
> 
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> ---
>>  conf/machine/am3517-evm.conf  | 2 +-
>>  conf/machine/am37x-evm.conf   | 2 +-
>>  conf/machine/beagleboard.conf | 2 +-
>>  conf/machine/omap3evm.conf    | 2 +-
>>  conf/machine/omap5-evm.conf   | 2 +-
>>  conf/machine/pandaboard.conf  | 2 +-
>>  6 files changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/conf/machine/am3517-evm.conf b/conf/machine/am3517-evm.conf
>> index 87e3f1e0..c20e2f6a 100644
>> --- a/conf/machine/am3517-evm.conf
>> +++ b/conf/machine/am3517-evm.conf
>> @@ -7,7 +7,7 @@ require conf/machine/include/omap3.inc
>>  MACHINE_GUI_CLASS = "smallscreen"
>>  MACHINE_FEATURES += "touchscreen ethernet"
>>  
>> -IMAGE_FSTYPES += "ubi tar.gz"
>> +IMAGE_FSTYPES += "ubi tar.xz"
>>  EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
>>  
>>  SERIAL_CONSOLES = "115200;ttyS2"
>> diff --git a/conf/machine/am37x-evm.conf b/conf/machine/am37x-evm.conf
>> index e9d1838a..a512c8d0 100644
>> --- a/conf/machine/am37x-evm.conf
>> +++ b/conf/machine/am37x-evm.conf
>> @@ -7,7 +7,7 @@ require conf/machine/include/omap3.inc
>>  MACHINE_GUI_CLASS = "smallscreen"
>>  MACHINE_FEATURES += "touchscreen ethernet"
>>  
>> -IMAGE_FSTYPES += "ubi tar.gz"
>> +IMAGE_FSTYPES += "ubi tar.xz"
>>  EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
>>  
>>  KERNEL_DEVICETREE = "omap3-evm-37xx.dtb"
>> diff --git a/conf/machine/beagleboard.conf b/conf/machine/beagleboard.conf
>> index 37d23aa7..ee51fd66 100644
>> --- a/conf/machine/beagleboard.conf
>> +++ b/conf/machine/beagleboard.conf
>> @@ -7,7 +7,7 @@ require conf/machine/include/omap3.inc
>>  # Only has DVI connector for external screen
>>  MACHINE_GUI_CLASS = "bigscreen"
>>  
>> -IMAGE_FSTYPES += "tar.gz ubi"
>> +IMAGE_FSTYPES += "tar.xz ubi"
>>  EXTRA_IMAGECMD_jffs2 = "-lnp"
>>  
>>  KERNEL_DEVICETREE = "omap3-beagle.dtb omap3-beagle-xm.dtb omap3-beagle-xm-ab.dtb"
>> diff --git a/conf/machine/omap3evm.conf b/conf/machine/omap3evm.conf
>> index a7457c04..01808b68 100644
>> --- a/conf/machine/omap3evm.conf
>> +++ b/conf/machine/omap3evm.conf
>> @@ -7,7 +7,7 @@ require conf/machine/include/omap3.inc
>>  MACHINE_GUI_CLASS = "smallscreen"
>>  MACHINE_FEATURES += "touchscreen ethernet"
>>  
>> -IMAGE_FSTYPES += "jffs2 tar.gz"
>> +IMAGE_FSTYPES += "jffs2 tar.xz"
>>  EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
>>  
>>  SERIAL_CONSOLES = "115200;ttyS0"
>> diff --git a/conf/machine/omap5-evm.conf b/conf/machine/omap5-evm.conf
>> index 28044cb9..b4cec1a2 100644
>> --- a/conf/machine/omap5-evm.conf
>> +++ b/conf/machine/omap5-evm.conf
>> @@ -4,7 +4,7 @@
>>  
>>  require conf/machine/include/omap-a15.inc
>>  
>> -IMAGE_FSTYPES += "ubi tar.gz"
>> +IMAGE_FSTYPES += "ubi tar.xz"
>>  
>>  KERNEL_DEVICETREE = "omap5-uevm.dtb"
>>  
>> diff --git a/conf/machine/pandaboard.conf b/conf/machine/pandaboard.conf
>> index edfc612b..4dd6fa29 100644
>> --- a/conf/machine/pandaboard.conf
>> +++ b/conf/machine/pandaboard.conf
>> @@ -6,7 +6,7 @@ require conf/machine/include/omap4.inc
>>  
>>  MACHINE_GUI_CLASS = "bigscreen"
>>  
>> -IMAGE_FSTYPES += "tar.gz"
>> +IMAGE_FSTYPES += "tar.xz"
>>  
>>  KERNEL_DEVICETREE = "omap4-panda.dtb omap4-panda-a4.dtb omap4-panda-es.dtb"
>>  
>> -- 
>> 2.17.1
>>
