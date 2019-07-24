Return-Path: <afd@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E01C7E00E0E; Wed, 24 Jul 2019 14:31:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9647BE00DF7
	for <meta-ti@yoctoproject.org>; Wed, 24 Jul 2019 14:31:15 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6OLVF5P087715
	for <meta-ti@yoctoproject.org>; Wed, 24 Jul 2019 16:31:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1564003875;
	bh=ZB7TiL0X8cUAc5/JD5Ot5dHw65ryouFBWliY9DeXyKI=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=L4Z7HdhAkWJ0EIJcrW2E4FU/7DF1KcJ2Fmn+SdO3ryNagRT02zl8kc1MiCRa1+/QY
	eHqei8SUUeXADskUKd8zmNNzJBFB7xJGC5uFcfMly2K3JcsXGhA47JbMzQeEFWrBnC
	RsmjvarjQX4ETftvm2EWlIfyPMsq1s8QTs3b3d/U=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6OLVFog060831
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 24 Jul 2019 16:31:15 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 24 Jul 2019 16:31:14 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 24 Jul 2019 16:31:14 -0500
Received: from [10.250.86.29] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6OLVE8j023436;
	Wed, 24 Jul 2019 16:31:14 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <20190719210619.18583-1-afd@ti.com>
	<20190719210619.18583-2-afd@ti.com> <20190724192429.GF5700@beryl>
	<b3d6048f-6785-e617-4187-bcda4fffc7b8@ti.com>
	<20190724202742.GI5700@beryl>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <9ff65ae6-9a3a-23d0-4d79-14b62d79a8f3@ti.com>
Date: Wed, 24 Jul 2019 17:31:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190724202742.GI5700@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [thud/master][RFC PATCH 2/3] ti-sgx-ddk-um: Add expat as runtime dependency
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
X-List-Received-Date: Wed, 24 Jul 2019 21:31:17 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/24/19 4:27 PM, Denys Dmytriyenko wrote:
> On Wed, Jul 24, 2019 at 03:29:15PM -0400, Andrew F. Davis wrote:
>> On 7/24/19 3:24 PM, Denys Dmytriyenko wrote:
>>> On Fri, Jul 19, 2019 at 05:06:18PM -0400, Andrew F. Davis wrote:
>>>> Although not needed for the IMG default EGL implementation libexpat
>>>> is needed when using the Mesa EGL version.
>>>
>>> Yes, and Rogue has it in RDEPENDS, as it uses Mesa. Why would SGX need it?
>>
>> I have SGX using Mesa now, we get some EGL extensions and much closer to
>> EGL1.5 support.
> 
> Ah, gaining EGL 1.5 would be nice...
> 

Yup, I'm just two extensions away from full EGL 1.5. That's the link
here to the GBM patches, as said, GBM depends on the EGL, so if we use
Mesa's EGL we will have to use Mesa's GBM also, not our external fork
libgbm we use now.

> 
>>>> While here s/libudev/udev as 'libudev' is package shipped as part of the
>>>> eudev project, but we use systemd, so we actually depend on 'udev'.
>>>
>>> And systemd also provides libudev. From run-time dependency, we really require 
>>> libudev, not udev. As udev is just a daemon and bunch of config files - there 
>>> is nothing to run-time depend on in there...
>>
>> That's rather confusing.., will drop change for v2
> 
> Not really that confusing. Rough high-level explanation:
> 
> For build-time dependency you depend on a recipe name, which will be built 
> before your package and available in the same namespace. I.e. <name>.bb
> 
> For run-time dependency, you depend on the specific binary package that is the 
> build output from a recipe. I.e. <name>.ipk
> 
> Some recipes generate a package with the same name (plus regular -dev, -dbg, 
> -doc, etc.). Other recipes generate multiple packages and split the output in 
> more logical way. When udev was a standalone component, it had a main udev 
> package for binaries and configs, plus an additional libudev package for the 
> library. If your component links against libudev library, it has to have 
> run-time dependency on it. While systemd absorbed udev, naming and packaging 
> remained for backward compatibility. And you can switch your device manager 
> from systemd to eudev and everything will build and work w/o modifying 
> recipes.
> 
> For normal components built from sources Bitbake handles most of this 
> automatically behind the scene and sets RDEPENDS for you based on DEPENDS 
> and info from the linker. Since this is a pre-built binary component, some 
> manual setup is required. But only RDEPENDS is required, DEPENDS can be 
> dropped, as you said below.
> 

That makes it much more clear, I was getting caught up with the DEPENDS
and RDEPENDS not having the same named components, makes more sense now.

Thanks,
Andrew

> 
>>>> Move the PACKAGE_ARCH and PR defines to a more natural spot that also
>>>> lines up with the RGX version of recipe for easier diffs.
>>>>
>>>> One thing we could have done is remove the DEPENDS line. We do not have
>>>> any build dependencies as these are pre-made library binaries, but I use
>>>> the package rootfs generated by bitbake to build the binaries locally,
>>>> so leave it for now.
>>>
>>> Is this detail really necessary for the commit message?
>>>
>>
>> Nope, just extra for the RFC, will drop from final.
>>
>> Andrew
>>
>>>
>>>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>>>> ---
>>>>  recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb | 8 ++++----
>>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
>>>> index 3c0242e2..a1e35b52 100644
>>>> --- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
>>>> +++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
>>>> @@ -3,9 +3,10 @@ HOMEPAGE = "https://git.ti.com/graphics/omap5-sgx-ddk-um-linux"
>>>>  LICENSE = "TI-TSPA"
>>>>  LIC_FILES_CHKSUM = "file://TI-Linux-Graphics-DDK-UM-Manifest.doc;md5=b17390502bc89535c86cfbbae961a2a8"
>>>>  
>>>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>>>>  COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k3"
>>>>  
>>>> -PACKAGE_ARCH = "${MACHINE_ARCH}"
>>>> +PR = "r33"
>>>>  
>>>>  BRANCH = "ti-img-sgx/thud/${PV}"
>>>>  
>>>> @@ -22,11 +23,10 @@ INITSCRIPT_PARAMS = "defaults 8"
>>>>  
>>>>  inherit update-rc.d
>>>>  
>>>> -PR = "r33"
>>>>  PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 virtual/libgbm omap5-sgx-ddk-um-linux"
>>>>  
>>>> -DEPENDS += "libdrm udev wayland libffi"
>>>> -RDEPENDS_${PN} += "libdrm libudev wayland libffi libdrm-omap"
>>>> +DEPENDS += "libdrm udev wayland libffi expat"
>>>> +RDEPENDS_${PN} += "libdrm libdrm-omap udev wayland libffi expat"
>>>>  
>>>>  RPROVIDES_${PN} = "libegl libgles1 libgles2 libgbm omap5-sgx-ddk-um-linux"
>>>>  RPROVIDES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev omap5-sgx-ddk-um-linux-dev"
>>>> -- 
>>>> 2.17.1
>>>>

