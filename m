Return-Path: <e-ruei1@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E296AE00D85; Tue, 11 Jun 2019 11:44:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5DC31E00D51
	for <meta-ti@yoctoproject.org>; Tue, 11 Jun 2019 11:44:14 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5BIiATr033380;
	Tue, 11 Jun 2019 13:44:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560278650;
	bh=DsqSsLVZ6dEEQkmDilOw+o5KK6X5VkpHJ9ncMTyXtno=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=EKtUJm2DljOqYE5FOtaIBDY/b6FQ9oFnXxrNtyWh5qfQCfxgMh5O7gWhu/1OWB6j3
	1uCdZqfglF3lVi6K8lRzC/qula1wwDjn2OKxmz9jsuzSC2YPK7JiOja4pqlGkNXEv+
	bHgDMVqPmVhCa9HQQHu5Yvvraizl9xDGCGVrc6HY=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5BIiAmO030416
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Jun 2019 13:44:10 -0500
Received: from [158.218.113.148] (158.218.113.148) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 11 Jun 2019 13:44:10 -0500
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@yoctoproject.org>
References: <1560271565-27607-1-git-send-email-denis@denix.org>
From: "Ruei, Eric" <a0850410@ti.com>
Message-ID: <41c238c2-907d-5b3e-1fbb-12759fc15c40@ti.com>
Date: Tue, 11 Jun 2019 14:44:10 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1560271565-27607-1-git-send-email-denis@denix.org>
X-Originating-IP: [158.218.113.148]
X-ClientProxiedBy: DLEE100.ent.ti.com (157.170.170.30) To DLEE113.ent.ti.com
	(157.170.170.24)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [thud/master][PATCH] ti-sgx-ddk-um: add RDEPENDS on ti-sgx-ddk-km
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
X-List-Received-Date: Tue, 11 Jun 2019 18:44:15 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 6/11/2019 12:46 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>   recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> index 02c9b75..2afddfc 100644
> --- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> +++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> @@ -22,11 +22,11 @@ INITSCRIPT_PARAMS = "defaults 8"
>   
>   inherit update-rc.d
>   
> -PR = "r33"
> +PR = "r34"
>   PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 omap5-sgx-ddk-um-linux"
>   
>   DEPENDS += "libdrm udev libgbm wayland libffi"
> -RDEPENDS_${PN} += "libdrm libudev libgbm wayland libffi libdrm-omap"
> +RDEPENDS_${PN} += "ti-sgx-ddk-km libdrm libdrm-omap libudev libgbm wayland libffi"
>   
>   RPROVIDES_${PN} = "libegl libgles1 libgles2 omap5-sgx-ddk-um-linux"
>   RPROVIDES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev omap5-sgx-ddk-um-linux-dev"
> 
Hi, Denys:

Is it required? The ti-sgx-ddk-um cannot run without ti-sgx-ddk-km so 
that RDEPENDS makes sense. However, we currently build non-sgx image 
with ti-sgx-ddk-um, but without ti-sgx-ddk-km because we have not 
figured out a way to build Qt5 without openGL. The ti-sgx-ddk-um will 
not be invoked at run-time, but it is required at build time.

Best regards,

Eric


