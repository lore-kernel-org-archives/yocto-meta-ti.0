Return-Path: <sabeeh-khan@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02587C27C79
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 18:39:43 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.55348.1718908778043871076
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 20 Jun 2024 11:39:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=nB2vdAuY;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: sabeeh-khan@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45KIdYZY036643;
	Thu, 20 Jun 2024 13:39:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718908775;
	bh=QbJ+yGNcrYhS7EW3rFOYqbzJa02CsZt7S3rBAZQqaaI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=nB2vdAuYE11Mra9g/eN58EzCTAQhoC4Ts+VJUfjfK9rGAKWIRnqPftAtVi/HQp6qz
	 NUdpW3iehIpCQOt+d1rAYZIuhPkuUwuFziKaqf/JnCFY1+CIKSad5vJSFOLXlbVjmO
	 pf1httVZHnDha1QFAztvUzyVB531Do2pcQrPdcSI=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45KIdY4P002923
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Jun 2024 13:39:34 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Jun 2024 13:39:34 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Jun 2024 13:39:34 -0500
Received: from [128.247.83.254] (lt5cd302htfz.dhcp.ti.com [128.247.83.254])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45KIdY7Z092194;
	Thu, 20 Jun 2024 13:39:34 -0500
Content-Type: multipart/alternative;
	boundary="------------jlLvZt4wa0kyFRVicYFuOrMN"
Message-ID: <8dfcb684-5118-4d30-86f3-53aa600242f3@ti.com>
Date: Thu, 20 Jun 2024 13:39:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [RFC][master/scarthgap][PATCH 3/4] cc33xx-fw: install
 cc33xx firmware
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>
References: <20240620032202.169122-1-sabeeh-khan@ti.com>
 <20240620032202.169122-4-sabeeh-khan@ti.com>
 <20240620183515.GC18231@denix.org>
Content-Language: en-US
From: "Khan, Sabeeh" <sabeeh-khan@ti.com>
In-Reply-To: <20240620183515.GC18231@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 20 Jun 2024 18:39:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17780

--------------jlLvZt4wa0kyFRVicYFuOrMN
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 6/20/2024 1:35 PM, Denys Dmytriyenko wrote:
> On Wed, Jun 19, 2024 at 10:22:01PM -0500, Sabeeh Khan via lists.yoctoproject.org wrote:
>> Download and install the cc33xx firmware and binaries
>> to be used with the cc33xx drivers.
>>
>> FW Version: 1.7.0.120
>>
>> Signed-off-by: Sabeeh Khan<sabeeh-khan@ti.com>
>> ---
>>   .../recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb    | 26 +++++++++++++++++++
>>   1 file changed, 26 insertions(+)
>>   create mode 100644 meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb
>>
>> diff --git a/meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb b/meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb
>> new file mode 100644
>> index 00000000..152e3501
>> --- /dev/null
>> +++ b/meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb
>> @@ -0,0 +1,26 @@
>> +DESCRIPTION = "Firmware files for use with TI cc33xx"
>> +LICENSE = "TI-TSPA"
>> +LIC_FILES_CHKSUM ="file://LICENCE;md5=df68504cbd0a4da1643ebcfd5783dbc9"
>> +
>> +SRC_URI = " \
>> +	git://git.ti.com/git/cc33xx-wlan/cc33xx-fw.git;protocol=https;branch=${BRANCH}
>> +"
>> +
>> +PV = "1.7.0.120"
>> +
>> +SRCREV = "988ded3a7d4d0e46de62e9ebfcb685c502bd9edf"
>> +BRANCH = "master"
>> +
>> +CLEANBROKEN = "1"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +do_compile() {
>> +    :
>> +}
> do_compile[noexec] = "1"
I will correct, thank you!
--------------jlLvZt4wa0kyFRVicYFuOrMN
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
    <div class="moz-cite-prefix">On 6/20/2024 1:35 PM, Denys Dmytriyenko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240620183515.GC18231@denix.org">
      <pre class="moz-quote-pre" wrap="">On Wed, Jun 19, 2024 at 10:22:01PM -0500, Sabeeh Khan via lists.yoctoproject.org wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Download and install the cc33xx firmware and binaries
to be used with the cc33xx drivers.

FW Version: 1.7.0.120

Signed-off-by: Sabeeh Khan <a class="moz-txt-link-rfc2396E" href="mailto:sabeeh-khan@ti.com">&lt;sabeeh-khan@ti.com&gt;</a>
---
 .../recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb    | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb

diff --git a/meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb b/meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb
new file mode 100644
index 00000000..152e3501
--- /dev/null
+++ b/meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "Firmware files for use with TI cc33xx"
+LICENSE = "TI-TSPA"
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENCE;md5=df68504cbd0a4da1643ebcfd5783dbc9">"file://LICENCE;md5=df68504cbd0a4da1643ebcfd5783dbc9"</a>
+
+SRC_URI = " \
+	git://git.ti.com/git/cc33xx-wlan/cc33xx-fw.git;protocol=https;branch=${BRANCH} 
+"
+
+PV = "1.7.0.120"
+
+SRCREV = "988ded3a7d4d0e46de62e9ebfcb685c502bd9edf"
+BRANCH = "master"
+
+CLEANBROKEN = "1"
+
+S = "${WORKDIR}/git"
+
+do_compile() {
+    :
+}
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
do_compile[noexec] = "1"
</pre>
    </blockquote>
    I will correct, thank you!<span style="white-space: pre-wrap">
</span>
  </body>
</html>

--------------jlLvZt4wa0kyFRVicYFuOrMN--

