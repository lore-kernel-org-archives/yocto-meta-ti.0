Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 192D8E00ABE; Wed, 17 Oct 2018 12:50:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E7ABAE00A0C
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2018 12:50:27 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w9HJoR3M066812;
	Wed, 17 Oct 2018 14:50:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1539805827;
	bh=pyiOPPXGmr1MvBY+ciTFixYoUFnjs1gDWtwONw/89V0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=QUeTKFD9xx4c6C8WXwyMSLExyBLt9QK0SPyBqTo2NMgR+wUT4WHJylvnQhfD+sJA7
	A4zGnwsGaND5OwY1Cd4rGUPq9Hf0b/m4NBhdjZi1J4oHCJj1tBtQjh3aTZCqDO9fGY
	ryvPWM5Xudi9HGhCFmxU7Dx49/6GppyASFnNB7MA=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9HJoRwC020364;
	Wed, 17 Oct 2018 14:50:27 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 17 Oct 2018 14:50:26 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 17 Oct 2018 14:50:27 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9HJoQ3Z032272;
	Wed, 17 Oct 2018 14:50:26 -0500
Date: Wed, 17 Oct 2018 15:50:26 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20181017195026.GK4031@beryl>
References: <20181017192853.42942-1-raj.khem@gmail.com>
	<20181017192853.42942-4-raj.khem@gmail.com>
	<20181017194623.GJ4031@beryl>
MIME-Version: 1.0
In-Reply-To: <20181017194623.GJ4031@beryl>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 4/5] beaglebone.conf: Package kernel and devicetree
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
X-List-Received-Date: Wed, 17 Oct 2018 19:50:29 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Oct 17, 2018 at 03:46:23PM -0400, Denys Dmytriyenko wrote:
> On Wed, Oct 17, 2018 at 12:28:52PM -0700, Khem Raj wrote:
> > Use variables from upstream u-boot, makes it easy to switch to
> > mainline u-boot from oe-core if someone wants to
> 
> Actually, those vars are not unique to upstream u-boot:
> http://arago-project.org/git/?p=meta-ti.git;a=blob;f=recipes-bsp/u-boot/u-boot-ti.inc;hb=HEAD

Sorry, had own mirror handy at the moment. :) Here's official link on YP git:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-bsp/u-boot/u-boot-ti.inc


> Lines #13 and #54.
> 
> 
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  conf/machine/beaglebone.conf | 12 +++++++++---
> >  1 file changed, 9 insertions(+), 3 deletions(-)
> > 
> > diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
> > index 25147926..9b656d01 100644
> > --- a/conf/machine/beaglebone.conf
> > +++ b/conf/machine/beaglebone.conf
> > @@ -1,6 +1,6 @@
> >  #@TYPE: Machine
> >  #@NAME: BeagleBone machine
> > -#@DESCRIPTION: Machine configuration for the http://beagleboard.org/bone board 
> > +#@DESCRIPTION: Machine configuration for the http://beagleboard.org/bone board
> >  
> >  require conf/machine/include/ti33x.inc
> >  
> > @@ -17,10 +17,16 @@ SERIAL_CONSOLE = "115200 ttyS0"
> >  #UBOOT_MACHINE = "am335x_boneblack_config"
> >  
> >  WKS_FILE = "sdimage-bootpart.wks"
> > -IMAGE_BOOT_FILES = "MLO u-boot.img"
> > -IMAGE_FSTYPES += "tar.xz wic.xz"
> >  
> >  do_image_wic[depends] += "mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
> > +IMAGE_BOOT_FILES ?= "u-boot.${UBOOT_SUFFIX} MLO"
> > +
> > +IMAGE_FSTYPES += "tar.xz wic.xz"
> >  
> >  # Refine the list of device targets for ti-pdk class recipes
> >  TI_PDK_LIMIT_BOARDS = "bbbAM335x"
> > +
> > +SPL_BINARY = "MLO"
> > +UBOOT_SUFFIX = "img"
> 
> Well, I see your point defining these 2 vars here, but then you don't use MLO 
> above for IMAGE_BOOT_FILES...
> 
> Also, it would make sense to start moving those vars into machine configs for 
> other machines. And make them conditional in u-boot recipe...
> 
> 
> > +IMAGE_INSTALL_append = " kernel-devicetree kernel-image-zimage"
> > -- 
> > 2.19.1
> > 
> > -- 
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

