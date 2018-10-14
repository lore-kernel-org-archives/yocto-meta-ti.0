Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ECF28E008D7; Sun, 14 Oct 2018 12:24:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DCD13E00826
	for <meta-ti@yoctoproject.org>; Sun, 14 Oct 2018 12:24:19 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w9EJOISC006339;
	Sun, 14 Oct 2018 14:24:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1539545058;
	bh=KtrW8v53ei6TopbGdr7s4g1Z++zqRU/HL/IWdC2B2kI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=IPTiCZz0OYet7c08O/kyqHI12Q66dKU+2tk4XzJyiSMgQk/wSIHv52kRJlal3CtUa
	25p3h3E9+Usr85bJVsvP1R8YwmyfTvOGAjiEiPCbDhqpRB3Ss7bNYQIkPjJ8Tkjrut
	hjCx330X4VE68pVtW7TOZTxnV2P/DoVc8uTkCfDk=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9EJOIr3014818;
	Sun, 14 Oct 2018 14:24:18 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Sun, 14 Oct 2018 14:24:18 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Sun, 14 Oct 2018 14:24:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9EJOIVx018798;
	Sun, 14 Oct 2018 14:24:18 -0500
Date: Sun, 14 Oct 2018 15:24:18 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20181014192417.GB20670@beryl>
References: <1539399036-6199-1-git-send-email-denys@ti.com>
	<CAMKF1soZ5HFiWKDrk5jcYG1NihHaSMqmpJXMxCH9b-cKyKra7w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soZ5HFiWKDrk5jcYG1NihHaSMqmpJXMxCH9b-cKyKra7w@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] beaglebone.conf: temporarily use generic am335x_evm_config for U-boot
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
X-List-Received-Date: Sun, 14 Oct 2018 19:24:21 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sat, Oct 13, 2018 at 01:17:12AM -0700, Khem Raj wrote:
> On Fri, Oct 12, 2018 at 8:00 PM Denys Dmytriyenko <denys@ti.com> wrote:
> >
> > There have been reports recently that am335x_beaglebone_config generates bad SPL.
> > Until that is debugged and fixed, use generic am335x_evm_config that covers all
> > AM335x platforms, including BeagleBone variants.
> >
> 
> it fails to link
> 
> | arm-yoe-linux-gnueabi-ld.bfd: u-boot-spl section `.rodata' will not
> fit in region `.sram'
> | arm-yoe-linux-gnueabi-ld.bfd: region `.sram' overflowed by 5772 bytes
> | make[2]: *** [/mnt/a/yoe/build/tmp/work/beaglebone-yoe-linux-gnueabi/u-boot-ti-staging/2018.01+gitAUTOINC+2cc52408bf-r24/git/scripts/Makefile.spl:349:
> spl/u-boot-spl] Error 1

FWIW, just built u-boot-ti-staging with gcc7 and gcc8 from oe-core, as well as 
Linaro gcc7 - no problems.


> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  conf/machine/beaglebone.conf | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
> > index 49edfd6..2514792 100644
> > --- a/conf/machine/beaglebone.conf
> > +++ b/conf/machine/beaglebone.conf
> > @@ -13,7 +13,8 @@ MACHINE_GUI_CLASS = "bigscreen"
> >
> >  SERIAL_CONSOLE = "115200 ttyS0"
> >
> > -UBOOT_MACHINE = "am335x_boneblack_config"
> > +# fall back on generic am335x_evm_config for now
> > +#UBOOT_MACHINE = "am335x_boneblack_config"
> >
> >  WKS_FILE = "sdimage-bootpart.wks"
> >  IMAGE_BOOT_FILES = "MLO u-boot.img"
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

