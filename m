Return-Path: <s-anna@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 086F5E00C56; Mon,  8 Jul 2019 11:38:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7EDC5E00C02
	for <meta-ti@yoctoproject.org>; Mon,  8 Jul 2019 11:38:41 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x68Icfnv057357
	for <meta-ti@yoctoproject.org>; Mon, 8 Jul 2019 13:38:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562611121;
	bh=TsSv6cFn4pS1Qo2dqw1qR/JyVAPdN9KeFRevfCVMwwc=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=FYG98WXlRVN8icGi+4Ud3lyaT4KbzOI9lzrFX8zmtbzJjd7/vWceNG4LR+bYvtDGl
	OF0gkBEHHBTdYDNYr2q9qvEq11TGN6+fUAlVTkXNKNrFAnXwsOZA1ObIz5/44gBV3S
	Z3Sl00BC5BqX8qWX9oSnuIIc4QQ//viyD02HB5PQ=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x68Icf5H095035
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 8 Jul 2019 13:38:41 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 8 Jul 2019 13:38:40 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 8 Jul 2019 13:38:40 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x68IceQZ093467;
	Mon, 8 Jul 2019 13:38:40 -0500
To: Denys Dmytriyenko <denys@ti.com>, <meta-ti@yoctoproject.org>
References: <20190708171200.4139-1-denys@ti.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <1b2899cb-108c-19fe-c233-e35533b5351f@ti.com>
Date: Mon, 8 Jul 2019 13:38:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190708171200.4139-1-denys@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [thud/master][PATCH] linux-ti-staging: add configuration for remoteproc/rpmsg IPC modules
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Jul 2019 18:38:42 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/8/19 12:12 PM, Denys Dmytriyenko wrote:
> * rpmsg_client_sample is a test module and should not be autoloaded
> * Both k3_r5 and k3_dsp remoteproc modules depend on virtio_rpmsg_bus
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> Cc: Suman Anna <s-anna@ti.com>

Thanks Denys.

Reviewed-by: Suman Anna <s-anna@ti.com>

> ---
>  recipes-kernel/linux/linux-ti-staging_4.19.bb | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/recipes-kernel/linux/linux-ti-staging_4.19.bb b/recipes-kernel/linux/linux-ti-staging_4.19.bb
> index cdddd0bc..ee79abb7 100644
> --- a/recipes-kernel/linux/linux-ti-staging_4.19.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_4.19.bb
> @@ -72,3 +72,9 @@ SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
>              file://defconfig"
>  
>  FILES_${KERNEL_PACKAGE_NAME}-devicetree += "/${KERNEL_IMAGEDEST}/*.itb"
> +
> +# Special configuration for remoteproc/rpmsg IPC modules
> +module_conf_rpmsg_client_sample = "blacklist rpmsg_client_sample"
> +module_conf_ti_k3_r5_remoteproc = "softdep ti_k3_r5_remoteproc pre: virtio_rpmsg_bus"
> +module_conf_ti_k3_dsp_remoteproc = "softdep ti_k3_dsp_remoteproc pre: virtio_rpmsg_bus"
> +KERNEL_MODULE_PROBECONF += "rpmsg_client_sample ti_k3_r5_remoteproc ti_k3_dsp_remoteproc"
> 


