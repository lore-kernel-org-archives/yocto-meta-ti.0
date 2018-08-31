Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E5C82E009AA; Thu, 30 Aug 2018 19:42:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 63CB3E00994
	for <meta-ti@yoctoproject.org>; Thu, 30 Aug 2018 19:42:28 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7V2gQo2033389;
	Thu, 30 Aug 2018 21:42:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535683346;
	bh=TP0qCGU5atb2WJAXN7Idxb3dTCCccWF5YF5JCl41kRQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=xX1viPsJsp5Yh0oJ8uAKrHO0VSmlVuQhUEMIw++OHekXn6eoUYiAIAfSsEOf3/Ie0
	vLGtmddUmUPWYTKN+HUdu6Gp/ogrTe5A/QGFKBWtL6xEFvZCPgsy90d3uLhuPlNQc0
	alTbTooUeUWHm5TPuGz3KHR8UeIrQeUOchACRFtc=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7V2gQ7x029231;
	Thu, 30 Aug 2018 21:42:26 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 30 Aug 2018 21:42:26 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 30 Aug 2018 21:42:26 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7V2gQ9O028412;
	Thu, 30 Aug 2018 21:42:26 -0500
Date: Thu, 30 Aug 2018 22:41:39 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Patkar, Sarvesh S." <sarvesh.patkar@thermofisher.com>
Message-ID: <20180831024139.GN11110@beryl>
References: <BN6PR07MB3585011B103A75E5F1964AF3E40F0@BN6PR07MB3585.namprd07.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BN6PR07MB3585011B103A75E5F1964AF3E40F0@BN6PR07MB3585.namprd07.prod.outlook.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: BeagleBone Black: cannot access USB MSC devices
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
X-List-Received-Date: Fri, 31 Aug 2018 02:42:28 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Please don't use core-image-minimal (e.g. core-image-base is much better), if 
you want to get anything useful out of it, besides just booting, including 
such tools as fdisk, lsusb, etc. Thanks.


On Fri, Aug 31, 2018 at 02:16:09AM +0000, Patkar, Sarvesh S. wrote:
> Hi,
> 
> I am a beginner in Yocto and still learning to configure the images 
> generated.
> 
> I am trying to use USB devices with the BeagleBone Black (Rev C) . 
> Specifically, I want to access a Mass Storage Class Device (a USB Flash 
> Drive) from the BeagleBone Black. I used the meta, meta-poky and meta-ti 
> layers to build a core-image-minimal image for beaglebone machine. On 
> booting up with the image, I do not see any obvious errors. However, it 
> cannot detect the presence of a USB Device connected to it. I checked this 
> using fdisk -l. lsusb command is not found.
> 
> I went through an old email chain 
> https://lists.yoctoproject.org/pipermail/linux-yocto/2014-June/002787.html 
> to find if there was a solution. One of the things mentioned was to use 
> menuconfig to configure the kernel for built-in USB support. But, I am not 
> sure if the .config file is being picked up by bitbake.
> 
> How do I enable USB support for MSC devices on BeagleBone Black?
> 
> poky branch= sumo-19.0.0
> meta-ti branch= ti2018.02
> 
> Thanks for the help!
> Sarvesh
> 

> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


