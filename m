Return-Path: <d.schultz@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A165C52D6F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 07:59:57 +0000 (UTC)
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
 by mx.groups.io with SMTP id smtpd.web11.28464.1723017590462217482
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 07 Aug 2024 00:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=a4 header.b=d+DgSNHq;
 spf=pass (domain: phytec.de, ip: 91.26.50.163, mailfrom: d.schultz@phytec.de)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1723017583; x=1725609583;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yoqoNHhACjd55aDw3G6OSxufvuspy4U1tpe9jnUeLzw=;
	b=d+DgSNHq998TTweH8bzrDevMp6uOaSDh8QBtG/xR4LgkGWAlldnPwOkJHb4wnZ2U
	erOWLldDNwEkFXOfxj62LZR5DcMtbOdNxmYAVPNOBtmAjIc1bo/QaFsv/kqR/MKx
	pJ78ZISscms/b4u9Wve6IhwPAyL/EAXcGj6qPlffJqs=;
X-AuditID: ac14000a-03251700000021bc-7d-66b3296f675f
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 1F.83.08636.F6923B66; Wed,  7 Aug 2024 09:59:43 +0200 (CEST)
Received: from [10.0.0.19] (172.25.0.11) by Berlix.phytec.de (172.25.0.12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Wed, 7 Aug 2024
 09:59:41 +0200
Message-ID: <b981ea8f-2d09-4446-8ce3-fbf37ee23dc2@phytec.de>
Date: Wed, 7 Aug 2024 09:59:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap/kirkstone] [PATCH] meta-ti-extras:
 recipes-multimedia: libdce: Fix libdce SRC_URI
To: Nishanth Menon <nm@ti.com>, Denys Dmytriyenko <denis@denix.org>, Ryan
 Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, meta-ti
	<meta-ti@lists.yoctoproject.org>
References: <20240725113703.877552-1-nm@ti.com>
Content-Language: en-US
From: Daniel Schultz <d.schultz@phytec.de>
In-Reply-To: <20240725113703.877552-1-nm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Berlix.phytec.de (172.25.0.12) To Berlix.phytec.de
 (172.25.0.12)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBLMWRmVeSWpSXmKPExsWyRpKBRzdfc3OawbW/yhZ/F79ms5j75Rab
	xZsfZ5ks/jx6yWbRcqKNzYHVY87FLlaPmaceMXscv7GdKYA5issmJTUnsyy1SN8ugStjc/9u
	1oIpXBWvT21ibmC8w9HFyMkhIWAicXfJc/YuRi4OIYElTBLdD3YyQTg3GSV650xgAqniFbCR
	eLnhLTOIzSKgInHj6C8WiLigxMmZT8BsUQF5ifu3ZrCD2MIC1RKzmz6D2SICyRL7729kA7GZ
	BYIklvx5ClYvJKAv8WnaHSaIuLjErSfzwWw2AS2JO1vmgu3iFDCQOLr4ICtEjYXE4jcH2SFs
	eYntb+cwQ8xRkJi9bTIjxDfyEtPOvWaGsEMltn7ZzjSBUXgWklNnIVk3C8nYWUjGLmBkWcUo
	lJuZnJ1alJmtV5BRWZKarJeSuokRFBsiDFw7GPvmeBxiZOJgPMQowcGsJMLbHL4pTYg3JbGy
	KrUoP76oNCe1+BCjNAeLkjjv6o7gVCGB9MSS1OzU1ILUIpgsEwenVANj1iXu0EM30mOe3L8x
	4+fh5ey3NT0mLXJLOyC1JMH5seOBif18W8ItdxW5v/2s27N2vnvDpsMxi6+4vRPtEVON/y//
	IDTsfliorbPK153bF8dtXZIVfNLwxP8qzrUXLM7Ot+/6vrkq2jH/T9Lb53MllUxmtWbOfa4R
	+z2J7+vxRV8/nlqzYXanixJLcUaioRZzUXEiAF6dNpZ7AgAA
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 07 Aug 2024 07:59:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17928

Thanks for fixing this recipe!

On 25.07.24 13:37, Nishanth Menon wrote:
> omapzoom has been down since a long time. Point the repository to the
> mirror in git.ti.com
>
> Reported-by: Daniel Schultz <d.schultz@phytec.de>
> Signed-off-by: Nishanth Menon <nm@ti.com>
Tested-by: Daniel Schultz <d.schultz@phytec.de>
> ---
>
> Daniel: please test and report if this resolves the downstream distro
> build errors seen.
>
>   meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb b/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb
> index 54f6ff8a6630..f46d9c77fc6a 100644
> --- a/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb
> +++ b/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb
> @@ -6,7 +6,8 @@ inherit autotools pkgconfig
>   
>   DEPENDS = "libdrm ti-ipc"
>   
> -SRC_URI = "git://git.omapzoom.org/repo/libdce.git;protocol=git;branch=master"
> +SRC_URI = "git://git.ti.com/git/omapzoom/libdce.git;protocol=https;branch=master"
> +
>   SRCREV = "ec14e1d5cea1ed3c3ea0e2b9cf1fd581acff93e3"
>   
>   S = "${WORKDIR}/git"
>
> base-commit: c57b63147d2ac0dde16e43f7407d0ff50e62efdb

