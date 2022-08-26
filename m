Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF862ECAAD4
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 22:31:08 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.43498.1661553054979517612
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 Aug 2022 15:30:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=S7zL+u6A;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27QMUr6T026958;
	Fri, 26 Aug 2022 17:30:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1661553053;
	bh=4pFabEMzqNVjiQ86QJio/5wrM8IkCE5pRomVKHxoj0U=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=S7zL+u6AUY7vqhNlI6F+Rmpe4snNdvp7YIMLwsPqPBmaz9U4a16o8LgZZ4SfcwmwR
	 owrMHb1fN/a4c7EnaeWE4Z/tiS2mTDVarOCWyJY2UyWqx9WDOTyVKIYmtcNS04ddkx
	 JJIvxzLQhfNRffEJ9YTHV0yq6GkzkTVuZDJd7v0g=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27QMUrsN050550
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 Aug 2022 17:30:53 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Fri, 26
 Aug 2022 17:30:52 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Fri, 26 Aug 2022 17:30:52 -0500
Received: from [10.247.29.70] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 27QMUp16035560;
	Fri, 26 Aug 2022 17:30:51 -0500
Message-ID: <338a524d-772a-0c5a-f681-d2e60fa9a67b@ti.com>
Date: Fri, 26 Aug 2022 17:30:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [meta-ti][dunfell][PATCH 1/2] optee-os: Upgrade to upstream
 3.18.0
Content-Language: en-US
To: <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Ryan Eatmon
	<reatmon@ti.com>, Anand Gadiyar <gadiyar@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20220826191641.31116-1-afd@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20220826191641.31116-1-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 26 Aug 2022 22:31:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14974



On 8/26/2022 2:16 PM, Andrew Davis via lists.yoctoproject.org wrote:
> Update to the latest upstream master which is 3.18.0.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Reviewed-by: Praneeth Bajjuri <praneeth@ti.com>

> ---
>   recipes-security/optee/optee-os_%.bbappend | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
> index 5a25bd99..4081b324 100644
> --- a/recipes-security/optee/optee-os_%.bbappend
> +++ b/recipes-security/optee/optee-os_%.bbappend
> @@ -1,5 +1,5 @@
> -PV_ti-soc = "3.17.0+git${SRCPV}"
> -SRCREV_ti-soc = "15a746d28d10df3d79d72bc9fe4a5a654b88bcca"
> +PV_ti-soc = "3.18.0+git${SRCPV}"
> +SRCREV_ti-soc = "8e155bae3a5eb9d1a3ed9260bd7281a7a35f5086"
>   SRC_URI_ti-soc = "git://github.com/OP-TEE/optee_os.git;protocol=https"
>   
>   DEPENDS_append_ti-soc = " python3-cryptography-native"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14970): https://lists.yoctoproject.org/g/meta-ti/message/14970
> Mute This Topic: https://lists.yoctoproject.org/mt/93277310/2167429
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [praneeth@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

