Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0E03CE00DF7; Wed, 24 Jul 2019 12:14:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E3FE7E00D90
	for <meta-ti@yoctoproject.org>; Wed, 24 Jul 2019 12:14:13 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6OJEDkX076778
	for <meta-ti@yoctoproject.org>; Wed, 24 Jul 2019 14:14:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1563995653;
	bh=Khv+1K7imR+nKILPJbkBzfUGiZxfvfv733J+iwzDpwk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=lst4QewDvdjNlRt4/xoG4lZ5HDOhT98QPyokjlXBA0Dp0ZLGq7zttUC9KXH9NgVMG
	HqKskElsW0hZt1cponB04gLMpI0rVwbOSmTaUVK+Kka9W/EhUuk4Ft1k84YndeqD/H
	ZFjyTluttg/5DIp8RB6A1bmpwJrxP8umVpPF/arE=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6OJEDkS073907
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 24 Jul 2019 14:14:13 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 24 Jul 2019 14:14:12 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 24 Jul 2019 14:14:13 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6OJECJv057364;
	Wed, 24 Jul 2019 14:14:13 -0500
Date: Wed, 24 Jul 2019 15:14:12 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Andrew F. Davis" <afd@ti.com>
Message-ID: <20190724191412.GE5700@beryl>
References: <20190719210619.18583-1-afd@ti.com>
	<20190719210619.18583-3-afd@ti.com>
MIME-Version: 1.0
In-Reply-To: <20190719210619.18583-3-afd@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [thud/master][RFC PATCH 3/3] ti-sgx-ddk-um: Drop omap5-sgx-ddk-um-linux package
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
X-List-Received-Date: Wed, 24 Jul 2019 19:14:15 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jul 19, 2019 at 05:06:19PM -0400, Andrew F. Davis wrote:
> No one depends on this and it does not really get built,
> remove this from PROVIDES.

Bah, such a nice commit message. :)

Seriously though, it is there for backward compatibility. That was the name 
of this package few years ago. Sure, "it does not get built", but claiming 
that "no one depends on this" is really a guess. There might be old recipes 
out there depending on this package by its old name...

Anyway, I don't mind dropping this backward compatibility, since it's been 
several years already, but I would like to see a better commit message.
Thanks.

-- 
Denys


> Signed-off-by: Andrew F. Davis <afd@ti.com>
> ---
>  .../libgles/ti-sgx-ddk-um_1.17.4948957.bb     | 20 +++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> index a1e35b52..10c54978 100644
> --- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> +++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> @@ -23,22 +23,22 @@ INITSCRIPT_PARAMS = "defaults 8"
>  
>  inherit update-rc.d
>  
> -PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 virtual/libgbm omap5-sgx-ddk-um-linux"
> +PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 virtual/libgbm"
>  
>  DEPENDS += "libdrm udev wayland libffi expat"
>  RDEPENDS_${PN} += "libdrm libdrm-omap udev wayland libffi expat"
>  
> -RPROVIDES_${PN} = "libegl libgles1 libgles2 libgbm omap5-sgx-ddk-um-linux"
> -RPROVIDES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev omap5-sgx-ddk-um-linux-dev"
> -RPROVIDES_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg omap5-sgx-ddk-um-linux-dbg"
> +RPROVIDES_${PN} = "libegl libgles1 libgles2 libgbm"
> +RPROVIDES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
> +RPROVIDES_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg"
>  
> -RREPLACES_${PN} = "libegl libgles1 libgles2 libgbm omap5-sgx-ddk-um-linux"
> -RREPLACES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev omap5-sgx-ddk-um-linux-dev"
> -RREPLACES_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg omap5-sgx-ddk-um-linux-dbg"
> +RREPLACES_${PN} = "libegl libgles1 libgles2 libgbm"
> +RREPLACES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
> +RREPLACES_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg"
>  
> -RCONFLICTS_${PN} = "libegl libgles1 libgles2 libgbm omap5-sgx-ddk-um-linux"
> -RCONFLICTS_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev omap5-sgx-ddk-um-linux-dev"
> -RCONFLICTS_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg omap5-sgx-ddk-um-linux-dbg"
> +RCONFLICTS_${PN} = "libegl libgles1 libgles2 libgbm"
> +RCONFLICTS_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
> +RCONFLICTS_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg"
>  
>  # The actual SONAME is libGLESv2.so.2, so need to explicitly specify RPROVIDES for .so.1 here
>  RPROVIDES_${PN} += "libGLESv2.so.1"
> -- 
> 2.17.1
> 

