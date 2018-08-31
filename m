Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1A35CE008FB; Fri, 31 Aug 2018 15:32:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4D951E00655
	for <meta-ti@yoctoproject.org>; Fri, 31 Aug 2018 15:32:19 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7VMWHwY027079;
	Fri, 31 Aug 2018 17:32:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535754737;
	bh=+xHX6YosNbP1CGMdBIliy2K8K9T+hjDR9OxP6Mq6Eeg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=tqUI65pIthXJkczzW/0qV/nynTu2zzGma8vTuTc2kMxB5Rbj1e0h3BvMjJaS01Dv3
	MGM1pPSyUpfQ9QKoPjHrCsojNVwoC+0motsA0ZLMytRFFzubh2dREmmGHfsx2yDKiN
	JBmKcgUW8c5eHaaRSu7ONFSNhej99LPAoV8du9hQ=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7VMWHv4022237;
	Fri, 31 Aug 2018 17:32:17 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 31 Aug 2018 17:32:16 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 31 Aug 2018 17:32:16 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7VMWGi1001579;
	Fri, 31 Aug 2018 17:32:16 -0500
Date: Fri, 31 Aug 2018 18:30:37 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Patkar, Sarvesh S." <sarvesh.patkar@thermofisher.com>
Message-ID: <20180831223037.GD2362@beryl>
References: <BN6PR07MB3585011B103A75E5F1964AF3E40F0@BN6PR07MB3585.namprd07.prod.outlook.com>
	<20180831024139.GN11110@beryl>
	<BN6PR07MB35851F8B59EB14B18FC5FBC6E40F0@BN6PR07MB3585.namprd07.prod.outlook.com>
	<20180831222931.GC2362@beryl>
MIME-Version: 1.0
In-Reply-To: <20180831222931.GC2362@beryl>
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
X-List-Received-Date: Fri, 31 Aug 2018 22:32:20 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Sorry, hit send too early.

Also try this:

# export LIBUSB_DEBUG=9
# lsusb -v

And see what the error message is.


On Fri, Aug 31, 2018 at 06:29:31PM -0400, Denys Dmytriyenko wrote:
> Do you have a complete boot log?
> 
> 
> On Fri, Aug 31, 2018 at 05:55:53PM +0000, Patkar, Sarvesh S. wrote:
> > Hi Denys,
> > 
> > Thank you for the quick reply.
> > 
> > I tried the core-image-base. I see the following on the console.
> > 
> > root@beaglebone:~# lsusb
> > unable to initialize libusb: -99
> > 
> > fdisk doesn't list the USB device as well. 
> > 
> > Is there anything else that I can try?
> > 
> > Thanks,
> > Sarvesh
> > 
> > -----Original Message-----
> > From: Denys Dmytriyenko [mailto:denys@ti.com] 
> > Sent: Thursday, August 30, 2018 7:42 PM
> > To: Patkar, Sarvesh S. <sarvesh.patkar@thermofisher.com>
> > Cc: meta-ti@yoctoproject.org
> > Subject: Re: [meta-ti] BeagleBone Black: cannot access USB MSC devices
> > 
> > 
> > Please don't use core-image-minimal (e.g. core-image-base is much better), if you want to get anything useful out of it, besides just booting, including such tools as fdisk, lsusb, etc. Thanks.
> > 
> > 
> > On Fri, Aug 31, 2018 at 02:16:09AM +0000, Patkar, Sarvesh S. wrote:
> > > Hi,
> > >
> > > I am a beginner in Yocto and still learning to configure the images 
> > > generated.
> > >
> > > I am trying to use USB devices with the BeagleBone Black (Rev C) .
> > > Specifically, I want to access a Mass Storage Class Device (a USB 
> > > Flash
> > > Drive) from the BeagleBone Black. I used the meta, meta-poky and 
> > > meta-ti layers to build a core-image-minimal image for beaglebone 
> > > machine. On booting up with the image, I do not see any obvious 
> > > errors. However, it cannot detect the presence of a USB Device 
> > > connected to it. I checked this using fdisk -l. lsusb command is not found.
> > >
> > > I went through an old email chain
> > > https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoprojec
> > > t.org_pipermail_linux-2Dyocto_2014-2DJune_002787.html&d=DwIBAg&c=q6k2D
> > > sTcEGCcCb_WtVSz6hhIl8hvYssy7sH8ZwfbbKU&r=kLMtB9EeaG0D8_vJ7xCDnkGx5TX9d
> > > c8pLS0HaMWl2-A&m=ZnXiBdSvO_0jYV33nEuRQrF7tLzUs8TgUM7hBC6IchQ&s=nMXUhOH
> > > LBBgCs7EOynlKAfyBNTlmCSJFY8uJm1C3cAY&e=
> > > to find if there was a solution. One of the things mentioned was to 
> > > use menuconfig to configure the kernel for built-in USB support. But, 
> > > I am not sure if the .config file is being picked up by bitbake.
> > >
> > > How do I enable USB support for MSC devices on BeagleBone Black?
> > >
> > > poky branch= sumo-19.0.0
> > > meta-ti branch= ti2018.02
> > >
> > > Thanks for the help!
> > > Sarvesh
> > >
> > 
> > > --
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

