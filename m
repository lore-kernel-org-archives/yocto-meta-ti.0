Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60581C27C79
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 16:34:02 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.52341.1718901235923263195
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 20 Jun 2024 09:33:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=n/rFKdwM;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45KGXt2w007220
	for <meta-ti@lists.yoctoproject.org>; Thu, 20 Jun 2024 11:33:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718901235;
	bh=Mi7f+l7F0hqu9v//z/q+nt6jzyAFcGlXAxJbSbEa3Sw=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=n/rFKdwM7ojwHEhMnEAifuVFiF4gNqrlPGN+hKgT5ql5kbRVXbJrgoWAvCQxwlNMg
	 n8JsRWxjU+4YhT2P/H7kKr5VggV0uQfHiHPoMWQeTpe1CDzCC2GyfABQCqbarAFPle
	 VCvLALNYC4aXWJAqn2Nf1sV6NnvGK/3Xtd/zPTgY=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45KGXtIZ067506
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 20 Jun 2024 11:33:55 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Jun 2024 11:33:55 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Jun 2024 11:33:55 -0500
Received: from [10.249.34.39] ([10.249.34.39])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45KGXtmp027536;
	Thu, 20 Jun 2024 11:33:55 -0500
Message-ID: <54010fc4-9d05-41f8-83a4-15204192238d@ti.com>
Date: Thu, 20 Jun 2024 11:33:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [RFC][master/scarthgap][PATCH 3/4] cc33xx-fw: install
 cc33xx firmware
To: <sabeeh-khan@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20240620032202.169122-1-sabeeh-khan@ti.com>
 <20240620032202.169122-4-sabeeh-khan@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240620032202.169122-4-sabeeh-khan@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 20 Jun 2024 16:34:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17777



On 6/19/2024 10:22 PM, Sabeeh Khan via lists.yoctoproject.org wrote:
> Download and install the cc33xx firmware and binaries
> to be used with the cc33xx drivers.
> 
> FW Version: 1.7.0.120
> 
> Signed-off-by: Sabeeh Khan <sabeeh-khan@ti.com>
> ---
>   .../recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb    | 26 +++++++++++++++++++
>   1 file changed, 26 insertions(+)
>   create mode 100644 meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb
> 
> diff --git a/meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb b/meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb
> new file mode 100644
> index 00000000..152e3501
> --- /dev/null
> +++ b/meta-ti-extras/recipes-bsp/cc33xx-fw/cc33xx-fw_git.bb
> @@ -0,0 +1,26 @@
> +DESCRIPTION = "Firmware files for use with TI cc33xx"
> +LICENSE = "TI-TSPA"
> +LIC_FILES_CHKSUM = "file://LICENCE;md5=df68504cbd0a4da1643ebcfd5783dbc9"
> +
> +SRC_URI = " \
> +	git://git.ti.com/git/cc33xx-wlan/cc33xx-fw.git;protocol=https;branch=${BRANCH}
> +"

These patches are not consistent.

This one does a multi line SRC_URI and adds the BRANCH variable.  Can we 
redo the patches to be consistent in style?  Either use BRANCH in all, 
or don't use BRANCH.  And make all of the SRC_URI and single line.


> +PV = "1.7.0.120"
> +
> +SRCREV = "988ded3a7d4d0e46de62e9ebfcb685c502bd9edf"
> +BRANCH = "master"
> +
> +CLEANBROKEN = "1"
> +
> +S = "${WORKDIR}/git"
> +
> +do_compile() {
> +    :
> +}
> +
> +do_install() {
> +    oe_runmake 'DEST_DIR=${D}' install
> +}
> +
> +FILES:${PN} = "${nonarch_base_libdir}/firmware/ti-connectivity/*"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17769): https://lists.yoctoproject.org/g/meta-ti/message/17769
> Mute This Topic: https://lists.yoctoproject.org/mt/106774314/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

