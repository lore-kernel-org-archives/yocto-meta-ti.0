Return-Path: <sabeeh-khan@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0867EC2BA18
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 01:24:35 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.63318.1718933073250380385
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 20 Jun 2024 18:24:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qU6J5CHk;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: sabeeh-khan@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45L1OUUe063392;
	Thu, 20 Jun 2024 20:24:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718933070;
	bh=wfxCYrzMfJOiN5T/xDrxuEjQl4S8tkbch8zgSsLrXU4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=qU6J5CHkesI7BH+RW15ihB/lw5lnuTWOu1PijRdvWuoFZh1FGxhjFr/6lej9tjYt/
	 5aBA/YIWHfWO14qSG8gRRQqZErD7MThM7H33BTK8qbsfvxLana2tddgbGI0cj9WlT6
	 gNQ/6tPmUNAr1UX1jlgBITsSCndOr16F7xvVKNIo=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45L1OU8G007812
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Jun 2024 20:24:30 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Jun 2024 20:24:29 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Jun 2024 20:24:29 -0500
Received: from [10.249.33.211] ([10.249.33.211])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45L1OTqk009947;
	Thu, 20 Jun 2024 20:24:29 -0500
Message-ID: <479b1a23-4b73-4fb8-a712-adf712705de6@ti.com>
Date: Thu, 20 Jun 2024 20:24:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [RFC][master/scarthgap][PATCH 4/4]
 cc33xx-target-scripts: add cc33xx scripts to control TI cc33xx WLAN device
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>
References: <20240620032202.169122-1-sabeeh-khan@ti.com>
 <20240620032202.169122-5-sabeeh-khan@ti.com>
 <20240620202733.GF18231@denix.org>
 <224a7234-e455-44a1-971d-326761968609@ti.com>
 <20240621011752.GG18231@denix.org>
Content-Language: en-US
From: "Khan, Sabeeh" <sabeeh-khan@ti.com>
In-Reply-To: <20240621011752.GG18231@denix.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 21 Jun 2024 01:24:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17790



On 6/20/2024 8:17 PM, Denys Dmytriyenko wrote:
> On Thu, Jun 20, 2024 at 03:37:12PM -0500, Khan, Sabeeh wrote:
>> On 6/20/2024 3:27 PM, Denys Dmytriyenko wrote:
>>> On Wed, Jun 19, 2024 at 10:22:02PM -0500, Sabeeh Khan via lists.yoctoproject.org wrote:
>>>> [...]
>>>>
>>>> diff --git a/meta-ti-extras/recipes-connectivity/cc33xx-target-scripts/cc33xx-target-scripts.bb b/meta-ti-extras/recipes-connectivity/cc33xx-target-scripts/cc33xx-target-scripts.bb
>>>> new file mode 100644
>>>> index 00000000..2f13f911
>>>> --- /dev/null
>>>> +++ b/meta-ti-extras/recipes-connectivity/cc33xx-target-scripts/cc33xx-target-scripts.bb
>>>> @@ -0,0 +1,22 @@
>>>> +DESCRIPTION = "Scripts and configuration files for TI cc33xx wireless drivers"
>>> SUMMARY
>> Apologies for not being familiar, but are you suggesting here
>>
>> to have "SUMMARY" variable instead of "DESCRIPTION", or in addition to?
>>
>> Can I please have some more context over the ask here?
>>
>> I don't see "SUMMARY" variable in other meta-ti recipes, so I'm
>> looking for a reference.
> https://urldefense.com/v3/__https://docs.yoctoproject.org/ref-manual/variables.html*term-SUMMARY__;Iw!!G3vK!T0lI-6cdoXVmU9UPzr9erSCvNsNdMvKJfZFYYP7HcUra2w5WfkbtKxo7hDbZ8P2Uk5WwWYI2c9n5$ 
> https://urldefense.com/v3/__https://docs.yoctoproject.org/ref-manual/variables.html*term-DESCRIPTION__;Iw!!G3vK!T0lI-6cdoXVmU9UPzr9erSCvNsNdMvKJfZFYYP7HcUra2w5WfkbtKxo7hDbZ8P2Uk5WwWRlLSudn$ 
>
> SUMMARY is a shorter version of the package description (one-line under 72 
> characters), while DESCRIPTION can be a longer multi-line description.
>
> DESCRIPTION can be omitted and will be derived from SUMMARY, but not the other 
> way around.
>
> In the very old days only the DESCRIPTION was used, hence old recipes still 
> don't set SUMMARY, but newly added recipes should not do that.
>
> Here's one of the many recipes in meta-ti that properly uses/sets both:
> https://urldefense.com/v3/__https://git.yoctoproject.org/meta-ti/tree/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc__;!!G3vK!T0lI-6cdoXVmU9UPzr9erSCvNsNdMvKJfZFYYP7HcUra2w5WfkbtKxo7hDbZ8P2Uk5WwWUukMkI9$ 
This makes it very clear, thank you!
I'll make the changes throughout the series.
>
>>>> [...]
>>>> +
>>>> +do_install() {
>>>> +	install -d ${D}${datadir}/cc33xx/
>>>> +
>>>> +	scripts=`find ./* -type f -name "*.*"`
>>> Is this find command necessary?
>> The recipe should install .sh and .conf files from the git repo only.
>>
>> This was done to ignore any README or license files and not have
>> them installed.
> I believe you can use globs directly with install, unless there's a 
> directory hierarchy:
>
> install -m 0755 *.* ${D}${datadir}/cc33xx/
Yes, there is also a directory hierarchy.
So for now I will leave this as is.

