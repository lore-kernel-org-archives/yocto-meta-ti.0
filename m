Return-Path: <sabeeh-khan@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96E2CC2BA18
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 20:37:23 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.58026.1718915837075648823
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 20 Jun 2024 13:37:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dQ+GnLQH;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: sabeeh-khan@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45KKbDRu066081;
	Thu, 20 Jun 2024 15:37:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718915833;
	bh=PNjt+NTk9D3BcHoqgUBBPduIyG448EuB1thFYW1gYiA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=dQ+GnLQHZwt6aTm1S0t5Stuw34i0wEvwBxwu6+DdDwF4RLSZD583wuWDd2Gad5o8b
	 ptXjnKzadGg/bmfn4fqamVgLFO8aTfsECL1H011eJc9acKmfGWDshiuRzPmvOW5xoY
	 p33kemCCenkOFxuIDgGOsXjcxmNv1cJbX5Gz41s0=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45KKbDsB064642
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Jun 2024 15:37:13 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Jun 2024 15:37:12 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Jun 2024 15:37:12 -0500
Received: from [128.247.83.254] (lt5cd302htfz.dhcp.ti.com [128.247.83.254])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45KKbCTB001544;
	Thu, 20 Jun 2024 15:37:12 -0500
Content-Type: multipart/alternative;
	boundary="------------ZvFMLthkl0EV0GKv9LKQre0t"
Message-ID: <224a7234-e455-44a1-971d-326761968609@ti.com>
Date: Thu, 20 Jun 2024 15:37:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [RFC][master/scarthgap][PATCH 4/4]
 cc33xx-target-scripts: add cc33xx scripts to control TI cc33xx WLAN device
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>
References: <20240620032202.169122-1-sabeeh-khan@ti.com>
 <20240620032202.169122-5-sabeeh-khan@ti.com>
 <20240620202733.GF18231@denix.org>
Content-Language: en-US
From: "Khan, Sabeeh" <sabeeh-khan@ti.com>
In-Reply-To: <20240620202733.GF18231@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 20 Jun 2024 20:37:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17784

--------------ZvFMLthkl0EV0GKv9LKQre0t
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 6/20/2024 3:27 PM, Denys Dmytriyenko wrote:
> On Wed, Jun 19, 2024 at 10:22:02PM -0500, Sabeeh Khan via lists.yoctoproject.org wrote:
>> [...]
>>
>> diff --git a/meta-ti-extras/recipes-connectivity/cc33xx-target-scripts/cc33xx-target-scripts.bb b/meta-ti-extras/recipes-connectivity/cc33xx-target-scripts/cc33xx-target-scripts.bb
>> new file mode 100644
>> index 00000000..2f13f911
>> --- /dev/null
>> +++ b/meta-ti-extras/recipes-connectivity/cc33xx-target-scripts/cc33xx-target-scripts.bb
>> @@ -0,0 +1,22 @@
>> +DESCRIPTION = "Scripts and configuration files for TI cc33xx wireless drivers"
> SUMMARY

Apologies for not being familiar, but are you suggesting here

to have "SUMMARY" variable instead of "DESCRIPTION", or in addition to?

Can I please have some more context over the ask here?

I don't see "SUMMARY" variable in other meta-ti recipes, so I'm looking 
for a reference.

>
>> [...]
>> +
>> +do_install() {
>> +	install -d ${D}${datadir}/cc33xx/
>> +
>> +	scripts=`find ./* -type f -name "*.*"`
> Is this find command necessary?

The recipe should install .sh and .conf files from the git repo only.

This was done to ignore any README or license files and not have them 
installed.

--------------ZvFMLthkl0EV0GKv9LKQre0t
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
    <div class="moz-cite-prefix">On 6/20/2024 3:27 PM, Denys Dmytriyenko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240620202733.GF18231@denix.org">
      <pre class="moz-quote-pre" wrap="">On Wed, Jun 19, 2024 at 10:22:02PM -0500, Sabeeh Khan via lists.yoctoproject.org wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">[...]

diff --git a/meta-ti-extras/recipes-connectivity/cc33xx-target-scripts/cc33xx-target-scripts.bb b/meta-ti-extras/recipes-connectivity/cc33xx-target-scripts/cc33xx-target-scripts.bb
new file mode 100644
index 00000000..2f13f911
--- /dev/null
+++ b/meta-ti-extras/recipes-connectivity/cc33xx-target-scripts/cc33xx-target-scripts.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Scripts and configuration files for TI cc33xx wireless drivers"
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
SUMMARY
</pre>
    </blockquote>
    <p>Apologies for not being familiar, but are you suggesting here <br>
    </p>
    <p>to have "SUMMARY" variable instead of "DESCRIPTION", or in
      addition to? <br>
    </p>
    <p>Can I please have some more context over the ask here?</p>
    <p>I don't see "SUMMARY" variable in other meta-ti recipes, so I'm
      looking for a reference. <br>
    </p>
    <blockquote type="cite" cite="mid:20240620202733.GF18231@denix.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">[...]
+
+do_install() {
+	install -d ${D}${datadir}/cc33xx/
+
+	scripts=`find ./* -type f -name "*.*"`
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Is this find command necessary?
</pre>
    </blockquote>
    <p>The recipe should install .sh and .conf files from the git repo
      only. <br>
    </p>
    <p>This was done to ignore any README or license files and not have
      them installed.</p>
    <p><span style="white-space: pre-wrap">
</span></p>
  </body>
</html>

--------------ZvFMLthkl0EV0GKv9LKQre0t--

