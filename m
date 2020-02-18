Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.65.1582048357278805199
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Feb 2020 09:52:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=uiRw67kb;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: denys@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01IHqaPp118981
	for <meta-ti@lists.yoctoproject.org>; Tue, 18 Feb 2020 11:52:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582048356;
	bh=CkjYPwK6El8mxXqRF4eYZWKQhSEDZ9uurQek3vEPWqE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=uiRw67kbcRngtGibOny/mQp0nBTBV9y3kSWf7y0MwriYQv5nmEXcJ7SQZMy8uzT9m
	 4A1oVWfC0hymLo2Ti4fpJDXQyRvZe/lUL2mVuzITlQ5YFqvo20520iyYZ2hXHP2eDh
	 RBk/e75RiNhTd5Wss3zCDClcsMUTWgGOJ0O44Cso=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01IHqaF2103407
	for <meta-ti@lists.yoctoproject.org>; Tue, 18 Feb 2020 11:52:36 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 18
 Feb 2020 11:52:36 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 18 Feb 2020 11:52:36 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01IHqY54092563;
	Tue, 18 Feb 2020 11:52:36 -0600
Date: Tue, 18 Feb 2020 12:52:34 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: "Andrew F. Davis" <afd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][zeus/master][PATCH] ti-sgx-ddk-um: Add runtime dependency on the SGX kernel module
Message-ID: <20200218175234.GJ720@beryl>
References: <20200218160621.26272-1-afd@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200218160621.26272-1-afd@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

I was sitting on a similar patch in a private testing branch:
https://lists.yoctoproject.org/g/meta-ti/message/12418


On Tue, Feb 18, 2020 at 11:06:21AM -0500, Andrew F. Davis wrote:
> The UM doesn't work too well without the KM side, add this dependency.
> 
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> ---
>  recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> index 129d5cee..d4bc0232 100644
> --- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> +++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> @@ -28,7 +28,7 @@ inherit update-rc.d
>  PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 virtual/libgbm"
>  
>  DEPENDS += "libdrm udev wayland wayland-protocols libffi expat"
> -RDEPENDS_${PN} += "libdrm libdrm-omap udev wayland wayland-protocols libffi expat"
> +RDEPENDS_${PN} += "libdrm libdrm-omap udev wayland wayland-protocols libffi expat ti-sgx-ddk-km"
>  
>  RPROVIDES_${PN} = "libegl libgles1 libgles2 libgbm"
>  RPROVIDES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
> -- 
> 2.17.1
> 
