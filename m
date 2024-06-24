Return-Path: <sabeeh-khan@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 103B7C2BD09
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 21:20:11 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.154339.1719264002942958315
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 Jun 2024 14:20:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hEeUvfQi;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: sabeeh-khan@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45OLJx4A056679;
	Mon, 24 Jun 2024 16:19:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719264000;
	bh=6UAqaQv3wDJDuWzoTPtbBEeDJNaXCZBnAhOyV9EsHWA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=hEeUvfQiuhlEA7X3UNA21uUWb8OQT2TNREn/wvQOUHeXv7iNtyO8qUiyYlPFr0Ldc
	 dNHon9yOo+iyzNaSL0LYVxFzPNSwc51hNhB+ls0Dv5ieXzwov/4pYIYSTuElHcr00B
	 ARzM20zBlP3j4Tx0ezyDBhuR+OavS3lTn9kxManM=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45OLJxB9077282
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 24 Jun 2024 16:19:59 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 24
 Jun 2024 16:19:59 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 24 Jun 2024 16:19:59 -0500
Received: from [128.247.83.254] (lt5cd302htfz.dhcp.ti.com [128.247.83.254])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45OLJx0s084968;
	Mon, 24 Jun 2024 16:19:59 -0500
Message-ID: <1b3f786d-d4d1-4f8c-b285-d3cf8f25c151@ti.com>
Date: Mon, 24 Jun 2024 16:19:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [RFC][master/scarthgap][PATCH 1/4] cc33conf: add new
 cc33conf tool for cc33xx devices
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>
References: <20240620032202.169122-1-sabeeh-khan@ti.com>
 <20240620032202.169122-2-sabeeh-khan@ti.com>
 <20240620202002.GD18231@denix.org>
 <3311702c-1cc8-4542-8661-72af6262443a@ti.com>
 <20240624202105.GI18231@denix.org>
Content-Language: en-US
From: "Khan, Sabeeh" <sabeeh-khan@ti.com>
In-Reply-To: <20240624202105.GI18231@denix.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 24 Jun 2024 21:20:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17807


On 6/24/2024 3:21 PM, Denys Dmytriyenko wrote:

> On Thu, Jun 20, 2024 at 03:40:22PM -0500, Sabeeh Khan via lists.yoctoproject.org wrote:
>> On 6/20/2024 3:20 PM, Denys Dmytriyenko wrote:
>>> On Wed, Jun 19, 2024 at 10:21:59PM -0500, Sabeeh Khan via lists.yoctoproject.org wrote:
>>>> cc33conf is a tool provided by TI to configure
>>>> cc33xx WLAN devices. It can be used to change
>>>> the RF parameters and other features of the target.
>>>> Documentation for this tool is provided within the following link:
>>>> https://www.ti.com/tool/CC33XX-SOFTWARE
>>>>
>>>> Signed-off-by: Sabeeh Khan<sabeeh-khan@ti.com>
>>>> ---
>>>>  .../cc33conf/cc33conf_git.bb                  | 29 +++++++++++++++++++
>>>>  1 file changed, 29 insertions(+)
>>>>  create mode 100644 meta-ti-extras/recipes-connectivity/cc33conf/cc33conf_git.bb
>>>>
>>>> diff --git a/meta-ti-extras/recipes-connectivity/cc33conf/cc33conf_git.bb b/meta-ti-extras/recipes-connectivity/cc33conf/cc33conf_git.bb
>>>> new file mode 100644
>>>> index 00000000..1e4faa77
>>>> --- /dev/null
>>>> +++ b/meta-ti-extras/recipes-connectivity/cc33conf/cc33conf_git.bb
>>>> @@ -0,0 +1,29 @@
>>>> +DESCRIPTION = "Configuration utility for TI CC33xx wireless devices"
>>>> +LICENSE = "BSD-3-Clause"
>>>> +LIC_FILES_CHKSUM ="file://COPYING;md5=d5fc448a36efe573623542dcb989afc4"
>>>> +
>>>> +SRCREV = "a2f84140b8d67cfc94472cf92676a409d1e47d86"
>>>> +SRC_URI = "git://git.ti.com/git/cc33xx-wlan/cc33xx-utils.git;branch=master;protocol=https"
>>>> +
>>>> +PV = "1.7.0.120"
>>>> +
>>>> +S = "${WORKDIR}/git/cc33conf"
>>>> +
>>>> +EXTRA_OEMAKE = "CC="${CC}""
>>>> +
>>>> +do_install() {
>>>> +	install -d ${D}${sbindir}
>>>> +	install -d ${D}${sbindir}/cc33conf/
>>>> +
>>>> +	install -m 0755 cc33xxconf ${D}${sbindir}/cc33conf/
>>>> +	install -m 0755 dictionary.txt ${D}${sbindir}/cc33conf/
>>>> +	install -m 0755 default.conf ${D}${sbindir}/cc33conf/
>>>> +	install -m 0755 README ${D}${sbindir}/cc33conf/
>>>> +	install -m 0755 cc33xx-conf.conf ${D}${sbindir}/cc33conf/
>>>> +	install -m 0755 cc33xx-conf.ini ${D}${sbindir}/cc33conf/
>>>> +	install -m 0755 conf.h ${D}${sbindir}/cc33conf/
>>> Should all these files really go into sbindir?
>> This recipe and tool is based off of wlconf. Since wlconf was
>> already accepted,
>>
>> I figured installing to a similar location would be practical.
>>
>> However, I am open to other locations if you have suggestions.
>>
>> The tool does use all of these files.
> Well, wlconf does indeed set a bad precedent...
>
> Are those files being used relative to the binary and hence should reside 
> there?

Yes, these files are used by the cc33conf binary, and are expected to be 
in the same directory. 

>
> The standard is to have conf files in /etc, binaries in /usr/bin or /bin, 
> docs/READMEs in /usr/share/doc and .h headers in /usr/include.
>
> And bitbake.conf sets all the corresponding variables accordingly, such as 
> sysconfdir, bindir, datadir, docdir, includedir, etc:
> https://urldefense.com/v3/__https://git.openembedded.org/openembedded-core/tree/meta/conf/bitbake.conf__;!!G3vK!VPNKNNfyhJIOrtUFG8JhfU9TtuBcgUmgLggT-57NAKqxdaDVVGRDA89I5c9JmFrVB1_4chMVtjDH$ 
>
> So, if the tool is capable of locating its files in the proper system-wide 
> locations, the recipe should definitely install them in the right location.
>
The tool currently isn't capable of searching system-wide, but per your feedback, 
I am certainly open to improving the tool to do this. 
However, I'm not sure of the feasibility of doing so. Feels like a major re-work unfortunately. 

Thanks for your guidance!


