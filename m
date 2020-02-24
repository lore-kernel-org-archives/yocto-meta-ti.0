Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.1465.1582564328930394292
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 Feb 2020 09:12:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=KlQDqqdR;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01OHC8No023019;
	Mon, 24 Feb 2020 11:12:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582564328;
	bh=+jsWwCzC5F12zC6tO0N3oOiiZfdT9IizAzwMrkEUVmw=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=KlQDqqdRJjm2V2z+/5v7Rj1vkHFx49sm0+efoYZN46bhRv+HFwC+tQ3g3cZU3KzIg
	 b6V5BC3U5hURDmfix7Q8+ch3eGd1rOve6apoyelcGJ9xfoxc6lzX5kNtfchnpT3XcN
	 40FMNMz/VMYjk2ArDJ+4xDDvVqbvrt8+eZtHrEOo=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01OHC8L1090687
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 24 Feb 2020 11:12:08 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 24
 Feb 2020 11:12:07 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 24 Feb 2020 11:12:07 -0600
Received: from [10.250.77.18] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01OHC6CA025487;
	Mon, 24 Feb 2020 11:12:07 -0600
Subject: Re: [meta-ti] [zeus/master][PATCH 1/4] sgx-um, rogue-umlibs, gc320-libs: RRECOMMENDS on corresponding drivers
To: <denys@ti.com>, <meta-ti@yoctoproject.org>
CC: <meta-ti@lists.yoctoproject.org>
References: <20200220184722.25828-1-denys@ti.com>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <7cfa3a22-979a-df7d-2dd5-81ed956fd408@ti.com>
Date: Mon, 24 Feb 2020 12:12:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200220184722.25828-1-denys@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2/20/20 1:47 PM, Denys Dmytriyenko via Lists.Yoctoproject.Org wrote:
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb           | 2 ++
>  recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb | 4 +++-
>  recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb       | 2 ++
>  3 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> index e8c2f011..d6ecd229 100644
> --- a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> +++ b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> @@ -12,6 +12,8 @@ BRANCH = "ti-${PV}"
>  SRC_URI = "git://git.ti.com/graphics/ti-gc320-libs.git;protocol=git;branch=${BRANCH}"
>  SRCREV = "c0afab259de59909cfe74c01f3f7fbaa147f94b5"
>  
> +RRECOMMENDS_${PN} = "ti-gc320-driver"
> +


Do RRECOMMENDS pull in the package by default? If I just include in my
image "ti-gc320-libs" then I'll also get "ti-gc320-driver" automatically
in my image also right?

Andrew


>  # There's only hardfp version available
>  python __anonymous() {
>      tunes = d.getVar("TUNE_FEATURES")
> diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
> index 9cb863a5..67290756 100644
> --- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
> +++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
> @@ -27,7 +27,7 @@ PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 virtual/libgbm"
>  DEPENDS += "libdrm wayland expat"
>  RDEPENDS_${PN} += "bash"
>  RDEPENDS_${PN} += "python-core"
> -RDEPENDS_${PN} += "ti-img-rogue-driver wayland expat"
> +RDEPENDS_${PN} += "wayland expat"
>  
>  RPROVIDES_${PN} = "libegl libgles1 libgles2 libgbm"
>  RPROVIDES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
> @@ -41,6 +41,8 @@ RCONFLICTS_${PN} = "libegl libgles1 libgles2 libgbm"
>  RCONFLICTS_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
>  RCONFLICTS_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg"
>  
> +RRECOMMENDS_${PN} += "ti-img-rogue-driver"
> +
>  S = "${WORKDIR}/git"
>  
>  do_install () {
> diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> index ecf3ffcc..8b0b3058 100644
> --- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> +++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> @@ -43,6 +43,8 @@ RCONFLICTS_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg"
>  # The actual SONAME is libGLESv2.so.2, so need to explicitly specify RPROVIDES for .so.1 here
>  RPROVIDES_${PN} += "libGLESv2.so.1"
>  
> +RRECOMMENDS_${PN} += "ti-sgx-ddk-km"
> +
>  S = "${WORKDIR}/git"
>  
>  do_install () {
> 
> 
> 
> 
