Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.537.1582560955731374496
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 Feb 2020 08:15:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=QiWBcjxf;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nikhil.nd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01OGFsXD007491;
	Mon, 24 Feb 2020 10:15:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582560955;
	bh=n4Mu7tQsmgVHuCb1/4aGXsg+ARXBLNSxeYgvHrm7w2Y=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=QiWBcjxfdIH6HXlERAminlUb+ozne2BXE9nMVSzw0LXOQ3fA5LoTVXydqcK3/7Yjc
	 3EZM9wnI0vuyO3sB56u62rbwUW9chA6pOrklvEjDHg+ANIBCLmvPoOb691Qxf4aiCt
	 LiR2WpD34hTndplKD8bEG8Vw5wA4/TV/zjVy8nbo=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01OGFsTL007072
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 24 Feb 2020 10:15:54 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 24
 Feb 2020 10:15:54 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 24 Feb 2020 10:15:54 -0600
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01OGFqgi072480;
	Mon, 24 Feb 2020 10:15:53 -0600
Subject: Re: [meta-ti][zeus PATCH v1] conf: j7-evm: Add jailhouse dtbo
To: <denys@ti.com>
CC: <meta-ti@yoctoproject.org>, <meta-ti@lists.yoctoproject.org>
References: <20200224161346.1447-1-nikhil.nd@ti.com>
From: "Nikhil Devshatwar" <nikhil.nd@ti.com>
Message-ID: <0b797a49-6bde-0485-4ed1-118e48764d33@ti.com>
Date: Mon, 24 Feb 2020 21:44:28 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200224161346.1447-1-nikhil.nd@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: multipart/alternative;
	boundary="------------EC193A522441B7BFF7DECE47"
Content-Language: en-US

--------------EC193A522441B7BFF7DECE47
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Dependency for this is the kernel patch which adds this dtbo
http://dflvsu0004.dal.design.ti.com/patch/53612/
Merge this recipe only after the SRCREV is pointing where this patch is 
merged

Regards,
Nikhil D

On 24/02/20 9:43 pm, nikhil.nd@ti.com wrote:
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>   conf/machine/j7-evm.conf | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/conf/machine/j7-evm.conf b/conf/machine/j7-evm.conf
> index 7451d0b6..e73c75bd 100644
> --- a/conf/machine/j7-evm.conf
> +++ b/conf/machine/j7-evm.conf
> @@ -12,6 +12,7 @@ KERNEL_DEVICETREE = " \
>       ti/k3-j721e-proc-board-tps65917.dtb \
>       ti/k3-j721e-common-proc-board-infotainment.dtbo \
>       ti/k3-j721e-pcie-backplane.dtbo \
> +    ti/k3-j721e-common-proc-board-jailhouse.dtbo \
>   "
>   
>   UBOOT_MACHINE = "j721e_evm_a72_config"


--------------EC193A522441B7BFF7DECE47
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <font face="Verdana">Dependency for this is the kernel patch which
      adds this dtbo<br>
      <a class="moz-txt-link-freetext" href="http://dflvsu0004.dal.design.ti.com/patch/53612/">http://dflvsu0004.dal.design.ti.com/patch/53612/</a><br>
      Merge this recipe only after the SRCREV is pointing where this
      patch is merged<br>
      <br>
      Regards,<br>
      Nikhil D<br>
    </font><br>
    <div class="moz-cite-prefix">On 24/02/20 9:43 pm, <a class="moz-txt-link-abbreviated" href="mailto:nikhil.nd@ti.com">nikhil.nd@ti.com</a>
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200224161346.1447-1-nikhil.nd@ti.com">
      <pre class="moz-quote-pre" wrap="">From: Nikhil Devshatwar <a class="moz-txt-link-rfc2396E" href="mailto:nikhil.nd@ti.com">&lt;nikhil.nd@ti.com&gt;</a>

Signed-off-by: Nikhil Devshatwar <a class="moz-txt-link-rfc2396E" href="mailto:nikhil.nd@ti.com">&lt;nikhil.nd@ti.com&gt;</a>
---
 conf/machine/j7-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/machine/j7-evm.conf b/conf/machine/j7-evm.conf
index 7451d0b6..e73c75bd 100644
--- a/conf/machine/j7-evm.conf
+++ b/conf/machine/j7-evm.conf
@@ -12,6 +12,7 @@ KERNEL_DEVICETREE = " \
     ti/k3-j721e-proc-board-tps65917.dtb \
     ti/k3-j721e-common-proc-board-infotainment.dtbo \
     ti/k3-j721e-pcie-backplane.dtbo \
+    ti/k3-j721e-common-proc-board-jailhouse.dtbo \
 "
 
 UBOOT_MACHINE = "j721e_evm_a72_config"
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------EC193A522441B7BFF7DECE47--
