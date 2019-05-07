Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 14C55E00D45; Tue,  7 May 2019 10:14:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B5B00E00950;
	Tue,  7 May 2019 10:14:23 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x47HEM4O062884;
	Tue, 7 May 2019 12:14:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1557249262;
	bh=7bXEM/Q91Czz8qxl8NOgWpMCMIy1YFm1gS7DFRRfaSE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=QOg6PoTYpghCI/54QlcCX67Aob4wGJJ1EzBPp/Tx7YmxFYOWtAGxEBi9NZqGAyT40
	6f1jKQyD/NpHd1EtQ1nlcH/z6jBvd+06IiDl2NHnIr5jF8d+4Hc0Dg8ToasidVxh7r
	WKcco/Poz4SJhrj8sFhWEJG8NICQvFPKmFwbBLeY=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x47HEMj6034691
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 May 2019 12:14:22 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 7 May 2019 12:14:21 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 7 May 2019 12:14:21 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x47HELRi010039;
	Tue, 7 May 2019 12:14:21 -0500
Date: Tue, 7 May 2019 13:14:21 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Robert Nelson <robertcnelson@gmail.com>
Message-ID: <20190507171421.GC1678@beryl>
References: <CAOe0dAV0D78sfX7W_Ge-5be8oo+W47knZAWUoTbeojqa-ezTaQ@mail.gmail.com>
	<CAOCHtYhu+Fkvvi4zADPWXoYcfUQF1GQ--SXNtdOOWqo0Xp_0Sg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOCHtYhu+Fkvvi4zADPWXoYcfUQF1GQ--SXNtdOOWqo0Xp_0Sg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org, linux-yocto@yoctoproject.org,
	AshishKumar Mishra <ashish.emailaddress@gmail.com>
Subject: Re: Meta-yocto-bsp fails to boot with META-TI [ Yocto-2.6.1]
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
X-List-Received-Date: Tue, 07 May 2019 17:14:25 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, May 07, 2019 at 11:51:41AM -0500, Robert Nelson wrote:
> On Sun, May 5, 2019 at 9:43 AM AshishKumar Mishra
> <ashish.emailaddress@gmail.com> wrote:
> >
> > Hi All ,
> > I am starting to learn Yocto & following the manual from the Yocto website
> >
> > I have added meta-ti to yocto and create the images
> >
> > Can team please provide some pointer to resolve the below error
> > or let me know if i am doing any thing wong.
> >
> > When flashed the images on SD card , the uboot is struck with below mentioned error
> >
> >
> > U-Boot#
> > U-Boot#
> > U-Boot#
> > U-Boot SPL 2014.04-00014-g47880f5 (Apr 22 2014 - 13:23:54)
> > reading args
> > spl_load_image_fat_os: error reading image args, err - -1
> > reading u-boot.img
> > reading u-boot.img
> >
> >
> > U-Boot 2014.04-00014-g47880f5 (Apr 22 2014 - 13:23:54)
> 
> Clear out your eMMC, you have a really old build of u-boot installed
> to eMMC that is blocking your new image..

Yes, I even had that mentioned in the corresponding README:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-yocto/tree/meta-yocto-bsp/README.hardware#n134

Denys


> Regards,
> 
> -- 
> Robert Nelson
> https://rcn-ee.com/
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

