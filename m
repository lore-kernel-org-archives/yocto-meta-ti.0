Return-Path: <sabeeh-khan@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE529C2BBCA
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 20:40:33 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.58004.1718916025334419842
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 20 Jun 2024 13:40:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XRsJqgIb;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: sabeeh-khan@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45KKeMBb066444;
	Thu, 20 Jun 2024 15:40:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718916022;
	bh=jFnWVzbUw97VOBS1FajiKWaiHuoptlsnrORwrdQTJmw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=XRsJqgIb4I01i+FP96TqCUicRr0HznLCGVBxxFC0P1YvCx5kHFV83HzzMwnBMil0f
	 B1O/E6L88SUXSfVQEJ5O/+qgbpKQGpiAdIoGpJC0XtqJTqMN8JsPmK00qeE1eTbmZg
	 PLpRVeLGGwaUMrJgDJvral+O0iBZYiLwPeP0zCl0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45KKeM1H069916
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Jun 2024 15:40:22 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Jun 2024 15:40:22 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Jun 2024 15:40:22 -0500
Received: from [128.247.83.254] (lt5cd302htfz.dhcp.ti.com [128.247.83.254])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45KKeMc1005789;
	Thu, 20 Jun 2024 15:40:22 -0500
Content-Type: multipart/alternative;
	boundary="------------5Cz5omkE8KZ7o5rgqEIrVQJu"
Message-ID: <3311702c-1cc8-4542-8661-72af6262443a@ti.com>
Date: Thu, 20 Jun 2024 15:40:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [RFC][master/scarthgap][PATCH 1/4] cc33conf: add new
 cc33conf tool for cc33xx devices
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>
References: <20240620032202.169122-1-sabeeh-khan@ti.com>
 <20240620032202.169122-2-sabeeh-khan@ti.com>
 <20240620202002.GD18231@denix.org>
Content-Language: en-US
From: "Khan, Sabeeh" <sabeeh-khan@ti.com>
In-Reply-To: <20240620202002.GD18231@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 20 Jun 2024 20:40:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17785

--------------5Cz5omkE8KZ7o5rgqEIrVQJu
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 6/20/2024 3:20 PM, Denys Dmytriyenko wrote:
> On Wed, Jun 19, 2024 at 10:21:59PM -0500, Sabeeh Khan via lists.yoctoproject.org wrote:
>> cc33conf is a tool provided by TI to configure
>> cc33xx WLAN devices. It can be used to change
>> the RF parameters and other features of the target.
>> Documentation for this tool is provided within the following link:
>> https://www.ti.com/tool/CC33XX-SOFTWARE
>>
>> Signed-off-by: Sabeeh Khan<sabeeh-khan@ti.com>
>> ---
>>   .../cc33conf/cc33conf_git.bb                  | 29 +++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>   create mode 100644 meta-ti-extras/recipes-connectivity/cc33conf/cc33conf_git.bb
>>
>> diff --git a/meta-ti-extras/recipes-connectivity/cc33conf/cc33conf_git.bb b/meta-ti-extras/recipes-connectivity/cc33conf/cc33conf_git.bb
>> new file mode 100644
>> index 00000000..1e4faa77
>> --- /dev/null
>> +++ b/meta-ti-extras/recipes-connectivity/cc33conf/cc33conf_git.bb
>> @@ -0,0 +1,29 @@
>> +DESCRIPTION = "Configuration utility for TI CC33xx wireless devices"
>> +LICENSE = "BSD-3-Clause"
>> +LIC_FILES_CHKSUM ="file://COPYING;md5=d5fc448a36efe573623542dcb989afc4"
>> +
>> +SRCREV = "a2f84140b8d67cfc94472cf92676a409d1e47d86"
>> +SRC_URI = "git://git.ti.com/git/cc33xx-wlan/cc33xx-utils.git;branch=master;protocol=https"
>> +
>> +PV = "1.7.0.120"
>> +
>> +S = "${WORKDIR}/git/cc33conf"
>> +
>> +EXTRA_OEMAKE = "CC="${CC}""
>> +
>> +do_install() {
>> +	install -d ${D}${sbindir}
>> +	install -d ${D}${sbindir}/cc33conf/
>> +
>> +	install -m 0755 cc33xxconf ${D}${sbindir}/cc33conf/
>> +	install -m 0755 dictionary.txt ${D}${sbindir}/cc33conf/
>> +	install -m 0755 default.conf ${D}${sbindir}/cc33conf/
>> +	install -m 0755 README ${D}${sbindir}/cc33conf/
>> +	install -m 0755 cc33xx-conf.conf ${D}${sbindir}/cc33conf/
>> +	install -m 0755 cc33xx-conf.ini ${D}${sbindir}/cc33conf/
>> +	install -m 0755 conf.h ${D}${sbindir}/cc33conf/
> Should all these files really go into sbindir?

This recipe and tool is based off of wlconf. Since wlconf was already 
accepted,

I figured installing to a similar location would be practical.

However, I am open to other locations if you have suggestions.

The tool does use all of these files.

--------------5Cz5omkE8KZ7o5rgqEIrVQJu
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/20/2024 3:20 PM, Denys Dmytriyenko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240620202002.GD18231@denix.org">
      <pre class="moz-quote-pre" wrap="">On Wed, Jun 19, 2024 at 10:21:59PM -0500, Sabeeh Khan via lists.yoctoproject.org wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">cc33conf is a tool provided by TI to configure
cc33xx WLAN devices. It can be used to change
the RF parameters and other features of the target.
Documentation for this tool is provided within the following link:
<a class="moz-txt-link-freetext" href="https://www.ti.com/tool/CC33XX-SOFTWARE">https://www.ti.com/tool/CC33XX-SOFTWARE</a>

Signed-off-by: Sabeeh Khan <a class="moz-txt-link-rfc2396E" href="mailto:sabeeh-khan@ti.com">&lt;sabeeh-khan@ti.com&gt;</a>
---
 .../cc33conf/cc33conf_git.bb                  | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-ti-extras/recipes-connectivity/cc33conf/cc33conf_git.bb

diff --git a/meta-ti-extras/recipes-connectivity/cc33conf/cc33conf_git.bb b/meta-ti-extras/recipes-connectivity/cc33conf/cc33conf_git.bb
new file mode 100644
index 00000000..1e4faa77
--- /dev/null
+++ b/meta-ti-extras/recipes-connectivity/cc33conf/cc33conf_git.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "Configuration utility for TI CC33xx wireless devices"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=d5fc448a36efe573623542dcb989afc4">"file://COPYING;md5=d5fc448a36efe573623542dcb989afc4"</a>
+
+SRCREV = "a2f84140b8d67cfc94472cf92676a409d1e47d86"
+SRC_URI = "git://git.ti.com/git/cc33xx-wlan/cc33xx-utils.git;branch=master;protocol=https"
+
+PV = "1.7.0.120"
+
+S = "${WORKDIR}/git/cc33conf"
+
+EXTRA_OEMAKE = "CC="${CC}""
+
+do_install() {
+	install -d ${D}${sbindir}
+	install -d ${D}${sbindir}/cc33conf/
+
+	install -m 0755 cc33xxconf ${D}${sbindir}/cc33conf/
+	install -m 0755 dictionary.txt ${D}${sbindir}/cc33conf/
+	install -m 0755 default.conf ${D}${sbindir}/cc33conf/
+	install -m 0755 README ${D}${sbindir}/cc33conf/
+	install -m 0755 cc33xx-conf.conf ${D}${sbindir}/cc33conf/
+	install -m 0755 cc33xx-conf.ini ${D}${sbindir}/cc33conf/
+	install -m 0755 conf.h ${D}${sbindir}/cc33conf/
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Should all these files really go into sbindir?
</pre>
    </blockquote>
    <p><span style="white-space: pre-wrap">This recipe and tool is based off of wlconf. Since wlconf was already accepted, </span></p>
    <p><span style="white-space: pre-wrap">I figured installing to a similar location would be practical. </span></p>
    <p><span style="white-space: pre-wrap">However, I am open to other locations if you have suggestions. </span></p>
    <p><span style="white-space: pre-wrap">The tool does use all of these files. 
</span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
  </body>
</html>

--------------5Cz5omkE8KZ7o5rgqEIrVQJu--

