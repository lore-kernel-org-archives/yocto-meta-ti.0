Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4143C636D4
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 23:04:35 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.9100.1676070270380347324
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 10 Feb 2023 15:04:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=FfvfD4Rd;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31AN4PGW060733;
	Fri, 10 Feb 2023 17:04:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676070265;
	bh=07OyWWI/ptqTQPNRk13xsr3WIb5/jLWoBnXigXzio+4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=FfvfD4Rd+3G/bvcKnfR2UpTE2kQBT9NRbY/rOCHwQz2/UOx+5KrFcBOOOU+GUT+NK
	 9yYTrAXquY8cxW9Ftkav+104Q8RZlTxP1lQLbBbaT+qc+TtVlsgnHAkbmydabiikfD
	 VSbe3x+u7yRFvP6t3odAii5PmgtUaN8O8MIcVQPo=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31AN4PEN018268
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Feb 2023 17:04:25 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 10
 Feb 2023 17:04:25 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 10 Feb 2023 17:04:25 -0600
Received: from [10.247.29.106] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31AN4PuJ078858;
	Fri, 10 Feb 2023 17:04:25 -0600
Message-ID: <fd49179b-4213-b360-7f19-cf9292524d5f@ti.com>
Date: Fri, 10 Feb 2023 17:04:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [meta-ti][dunfell][RFC PATCH v2] am62axx-evm: Add support for
 HS-FS and HS-SE platforms
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <denis@denix.org>, <reatmon@ti.com>
CC: <g-gupta@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>, <p-bhagat@ti.com>
References: <20230210000834.24783-1-s-adivi@ti.com>
Content-Language: en-US
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20230210000834.24783-1-s-adivi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 10 Feb 2023 23:04:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15812

Sai,

On 2/9/2023 6:08 PM, Sai Sree Kartheek Adivi wrote:
> Add support for HS-FS and HS-SE along with GP platforms and make HS-FS default.

Now that the needed firmwares are in the production branches, please 
resubmit the patch without RFC in subject.


> 
> Signed-off-by: Sai Sree Kartheek Adivi<s-adivi@ti.com>
> ---
>   conf/machine/am62axx-evm-k3r5-gp.conf         | 21 +++++++++++++++++++
>   conf/machine/am62axx-evm-k3r5-hs-fs.conf      | 15 +++++++++++++
>   conf/machine/am62axx-evm-k3r5-hs-se.conf      | 20 ++++++++++++++++++
>   conf/machine/am62axx-evm-k3r5.conf            | 11 ----------
>   conf/machine/include/am62axx.inc              | 21 ++++++++++++++++---
>   conf/multiconfig/k3r5-hs-fs.conf              |  3 +++
>   recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb        |  2 ++
>   .../trusted-firmware-a_%.bbappend             |  4 ++++
>   recipes-security/optee/optee-os_%.bbappend    |  4 ++++
>   recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb    | 16 ++++++++++++++
>   10 files changed, 103 insertions(+), 14 deletions(-)
>   create mode 100644 conf/machine/am62axx-evm-k3r5-gp.conf
>   create mode 100644 conf/machine/am62axx-evm-k3r5-hs-fs.conf
>   create mode 100644 conf/machine/am62axx-evm-k3r5-hs-se.conf
>   delete mode 100644 conf/machine/am62axx-evm-k3r5.conf
>   create mode 100644 conf/multiconfig/k3r5-hs-fs.conf

