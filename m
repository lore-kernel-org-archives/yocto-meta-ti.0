Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.247.1646157305500135104
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 01 Mar 2022 09:55:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=V0/0PU71;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 221Ht1I5018354;
	Tue, 1 Mar 2022 11:55:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1646157301;
	bh=yMf+W2OC0ivvX5+883QNcJF7y1Thu4TmI4UISYfFeFM=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=V0/0PU71zIq0rzjERUg1d4HLg7wjZzU7XQy0iMKxz7xjV2BEGPoasAKZjaoeyNsUS
	 TZK/OZ5CDPROCMNXqp95n0GN+8D50PBCAUwQXLmy+Un2qFGW6n4glS8Xp7Ndfv4RlW
	 4mjEU+BSeiTUn7IZcF+zZcllUgMOaO+qJyH4Rq9U=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 221Ht0dw032993
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 1 Mar 2022 11:55:00 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 1
 Mar 2022 11:55:00 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 1 Mar 2022 11:55:00 -0600
Received: from [10.249.37.96] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 221Ht0aW068077;
	Tue, 1 Mar 2022 11:55:00 -0600
Message-ID: <b98cdde3-13c5-071b-1de1-0c91c3f68b91@ti.com>
Date: Tue, 1 Mar 2022 11:55:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [meta-ti] [master][PATCH] meta-ti: correct and do not skip "installed-vs-shipped" QA check
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
References: <16D7256159B60D66.7393@lists.yoctoproject.org>
 <20220301173252.GG1766@denix.org>
From: "Ryan Eatmon" <reatmon@ti.com>
In-Reply-To: <20220301173252.GG1766@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


ACK.


On 3/1/2022 11:32, Denys Dmytriyenko wrote:
> Ping.
> 
> On Fri, Feb 25, 2022 at 09:41:25PM +0000, Denys Dmytriyenko wrote:
>> From: Denys Dmytriyenko <denys@konsulko.com>
>>
>> Skipping "installed-vs-shipped" QA check is now considered bad practice
>> due to possible SDK issues and is being flagged by yocto-check-layer [1]
>> script and could affect "Yocto Project Compatible" status for the layer.
>>
>> [1] https://git.openembedded.org/openembedded-core/commit/?id=e8baa75535fc888f1d768b23a0140475e832c910
>>
>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>> ---
>>   meta-ti-extras/recipes-devtools/cuia/cuia_1.0.0.13.bb  | 5 ++++-
>>   meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc           | 2 +-
>>   meta-ti-extras/recipes-ti/xdais/ti-xdais_6.26.01.03.bb | 2 --
>>   3 files changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta-ti-extras/recipes-devtools/cuia/cuia_1.0.0.13.bb b/meta-ti-extras/recipes-devtools/cuia/cuia_1.0.0.13.bb
>> index 1cda366d..8b16830f 100644
>> --- a/meta-ti-extras/recipes-devtools/cuia/cuia_1.0.0.13.bb
>> +++ b/meta-ti-extras/recipes-devtools/cuia/cuia_1.0.0.13.bb
>> @@ -22,9 +22,12 @@ do_compile () {
>>   do_install() {
>>   	cd ${S}
>>   	oe_runmake DESTDIR=${D} libdir=${libdir} includedir=${includedir} install
>> +	rm -rf ${D}${libdir}/boot.*
>> +	rm -rf ${D}${libdir}/gnu.targets.*
>> +	rm -rf ${D}${libdir}/syscalls.*
>>   }
>>   
>>   COMPATIBLE_HOST ?= "null"
>>   COMPATIBLE_HOST:ti-soc = "(.*)"
>>   
>> -INSANE_SKIP:${PN} += "textrel installed-vs-shipped"
>> +INSANE_SKIP:${PN} += "textrel"
>> diff --git a/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc b/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc
>> index 460964b3..6b5e186c 100644
>> --- a/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc
>> +++ b/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc
>> @@ -29,4 +29,4 @@ FILES:${PN}-dev += "${VLIB_C66_INSTALL_DIR_RECIPE}"
>>   INHIBIT_PACKAGE_STRIP = "1"
>>   INHIBIT_SYSROOT_STRIP = "1"
>>   INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>> -INSANE_SKIP:${PN}-dev = "installed-vs-shipped arch"
>> +INSANE_SKIP:${PN}-dev = "arch"
>> diff --git a/meta-ti-extras/recipes-ti/xdais/ti-xdais_6.26.01.03.bb b/meta-ti-extras/recipes-ti/xdais/ti-xdais_6.26.01.03.bb
>> index 9fc4cee1..ee9826e6 100644
>> --- a/meta-ti-extras/recipes-ti/xdais/ti-xdais_6.26.01.03.bb
>> +++ b/meta-ti-extras/recipes-ti/xdais/ti-xdais_6.26.01.03.bb
>> @@ -7,5 +7,3 @@ LIC_FILES_CHKSUM = "file://xdais_6_26_01_03_manifest.html;md5=a5a675d49db2f658bb
>>   
>>   SRC_URI[xdaistarball.md5sum] = "9b2bea3408254e737ec0d819a031adf6"
>>   SRC_URI[xdaistarball.sha256sum] = "d7bcbd8bcfe6fdfc5f402e4b125ced6c806dc30bc5296e98d5d43b0b5a237a0d"
>> -
>> -INSANE_SKIP:${PN} = "installed-vs-shipped"
>> -- 
>> 2.25.1
>>

-- 
Ryan Eatmon
reatmon@ti.com
