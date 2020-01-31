Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.1551.1580499200382136716
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 31 Jan 2020 11:33:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Z2AL3rJr;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: denys@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00VJXJ4L077233
	for <meta-ti@lists.yoctoproject.org>; Fri, 31 Jan 2020 13:33:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580499199;
	bh=mXhn5KQCU8znn9yzrXrULhAJG0qLram2lcVI+Kyq72s=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Z2AL3rJrHiR2IyMED6gSdz3kvdvKcQADEhJhV6VjovHqAX/FrsX2LWwQVNGC17eG0
	 nV8r6ZnOdnhhqFBd/kZ3+023Sowfg3mOmZwhqLu6ydd9DZnGTXGDJ/W8ObLU5LAz2s
	 ebymAnESMW/WLUPP+X7BhDRa1OfXxmHjd7YxxKoA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00VJXJ6T080962
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 31 Jan 2020 13:33:19 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 31
 Jan 2020 13:33:19 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 31 Jan 2020 13:33:19 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00VJXJ5X058659;
	Fri, 31 Jan 2020 13:33:19 -0600
Date: Fri, 31 Jan 2020 14:33:18 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: "Andrew F. Davis" <afd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH 2/3] Move Graphics and Multimedia drivers and apps out of recipes-bsp
Message-ID: <20200131193318.GC23242@beryl>
References: <20200131192111.29813-1-afd@ti.com>
 <20200131192111.29813-2-afd@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200131192111.29813-2-afd@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jan 31, 2020 at 02:21:10PM -0500, Andrew F. Davis wrote:
> recipes-bsp is looking a bit random at the moment, lets move graphics
> recipies into recipes-graphics and some multimedia related ones into
> recipes-multimedia.

Yeah, let me sit on this one for a bit - I'm slightly torn here, as I like 
some of the new names/locations, but not all them...


> Signed-off-by: Andrew F. Davis <afd@ti.com>
> ---
>  .../{ti-img-encode-decode => vxd-dec-fw}/vxd-dec-fw_git.bb        | 0
>  .../ti-img-rogue-driver/0001-km-support-general-toolchain.patch   | 0
>  .../ti-img-rogue}/ti-img-rogue-driver_1.10.5371573.bb             | 0
>  .../{libgles => ti-img-rogue}/ti-img-rogue-umlibs_1.10.5371573.bb | 0
>  ...001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch | 0
>  .../ti-img-sgx}/ti-sgx-ddk-km_1.17.4948957.bb                     | 0
>  .../{libgles => ti-img-sgx}/ti-sgx-ddk-um_1.17.4948957.bb         | 0
>  .../ti-vivante-gc320}/ti-gc320-driver_5.0.11.p7.bb                | 0
>  .../{libgal => ti-vivante-gc320}/ti-gc320-libs_5.0.11.p7.bb       | 0
>  .../ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb            | 0
>  .../ti-img-encode-decode/viddec-test-app_1.0.0.bb                 | 0
>  .../ti-img-encode-decode/videnc-test-app_1.0.0.bb                 | 0
>  12 files changed, 0 insertions(+), 0 deletions(-)
>  rename recipes-bsp/{ti-img-encode-decode => vxd-dec-fw}/vxd-dec-fw_git.bb (100%)
>  rename {recipes-bsp/powervr-drivers => recipes-graphics/ti-img-rogue}/ti-img-rogue-driver/0001-km-support-general-toolchain.patch (100%)
>  rename {recipes-bsp/powervr-drivers => recipes-graphics/ti-img-rogue}/ti-img-rogue-driver_1.10.5371573.bb (100%)
>  rename recipes-graphics/{libgles => ti-img-rogue}/ti-img-rogue-umlibs_1.10.5371573.bb (100%)
>  rename {recipes-bsp/powervr-drivers => recipes-graphics/ti-img-sgx}/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch (100%)
>  rename {recipes-bsp/powervr-drivers => recipes-graphics/ti-img-sgx}/ti-sgx-ddk-km_1.17.4948957.bb (100%)
>  rename recipes-graphics/{libgles => ti-img-sgx}/ti-sgx-ddk-um_1.17.4948957.bb (100%)
>  rename {recipes-bsp/gc320-drivers => recipes-graphics/ti-vivante-gc320}/ti-gc320-driver_5.0.11.p7.bb (100%)
>  rename recipes-graphics/{libgal => ti-vivante-gc320}/ti-gc320-libs_5.0.11.p7.bb (100%)
>  rename {recipes-bsp => recipes-multimedia}/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb (100%)
>  rename {recipes-bsp => recipes-multimedia}/ti-img-encode-decode/viddec-test-app_1.0.0.bb (100%)
>  rename {recipes-bsp => recipes-multimedia}/ti-img-encode-decode/videnc-test-app_1.0.0.bb (100%)
> 
> diff --git a/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb b/recipes-bsp/vxd-dec-fw/vxd-dec-fw_git.bb
> similarity index 100%
> rename from recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
> rename to recipes-bsp/vxd-dec-fw/vxd-dec-fw_git.bb
> diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-km-support-general-toolchain.patch b/recipes-graphics/ti-img-rogue/ti-img-rogue-driver/0001-km-support-general-toolchain.patch
> similarity index 100%
> rename from recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-km-support-general-toolchain.patch
> rename to recipes-graphics/ti-img-rogue/ti-img-rogue-driver/0001-km-support-general-toolchain.patch
> diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb b/recipes-graphics/ti-img-rogue/ti-img-rogue-driver_1.10.5371573.bb
> similarity index 100%
> rename from recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5371573.bb
> rename to recipes-graphics/ti-img-rogue/ti-img-rogue-driver_1.10.5371573.bb
> diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb b/recipes-graphics/ti-img-rogue/ti-img-rogue-umlibs_1.10.5371573.bb
> similarity index 100%
> rename from recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
> rename to recipes-graphics/ti-img-rogue/ti-img-rogue-umlibs_1.10.5371573.bb
> diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch b/recipes-graphics/ti-img-sgx/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
> similarity index 100%
> rename from recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
> rename to recipes-graphics/ti-img-sgx/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
> diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/recipes-graphics/ti-img-sgx/ti-sgx-ddk-km_1.17.4948957.bb
> similarity index 100%
> rename from recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> rename to recipes-graphics/ti-img-sgx/ti-sgx-ddk-km_1.17.4948957.bb
> diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recipes-graphics/ti-img-sgx/ti-sgx-ddk-um_1.17.4948957.bb
> similarity index 100%
> rename from recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> rename to recipes-graphics/ti-img-sgx/ti-sgx-ddk-um_1.17.4948957.bb
> diff --git a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/recipes-graphics/ti-vivante-gc320/ti-gc320-driver_5.0.11.p7.bb
> similarity index 100%
> rename from recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> rename to recipes-graphics/ti-vivante-gc320/ti-gc320-driver_5.0.11.p7.bb
> diff --git a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb b/recipes-graphics/ti-vivante-gc320/ti-gc320-libs_5.0.11.p7.bb
> similarity index 100%
> rename from recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> rename to recipes-graphics/ti-vivante-gc320/ti-gc320-libs_5.0.11.p7.bb
> diff --git a/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb b/recipes-multimedia/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
> similarity index 100%
> rename from recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
> rename to recipes-multimedia/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
> diff --git a/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb b/recipes-multimedia/ti-img-encode-decode/viddec-test-app_1.0.0.bb
> similarity index 100%
> rename from recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
> rename to recipes-multimedia/ti-img-encode-decode/viddec-test-app_1.0.0.bb
> diff --git a/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb b/recipes-multimedia/ti-img-encode-decode/videnc-test-app_1.0.0.bb
> similarity index 100%
> rename from recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
> rename to recipes-multimedia/ti-img-encode-decode/videnc-test-app_1.0.0.bb
> -- 
> 2.17.1
> 
