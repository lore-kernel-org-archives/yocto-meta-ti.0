Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 46986E00B8E; Sun,  4 Aug 2019 18:47:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2DD48E00A00
	for <meta-ti@yoctoproject.org>; Sun,  4 Aug 2019 18:47:11 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x751l9KE009153;
	Sun, 4 Aug 2019 20:47:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1564969629;
	bh=tPVIS013pNTKx6JYkAgvlca0XE/KvfgGvJJfIS1N+10=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=caGcIYb/3JwdUPLx7ncO/O0MAI2jiAXXb5oO4SQth4pJAuPHWFsav/4ofiSl4pQ4o
	vRNiIq8AOFm1TkJYZ0a5t+AUlDeXhifSwSsVeRcM6XPVskchLHLM7kz+pWs+niW4C1
	N3RKTLc8nu1MY4vaKgT4uRZhlfXLleWuoGe3bVSQ=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x751l9YJ097499
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 4 Aug 2019 20:47:09 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Sun, 4 Aug 2019 20:47:09 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Sun, 4 Aug 2019 20:47:09 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x751l9Wn066109;
	Sun, 4 Aug 2019 20:47:09 -0500
Date: Sun, 4 Aug 2019 21:47:08 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Andy Pont <andy.pont@sdcsystems.com>
Message-ID: <20190805014708.GB19505@beryl>
References: <em44ffe6f3-add5-413e-994e-7c6409ff9a3f@andys-imac.local>
MIME-Version: 1.0
In-Reply-To: <em44ffe6f3-add5-413e-994e-7c6409ff9a3f@andys-imac.local>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Kernel config fragments not in deployed image.
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
X-List-Received-Date: Mon, 05 Aug 2019 01:47:13 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sun, Aug 04, 2019 at 12:03:37PM +0000, Andy Pont wrote:
> I have created a linux-ti-staging_4.19.bbappend which contains the
> following:
> 
> FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:”
> 
> SRC_URI += “ \
>   file://rtl8192cu.cfg \
> “
> 
> KERNEL_CONFIG_FRAGMENTS_append = “ \
>   ${WORKDIR}/rtl8192cu.cfg \
> “
> 
> The rtl8192cu.cfg file enables a few options to build a kernel module for
> the RTL8192 USB WiFi module:
> 
> CONFIG_RTL8192CU=m
> CONFIG_RTLWIFI=m
> CONFIG_RTLWIFI_USB=m
> CONFIG_RTLWIFI_DEBUG=y
> CONFIG_RTL8192C_COMMON=m
> 
> After rebuilding the image I can find the resultant rtl8192cu.ko file in a
> number of directories under tmp/work/beaglebone-poky-linux-gnueabi/linux-ti-staging/4.19.38+gitAUTOINC+c17c376661-r22a
> but it isn’t in the lib/modules/… directory in the deployed image.

> Subject: Kernel config fragments not in deployed image.

You are mixing few totally orthogonal things - config fragments, kernel 
modules and what gets added into a deployed image.

Config fragments change kernel configuration, which may or may not result in 
extra kernel modules. Definitely you should not expect config fragments to be 
deployed into an image, as you said in the Subject.

But once you get your modules built, you'd need to modify your image recipe to 
get those installed and be part of the corresponding image.

Depending on your image recipe, you either need to add the extra kernel module 
to RDEPENDS_${PN}, to a corresponding packagegroup or to IMAGE_INSTALL.

-- 
Denys

